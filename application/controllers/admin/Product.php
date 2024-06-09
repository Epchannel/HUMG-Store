<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Product extends MY_Controller {
    public $form_validation;
    public $upload;
    public $upload_library;
    public $pagination;

    function __construct() {
        parent::__construct();
        $this->load->model('product_model');
        $this->load->model('catalog_model');
        $this->load->model('size_model');
        $this->load->model('sizedetail_model');
        $this->load->library('form_validation');
        $this->load->helper('form');
        $this->load->library('upload');
        $this->load->library('upload_library');
    }

    public function index() {

        $message_success = $this->session->flashdata('message_success');
        $this->data['message_success'] = $message_success;

        $message_fail = $this->session->flashdata('message_fail');
        $this->data['message_fail'] = $message_fail;
        if ($this->input->post()) {
            $checkbox = $this->input->post('checkbox');
            foreach ($checkbox as $value) {
                $product = $this->product_model->get_info($value);
                $image = './upload/product/' . $product->image_link;
                if (file_exists($image)) {
                    unlink($image);
                }
                $image_list = array();
                $image_list = json_decode($product->image_list);
                if (is_array($image_list)) {
                    foreach ($image_list as $value) {
                        $image = './upload/product/' . $value;
                        if (file_exists($image)) {
                            unlink($image);
                        }
                    }
                }
            }
            $this->db->where_in('id', $checkbox);
            $this->db->delete('product');

            $flag = $this->db->affected_rows();
            if ($flag > 0) {
                $this->session->set_flashdata('message_success', 'Xóa' . $flag . 'sản phẩm thành công');
            } else {
                $this->session->set_flashdata('message_fail', 'Xóa sản phẩm thất bại');
            }
            redirect(admin_url('product'));
        }

        $total = $this->product_model->get_total();
        $this->data['total'] = $total;




        $this->load->library('pagination');
        $config = array();
        $base_url = admin_url('product/index');
        $per = 10;
        $uri = 4;
        $config = pagination($base_url, $total, $per, $uri);
        $this->pagination->initialize($config);

        $segment = isset($this->uri->segments['4']) ? $this->uri->segments['4'] : NULL;
        $segment = intval($segment);

        $input['limit'] = array($config['per_page'], $segment);

        $this->db->select('product.id as id,product.name as name,price,discount,image_link,view,buyed,catalog.name as namecatalog');
        $this->db->join('catalog', 'catalog.id = product.catalog_id');
        $product = $this->product_model->get_list($input);
        $this->data['product'] = $product;


        $this->data['temp'] = 'admin/product/index';
        $this->load->view('admin/main', $this->data);
    }

    public function add() {
        $this->data['catalog'] = $this->list_catalog();
        $this->form_validation->set_error_delimiters('<div class="alert alert-danger" role="alert" style="padding:5px;border-bottom:0px;">', '</div>');

        if ($this->input->post()) {
            $this->form_validation->set_rules('name', 'Tên sản phẩm', 'required');
            $this->form_validation->set_rules('catalog_id', 'Danh mục sản phẩm', 'required');
            $this->form_validation->set_rules('price', 'Giá sản phẩm', 'required');
            $this->form_validation->set_rules('image', 'Hình ảnh sản phẩm', 'required');

            if ($this->form_validation->run()) {
                $path = './upload/product/';
                $image_link = '';
                $image_link = $this->upload_library->upload($path, 'image');

                $image_list = array();
                $image_list = $this->upload_library->upload_file($path, 'list_image');
                $image_list = json_encode($image_list);

                $data = array();
                $data = array(
                    'name' => $this->input->post('name'),
                    'image_link' => $image_link,
                    'image_list' => $image_list,
                    'content' => $this->input->post('content'),
                    'catalog_id' => $this->input->post('catalog_id'),
                    'price' => $this->input->post('price'),
                    'discount' => $this->input->post('discount'),
                    'created' => now()
                );

                if ($this->product_model->create($data)) {
                    //thêm detail size
                    $data1 = array();
                    $input = array();
                    $sizes = $this->size_model->get_list($input);
                    foreach ($sizes as $size) {
                        $id_size = $this->input->post('size_' . $size->id);
                        $quantity = $this->input->post('quantity_' . $size->id);
                        if ($id_size > 0 && $quantity > 0) {
                            $input = array();
                            $input['order'] = array('id', 'DESC');
                            $input['limit'] = array('1', '0');
                            $get_id = $this->product_model->get_list($input);
                            $id_pro = $get_id[0]->id;
                            $data2 = array();
                            $data2 = array(
                                'product_id' => $id_pro,
                                'size_id' => $id_size,
                                'quantity' => $quantity,
                            );
                            $this->sizedetail_model->create($data2);
                        }
                    }
                    $this->session->set_flashdata('message_success', 'Thêm sản phẩm thành công');
                } else {
                    $this->session->set_flashdata('message_fail', 'Thêm sản phẩm thất bại');
                }
                redirect(admin_url('product'));
            }
        }

        $this->data['temp'] = 'admin/product/add';
        $this->load->view('admin/main', $this->data);
    }

    public function edit() {
        $this->data['catalog'] = $this->list_catalog();
        $id = $this->uri->segment(4);
        $product = $this->product_model->get_info($id);

        $input = array();
        $input['where'] = array('product_id' => $id);
        $sizes = $this->sizedetail_model->get_list($input);
        $this->data['sizes'] = $sizes;

        $str = '';
        foreach ($sizes as $s) {
            $str = $str . ' AND id NOT IN(' . $s->size_id . ')';
        }
        $get_size = 'SELECT * FROM sizes WHERE sizes.id ' . $str . ' ';

        $sizes2 = $this->size_model->query3($get_size);
        $this->data['sizes2'] = $sizes2;






        if (empty($product)) {
            $this->session->set_flashdata('message_fail', 'Sản phẩm không tồn tại');
            redirect(admin_url('product'));
        }
        $this->data['product'] = $product;
        if ($this->input->post()) {
            $this->form_validation->set_rules('name', 'Tên sản phẩm', 'required');
            $this->form_validation->set_rules('catalog_id', 'sản phẩm', 'required');
            $this->form_validation->set_rules('price', 'Giá sản phẩm', 'required');
            if ($this->form_validation->run()) {
                $price = $this->input->post('price');
                $discount = $this->input->post('discount');
                $data = array();
                $data = array(
                    'name' => $this->input->post('name'),
                    'content' => $this->input->post('content'),
                    'catalog_id' => $this->input->post('catalog_id'),
                    'price' => str_replace(',', '', $price),
                    'discount' => str_replace(',', '', $discount)
                );
                $path = './upload/product/';
                $image_link = '';
                $image_link = $this->upload_library->upload($path, 'image');
                if ($image_link != '') {
                    $data['image_link'] = $image_link;
                    $image = './upload/product/' . $product->image_link;
                    if (file_exists($image)) {
                        unlink($image);
                    }
                }
                $image_list = array();
                $image_list = $this->upload_library->upload_file($path, 'list_image');
                $image_list_json = json_encode($image_list);
                if (!empty($image_list)) {
                    $data['image_list'] = $image_list_json;
                    $image_list = json_decode($product->image_list);
                    if (is_array($image_list)) {
                        foreach ($image_list as $value) {
                            $image = './upload/product/' . $value;
                            if (file_exists($image)) {
                                unlink($image);
                            }
                        }
                    }
                }
                if ($this->product_model->update($id, $data)) {
                    //thêm detail size
                    $data1 = array();
                    $input = array();
                    $sizes = $this->size_model->get_list($input);
                    foreach ($sizes as $size) {
                        $id_size = $this->input->post('size_' . $size->id);
                        $quantity = $this->input->post('quantity_' . $size->id);
                        if ($id_size > 0 && $quantity > 0) {
                            $input = array();
                            $input['where'] = array('product_id' => $id, 'size_id' => $id_size);
                            $input['order'] = array('id', 'DESC');
                            $input['limit'] = array('1', '0');
                            $get_id = $this->sizedetail_model->get_list($input);
                            if (sizeof($get_id) != 0)
                                $id_update_size = $get_id[0]->id;
                            else
                                $id_update_size = 0;

                            if ($id_update_size != 0) {
                                $data2 = array();
                                $data2 = array(
                                    'product_id' => $id,
                                    'size_id' => $id_size,
                                    'quantity' => $quantity,
                                );
                                $this->sizedetail_model->update($id_update_size, $data2);
                            } else {
                                if ($id_size > 0 && $quantity == 0) {
                                    $input = array();
                                    $input['where'] = array('product_id' => $id, 'size_id' => $id_size);
                                    $input['order'] = array('id', 'DESC');
                                    $input['limit'] = array('1', '0');
                                    $get_id = $this->sizedetail_model->get_list($input);
                                    $id_update_size = $get_id[0]->id;
                                    if ($id_update_size != 0) {
                                        $this->sizedetail_model->delete($id_update_size);
                                    }
                                } else {
                                    $data2 = array();
                                    $data2 = array(
                                        'product_id' => $id,
                                        'size_id' => $id_size,
                                        'quantity' => $quantity,
                                    );
                                    $this->sizedetail_model->create($data2);
                                }
                            }
                        } else {
                            
                        }
                    }
                    $this->session->set_flashdata('message_success', 'Thay đổi sản phẩm thành công');
                } else {
                    $this->session->set_flashdata('message_fail', 'Thay đổi sản phẩm thất bại');
                }
                redirect(admin_url('product'));
            }
        }

        $this->data['temp'] = 'admin/product/edit';
        $this->load->view('admin/main', $this->data);
    }

    public function del() {
        $id = isset($_POST['id']) ? $_POST['id'] : 'NULL';
        $product = $this->product_model->get_info($id);

        $this->data['product'] = $product;

        $input = array();
        $input['where'] = array('product_id' => $product->id);
        $sizedetail = $this->sizedetail_model->get_list($input);
        if (sizeof($sizedetail) != 0) {
            foreach ($sizedetail as $a) {
                $this->sizedetail_model->delete($a->id);
            }
        }
        echo 'success';

//        if ($this->product_model->delete($id)) {
//            $image = './upload/product/' . $product->image_link;
//            if (file_exists($image)) {
//                unlink($image);
//            }
//            $image_list = array();
//            $image_list = json_decode($product->image_list);
//            if (is_array($image_list)) {
//                foreach ($image_list as $value) {
//                    $image = './upload/product/' . $value;
//                    if (file_exists($image)) {
//                        unlink($image);
//                    }
//                }
//            }
//            echo 'success';
//        } else {
//            echo 'failer';
//        }
    }

    protected function list_catalog() {
        $input = array();
        $input['where'] = array('parent_id' => '1');
        $input['order'] = array('sort_order', 'asc');
        $catalog = $this->catalog_model->get_list($input);
        foreach ($catalog as $value) {
            $input['where'] = array('parent_id' => $value->id);
            $subs = $this->catalog_model->get_list($input);
            $value->sub = $subs;
        }
        return $catalog;
    }

    public function search() {
        if ($this->input->post('search') != null) {
            $input = array();
            $str = $this->input->post('search');
//            $input['where'] = array('name', 'LIKE %' . $str . '% ');

            $this->db->select('product.id as id,product.name as name,price,discount,image_link,view,buyed,catalog.name as namecatalog');
            $this->db->join('catalog', 'catalog.id = product.catalog_id');
            $this->db->where('product.name LIKE "%' . $str . '%" ');
            $product = $this->product_model->get_list($input);
            $this->data['product'] = $product;
            if (sizeof($product) == 0) {
                $this->session->set_flashdata('message_fail', 'Không tìm thấy sản phẩm');
                redirect(admin_url('product'));
            }
            $total = sizeof($product);
            $this->data['total'] = $total;
            $this->load->library('pagination');
            $config = array();
            $base_url = admin_url('product/search');
            $per = 10;
            $uri = 4;
            $config = pagination($base_url, $total, $per, $uri);
            $this->pagination->initialize($config);

            $segment = isset($this->uri->segments['4']) ? $this->uri->segments['4'] : NULL;
            $segment = intval($segment);

            $input['limit'] = array($config['per_page'], $segment);

            $this->data['temp'] = 'admin/product/search';
            $this->load->view('admin/main', $this->data);
        } else {
            redirect(admin_url('product'));
        }
    }

}
