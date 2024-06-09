<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Cart extends MY_Controller {
    public $form_validation;


    public function __construct() {
        parent::__construct();

        $this->load->library('cart');
        $this->load->model('product_model');
        $this->load->model('catalog_model');
        $this->load->model('size_model');
        $this->load->model('sizedetail_model');
        $this->load->library('form_validation');
        $this->load->helper('form');
    }

    public function index() {
        $message = $this->session->flashdata('message');
        $this->data['message'] = $message;

        $carts = $this->cart->contents();
        $this->data['carts'] = $carts;






        $total_items = $this->cart->total_items();
        $this->data['total_items'] = $total_items;

        $this->data['temp'] = 'site/cart/index';
        $this->load->view('site/layoutsub', $this->data);
    }

    public function add() {
        $id = $this->uri->rsegment(3);
        $id = intval($id);
        $product = $this->product_model->get_info($id);
        $carts = $this->cart->contents();
        if (empty($carts)) {
            $data = array();
            $qty = 1;

            $input = array();
            $input['where'] = array('product_id' => $id);
            $input['order'] = array('size_id', 'ASC');
            $input['limit'] = array('1', '0');
            $size_min = $this->sizedetail_model->get_list($input);
            $size_id = $size_min[0]->size_id;



            $price = $product->price;

            if ($product->discount > 0) {
                $price = $product->price - $product->discount;
            }

            $data['cartid'] = 1;
            $data['id'] = $id;
            $data['qty'] = $qty;
            $data['price'] = $price;
            $data['name'] = $product->name;
            $data['image_link'] = $product->image_link;
            $data['size'] = $size_id;
            $this->cart->insert($data);
            redirect(base_url('cart'));
        } else {
            foreach ($carts as $key => $value) {
                if ($value['id'] == $id && $value['qty'] >0) {
                    $this->session->set_flashdata('message', 'Sản phẩm đã tồn tại');
                    redirect(base_url('cart'));
                } else {
                    $data = array();
                    $qty = 1;
                    $size_id = 1;
                    $price = $product->price;

                    if ($product->discount > 0) {
                        $price = $product->price - $product->discount;
                    }

                    $data['cartid'] = $this->cart->total_items() + 1;
                    $data['id'] = $id;
                    $data['qty'] = $qty;
                    $data['price'] = $price;
                    $data['name'] = $product->name;
                    $data['image_link'] = $product->image_link;
                    $data['size'] = $size_id;
                    $this->cart->insert($data);
                    redirect(base_url('cart'));
                }
            }
        }
    }

    public function update() {
        $carts = $this->cart->contents();
        $id = $this->uri->segment(3);
        $str = $this->uri->segment(4);

        foreach ($carts as $key => $value) {
            if ($value['cartid'] == $id) {
                if ($str == 'sum') {
                    //lấy size
                    $input = array();
                    $input = array('product_id' => $value['id'], 'size_id' => $value['size']);
                    $size_row = $this->sizedetail_model->get_info_rule($input, 'quantity');
                    $count = $size_row->quantity;
                    if ($value['qty'] + 1 > $count) {
                        $this->session->set_flashdata('message', 'Số lượng đã hết');
                    } else {
                        $data = array();
                        $data['rowid'] = $key;
                        $data['qty'] = $value['qty'] + 1;
                        $this->cart->update($data);
                    }
                } elseif ($str == 'sub') {
                    $data = array();
                    $data['rowid'] = $key;
                    $data['qty'] = $value['qty'] - 1;
                    $this->cart->update($data);
                }
            }
        }
        redirect(base_url('cart'));
    }

    public function del() {
        $carts = $this->cart->contents();
        $id = $this->uri->segment(3);
        $id = intval($id);
        if ($id > 0) {
            foreach ($carts as $key => $value) {
                if ($value['cartid'] == $id) {
                    $data = array();
                    $data['rowid'] = $key;
                    $data['qty'] = 0;
                    $this->cart->update($data);
                    $this->session->set_flashdata('message', 'Xóa sản phẩm thành công');
                    redirect(base_url('cart'));
                }
            }
        } else {
            $this->cart->destroy();
            $this->session->set_flashdata('message', 'Xóa giỏ hàng thành công');
            redirect(base_url('cart'));
        }
    }

    public function newsize() {
        $carts = $this->cart->contents();
        $id = $this->uri->segment(3);
        $product = $this->product_model->get_info($id);
        $data_size_index = array();
        foreach ($carts as $key => $value) {
            if ($value['id'] == $id && $value['qty'] >0) {
                array_push($data_size_index, $value['size']);
            }
        }
        $str = '';
        for ($i = 0; $i < sizeof($data_size_index); $i++) {
            $str = $str . ' AND size_id NOT IN(' . $data_size_index[$i] . ')';
        }
        $get_size = 'SELECT size_id FROM sizedetail WHERE product_id = ' . $id . $str . 'ORDER BY size_id ASC LIMIT 1';
        $result = $this->sizedetail_model->query2($get_size);
        $size_new = $result->size_id;
        if ($size_new != 0) {
            $data = array();
            $qty = 1;
            $price = $product->price;

            if ($product->discount > 0) {
                $price = $product->price - $product->discount;
            }

            $data['cartid'] = $this->cart->total_items() + 1;
            $data['id'] = $id;
            $data['qty'] = $qty;
            $data['price'] = $price;
            $data['name'] = $product->name;
            $data['image_link'] = $product->image_link;
            $data['size'] = $size_new;
            $this->cart->insert($data);
            redirect(base_url('cart'));
        } else {
            $this->session->set_flashdata('message', 'Đã hết loại size');
            redirect(base_url('cart'));
        }
    }

    public function sumsize() {
        //lấy size
        $carts = $this->cart->contents();
        $cardid = $this->uri->segment(3);
        $id = $this->uri->segment(4);
        $product = $this->product_model->get_info($id);
        $data_size_index = array();
        foreach ($carts as $key => $value) {
            if ($value['id'] == $id && $value['qty'] >0) {
                array_push($data_size_index, $value['size']);
            }
        }
        $str = '';
        for ($i = 0; $i < sizeof($data_size_index); $i++) {
            $str = $str . ' AND size_id NOT IN(' . $data_size_index[$i] . ')';
        }
        $get_size = 'SELECT size_id FROM sizedetail WHERE product_id = ' . $id . $str . ' ORDER BY size_id ASC LIMIT 1';
        $result = $this->sizedetail_model->query2($get_size);
        $size_sum = $result->size_id;
        if ($size_sum != 0) {
            foreach ($carts as $key => $value) {
                if ($value['cartid'] == $cardid) {
                    $input = array();
                    $input = array('product_id' => $value['id'], 'size_id' => $size_sum);
                    $size_row = $this->sizedetail_model->get_info_rule($input, 'quantity');
                    $count = $size_row->quantity;
                    if ($value['qty'] > $count) {
                        $data = array();
                        $data['rowid'] = $key;
                        $data['qty'] = $count;
                        $data['size'] = $size_sum;
                        $this->cart->update($data);
                    } else {
                        $data = array();
                        $data['rowid'] = $key;
                        $data['size'] = $size_sum;
                        $this->cart->update($data);
                    }
                }
            }
            redirect(base_url('cart'));
        } else {
            $this->session->set_flashdata('message', 'Đã hết loại size');
            redirect(base_url('cart'));
        }
    }
    public function subsize() {
        //lấy size
        $carts = $this->cart->contents();
        $cardid = $this->uri->segment(3);
        $id = $this->uri->segment(4);
        $product = $this->product_model->get_info($id);
        $data_size_index = array();
        foreach ($carts as $key => $value) {
            if ($value['id'] == $id && $value['qty'] >0) {
                array_push($data_size_index, $value['size']);
            }
        }
        $str = '';
        for ($i = 0; $i < sizeof($data_size_index); $i++) {
            $str = $str . ' AND size_id NOT IN(' . $data_size_index[$i] . ')';
        }
        $get_size = 'SELECT size_id FROM sizedetail WHERE product_id = ' . $id . $str . ' ORDER BY size_id DESC LIMIT 1';
        $result = $this->sizedetail_model->query2($get_size);
        $size_sub = $result->size_id;
        if ($size_sub != 0) {
            foreach ($carts as $key => $value) {
                if ($value['cartid'] == $cardid) {
                    $input = array();
                    $input = array('product_id' => $value['id'], 'size_id' => $size_sub);
                    $size_row = $this->sizedetail_model->get_info_rule($input, 'quantity');
                    $count = $size_row->quantity;
                    if ($value['qty'] > $count) {
                        $data = array();
                        $data['rowid'] = $key;
                        $data['qty'] = $count;
                        $data['size'] = $size_sub;
                        $this->cart->update($data);
                    } else {
                        $data = array();
                        $data['rowid'] = $key;
                        $data['size'] = $size_sub;
                        $this->cart->update($data);
                    }
                }
            }
            redirect(base_url('cart'));
        } else {
            $this->session->set_flashdata('message', 'Đã hết loại size');
            redirect(base_url('cart'));
        }
    }
}
