<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Order extends MY_Controller {
    public $province_model;
    public $district_model;
    public $ward_model;
    public $shipping_model;
    public $form_validation;

    public function __construct() {
        parent::__construct();

        $this->load->model('size_model');
        $this->load->model('province_model');
        $this->load->model('district_model');
        $this->load->model('product_model');
        $this->load->model('sizedetail_model');
        $this->load->model('ward_model');
        $this->load->model('shipping_model');
        $this->load->library('form_validation');
        $this->load->helper('form');
    }

    public function index() {


        $this->form_validation->set_error_delimiters('<div class="alert alert-danger" role="alert" style="padding:5px;border-bottom:0px;">', '</div>');

        $carts = $this->cart->contents();


        $total_amount = 0;
        foreach ($carts as $value) {
            $total_amount = $total_amount + $value['subtotal'];
        }
        $this->data['total_amount'] = $total_amount;
        $user_id = 0;
        if ($this->session->userdata('user')) {
            $user = $this->session->userdata('user');
            $user_id = $user->id;
        }
        $input = array();
        $input['shipping'] = array('id', 'ASC');
        $shipping = $this->shipping_model->get_list($input);
        $this->data['shipping'] = $shipping;

        if ($this->input->post()) {

            $this->form_validation->set_rules('name', 'Họ tên', 'required');
            $this->form_validation->set_rules('phone', 'Điện thoại', 'required');
            $this->form_validation->set_rules('province', 'Tỉnh,thành phố', 'required');
            $this->form_validation->set_rules('district', 'Quận,Huyện', 'required');
            $this->form_validation->set_rules('ward', 'Xã,Phường', 'required');
            $this->form_validation->set_rules('ship_money', 'Dịch vụ vận chuyển', 'required');

            if ($this->form_validation->run()) {


                $adress_str = $this->input->post('adress') . ' - ' . $this->input->post('area');

                $ship = $this->input->post('ship_money');

                $mess2 = 'Phí Ship:' . ' ' . strval(number_format($ship)) . 'VNĐ';

                $data = array();
                $data = array(
                    'user_id' => $user_id,
                    'user_name' => $this->input->post('name'),
                    'user_email' => $this->input->post('email'),
                    'user_address' => $adress_str,
                    'user_phone' => $this->input->post('phone'),
                    'message' => $this->input->post('message') . " " . $mess2,
                    'amount' => $total_amount + $ship,
                    'created' => now()
                );
                $this->load->model('transaction_model');
                $this->transaction_model->create($data);
                $transaction_id = $this->db->insert_id();

                $this->load->model('order_model');
                foreach ($carts as $items) {
                    $data = array();
                    $data = array(
                        'transaction_id' => $transaction_id,
                        'product_id' => $items['id'],
                        'qty' => $items['qty'],
                        'amount' => $items['subtotal'],
                        'size_id' => '0'.intval($items['size'])
                    );
                    $this->order_model->create($data);
                    //Cộng lượt mua
                    $product = $this->product_model->get_info($items['id']);
                    $data4 = array();
                    $sl = $product->buyed + intval($items['qty']);
                    $data4['buyed'] = $sl;
                    $this->product_model->update($product->id, $data4);
                    //trừ số lượng
                    $input1['where'] = array('product_id' => $items['id'], 'size_id' => $items['size']);
                    $size_detail = $this->sizedetail_model->get_list($input1);
                    if (sizeof($size_detail) != 0) {
                        $id_update_size = $size_detail[0]->id;
                        $amount = $size_detail[0]->quantity - $items['qty'];
                        if ($id_update_size != 0 && $amount > 0) {
                            $data2 = array();
                            $data2 = array(
                                'product_id' => $items['id'],
                                'size_id' => '0'.intval($items['size']),
                                'quantity' => $amount,
                            );
                            $this->sizedetail_model->update($id_update_size, $data2);
                        } elseif ($id_update_size != 0 && $amount == 0) {
                            $this->sizedetail_model->delete($id_update_size);
                        }
                    }
                }
                $this->cart->destroy();
                $this->session->set_flashdata('message', "Đặt hàng thành công, chúng tôi sẽ liên hệ với bạn để giao hàng");
                redirect(base_url('cart'));
            }
        }



        $this->data['temp'] = 'site/order/index';
        $this->load->view('site/layoutsub', $this->data);
    }

}
