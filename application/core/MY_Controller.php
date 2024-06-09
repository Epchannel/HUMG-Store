<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class MY_Controller extends CI_Controller {
    public $size_model; 
    public $slider_model; 
    public $sizedetail_model; 
    public $product_model; 
    public $session;
    public $cart;
    public $catalog_model;
    public $db;
    public $data;

    function __construct()
    {
        parent::__construct();
        
        // Khởi tạo các thư viện và mô hình cần thiết
        $this->load->library('session');
        $this->load->library('cart');
        $this->load->model('catalog_model');
        $this->load->model('size_model');
        $this->load->model('slider_model');
        $this->load->model('sizedetail_model');
        $this->load->model('product_model');
        $this->data = array();
        
        $controller = $this->uri->segment(1);
        switch ($controller) {
            case 'admin':
                $this->load->helper('admin');
                $this->_checklogin();
                $login = $this->session->userdata("login");
                $this->data['login'] = $login;
                break;
            
            default:
                $this->load->model('catalog_model');
                $input = array();
                $input['where'] = array('parent_id' => '1');
                $input['order'] = array('sort_order', 'ASC');
                $catalog = $this->catalog_model->get_list($input);
                foreach ($catalog as $value) {
                    $input= array();
                    $input['where'] = array('parent_id' => $value->id);
                    $input['order'] = array('sort_order', 'ASC');
                    $sub = $this->catalog_model->get_list($input);
                    $value->sub = $sub;
                }
                $this->data['catalog'] = $catalog;
                
                $user = $this->session->userdata('user');
                $this->data['user'] = $user;

                $carts = $this->cart->contents();
                $this->data['carts'] = $carts;
                $total_items = $this->cart->total_items();
                $this->data['total_items'] = $total_items;
                break;
        }
    }

    protected function _checklogin()
    {
        $controller = $this->uri->segment(2);
        $login = $this->session->userdata("login");
        if (!isset($login) && $controller != 'login') {
            redirect(admin_url('login'));
        }
        if (isset($login) && $controller == 'login') {
            redirect(admin_url('home'));
        }
    } 
}
