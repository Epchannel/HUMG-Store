<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends MY_Controller {
    public $transaction_model;
    public $user_model;
    public $comment_model;
    public $admin_model;

    function __construct() {
        parent::__construct();
        $this->load->model('transaction_model');
        $this->load->model('user_model');
        $this->load->model('comment_model');
        $this->load->model('admin_model');
        $this->load->model('product_model');
    }

    public function index() {
        $input = array();
        $total_order = $this->transaction_model->get_total($input);
        $this->data['total_order'] = $total_order;
        //khach hang
        $input = array();
        $total_user = $this->user_model->get_total($input);
        $this->data['total_user'] = $total_user;
        //binh luan
        $input = array();
        $total_comment = $this->comment_model->get_total($input);
        $this->data['total_comment'] = $total_comment;
        //nhan vien
        $input = array();
        $input['where'] = array('level' => '1');
        $total_mod = $this->admin_model->get_total($input);
        $this->data['total_mod'] = $total_mod;

        //lay nam
        $str = "Select DISTINCT YEAR(from_unixtime(transaction.created)) as 'Nam'
                FROM transaction
                WHERE `transaction`.`status` = 1";

        $year = $this->transaction_model->query3($str);
        $this->data['year'] = $year;

        //Tong so luong san pham
        $str_slc = "SELECT
                    SUM(sizedetail.quantity) AS 'soluongcon'
                 FROM
                     product,
                     sizedetail
                 WHERE
                     product.id = sizedetail.product_id
                 LIMIT 0, 10000";

        $slc = $this->product_model->query3($str_slc);
        $this->data['slc'] = $slc;

        $str_slb = "SELECT
                    SUM(`order`.`qty`) AS 'soluongban'
                FROM
                    product,
                    `order`
                WHERE
                    product.id = `order`.product_id";

        $slb = $this->product_model->query3($str_slb);
        $this->data['slb'] = $slb;
        $sum_sl = $slc[0]->soluongcon + $slb[0]->soluongban;
        if($sum_sl != 0){
            
            $data_pro = round(($slb[0]->soluongban / $sum_sl) * 100);
        }
        else{
            $data_pro = 0;
        }
        //Số luongj giam giá
        $str_dis = "SELECT * FROM `product` WHERE `discount` NOT IN(0) LIMIT 0,10000";
        $pro_dis = $this->product_model->query3($str_dis);
        
        //soluong san pham
       $str_to = "SELECT * FROM `product` LIMIT 0,10000";
       $pro_total = $this->product_model->query3($str_to);
        
       if(sizeof($pro_total) != 0){
            $data_dis = round((sizeof($pro_dis)/sizeof($pro_total))*100);
            $this->data['data_dis'] = $data_dis;
       } else {
            $data_dis = 0;
            $this->data['data_dis'] = $data_dis;
       }
        //Đơn hàng
        $str12 = "SELECT COUNT(*) as sl FROM transaction WHERE transaction.`status`= 1 LIMIT 0,10000";
        $tra_dis = $this->product_model->query3($str12);
        
        $str13 = "SELECT COUNT(*) as sl  FROM transaction  LIMIT 0,10000";
        $tra_to = $this->product_model->query3($str13);
        
        if($tra_to[0]->sl != 0){
            $data_tran = round(($tra_dis[0]->sl/$tra_to[0]->sl)*100);
            $this->data['data_tran'] = $data_tran;
        
        }else{
            $data_tran = 0;
            $this->data['data_tran'] = $data_tran;
        }
        //Binh luan
        $str_conmment = "SELECT DISTINCT comment.product_id FROM `comment`";
        $comment_am = $this->comment_model->query3($str_conmment);
        if(sizeof($pro_total) != 0){
            $data_comment_per =  round((sizeof($comment_am)/sizeof($pro_total))*100);
        }else{
            $data_comment_per = 0;
        }
        $this->data['data_comment_per'] = $data_comment_per;
        
        $year_post = 0;
        $sale = 0;
        $data_mounth = array();
        $data_sale = array();
        $data_mounth = array(0);
        $data_sale = array(0, 1000);
        if ($this->input->post()) {
            if ($this->input->post('year') != 0) {
                $year_post = $this->input->post('year');
                $str1 = "Select MONTH(from_unixtime(transaction.created)) as 'Thang',SUM(transaction.`amount`) as money
                        FROM transaction,`order`
                        WHERE transaction.id = `order`.`transaction_id` AND `transaction`.`status` = 1 AND YEAR(from_unixtime(transaction.created)) = " . $year_post . " 
                        GROUP BY  Thang LIMIT 0, 10000";
                $data_big = $this->transaction_model->query3($str1);
                $this->data['data_big'] = $data_big;
                $data_mounth = array(0);
                $data_sale = array(0);
                foreach ($data_big as $d) {
                    array_push($data_mounth, 'Tháng ' . $d->Thang);
                    array_push($data_sale, number_format($d->money, 0, '.', ''));
                }

                //tong doanh thu

                $str2 = "Select YEAR(from_unixtime(transaction.created)) as 'Thang',SUM(transaction.`amount`) as money
                        FROM transaction,`order`
                        WHERE transaction.id = `order`.`transaction_id` AND `transaction`.`status` = 1 AND YEAR(from_unixtime(transaction.created)) = " . $year_post . " 
                        GROUP BY  Thang LIMIT 0, 10000";
                $data_big2 = $this->transaction_model->query3($str2);
                $this->data['data_big2'] = $data_big2;
                $sale = $data_big2[0]->money;
            }
        }
        $this->data['data_pro'] = $data_pro;
        $this->data['sale'] = $sale;
        $this->data['year_post'] = $year_post;
        $this->data['data_mounth'] = $data_mounth;
        $this->data['data_sale'] = $data_sale;

        $this->data['temp'] = 'admin/home/index';
        $this->load->view('admin/main', $this->data);
    }

}
