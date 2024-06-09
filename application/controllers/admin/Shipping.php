<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Shipping extends MY_Controller {
	public $shipping_model;
    public $form_validation;
    public $upload;
    public $upload_library;


	function __construct()
	{
		parent::__construct();
		$this->load->model('shipping_model');
		$this->load->library('form_validation');
		$this->load->helper('form');
		$this->load->library('upload');
		$this->load->library('upload_library');
	}
	public function index()
	{
		$message_success = $this->session->flashdata('message_success');
		$this->data['message_success'] = $message_success;

		$message_fail = $this->session->flashdata('message_fail');
		$this->data['message_fail'] = $message_fail;

		$input = array();
		$input['shipping'] = array('id' , 'ASC');
		$shipping = $this->shipping_model->get_list($input);
		$this->data['shipping']= $shipping;

		$this->data['temp']='admin/shipping/index.php';
		$this->load->view('admin/main',$this->data);
	}
	
	public function edit()
	{
		$id = $this->uri->segment(4);
		$shipping = $this->shipping_model->get_info($id);
		if (empty($shipping)) {
			$this->session->set_flashdata('message_fail', 'Đối tác không tồn tại');
			redirect(admin_url('shipping'));
		}
		$this->data['shipping'] = $shipping; 
                
		if ($this->input->post()) {
			$this->form_validation->set_rules('province','Tên tỉnh,thành phố','required');
			$this->form_validation->set_rules('district','Tên quận, huyện','required');
			if ($this->form_validation->run()) {
				$data = array();
				$data = array(
					'id_province' => $this->input->post('province'),
					'id_district' => $this->input->post('district'),
					'name_province' => $this->input->post('name_province'),
                                        'name_district' => $this->input->post('name_district')
					);
				
				
				if ($this->shipping_model->update($id,$data)) {
					$this->session->set_flashdata('message_success', 'Thay đổi đối tác thành công');
				}else{
					$this->session->set_flashdata('message_fail', 'Thay đổi đối tác thất bại');
				}
				redirect(admin_url('shipping'));
			}
		}

		$this->data['temp']='admin/shipping/edit';
		$this->load->view('admin/main',$this->data);
	}
	
}
