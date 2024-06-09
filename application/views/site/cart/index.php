

<div class="col-xs-12 col-sm-9 col-md-9 col-lg-9 clearpaddingr">
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearpadding">
        <ol class="breadcrumb">
            <li><a href="<?php echo base_url(); ?>"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Trang chủ</a></li>
            <li class="active">Chi tiết giỏ hàng</li>
        </ol>
        <?php if (isset($message) && !empty($message)) { ?>
            <h5 style="color:#ffffff;margin-top: 10px;background-color: rgb(238, 77, 45);padding: 15px;"><?php echo $message; ?></h5>
            <?php
        }
        if ($total_items > 0) {
            ?>
            <div class="panel panel-info " style="margin-top: 20px;margin-bottom: 15px;background-color: #ffffff">
                <div class="panel-heading">
                    <h3 class="panel-title">GIỎ HÀNG ( <?php echo $total_items; ?> sản phẩm )</h3>
                </div>
                <div class="panel-body" style="background-color: #ffffff">
                    <table class="table table-hover">
                        <thead style="background-color: rgb(240, 93, 64);color: #fff;font-size: 14px">
                        <th>STT</th>
                        <th>Tên sản phẩm</th>
                        <th>Hình ảnh</th>
                        <th style="text-align: center">Số lượng</th>
                        <th style="text-align: center">Size</th>
                        <th style="text-align: center">Thêm size mới</th>
                        <th>Thành tiền</th>
                        <th>Xóa</th>
                        </thead>
                        <tbody>
                            <?php
                            $i = 0;
                            $total_price = 0;
                            foreach ($carts as $items) {
                                $total_price = $total_price + $items['subtotal'];
                                ?>
                                <tr>
                                    <td><?php echo $i = $i + 1 ?></td>
                                    <td><?php echo $items['name']; ?></td>
                                    <td><img src="<?php echo base_url('upload/product/' . $items['image_link']); ?>" class="img-thumbnail" alt="" style="width: 50px;"></td>
                                    <td style="min-width: 150px;text-align: center"><a class="cart-sumsub" href="<?php echo base_url('cart/update/' . $items['cartid'] . '/sub'); ?>">-</a><input type="text" value="<?php echo $items['qty']; ?>" style="width: 30px;text-align: center;"><a class="cart-sumsub" href="<?php echo base_url('cart/update/' . $items['cartid'] . '/sum'); ?>">+</a></td>
                                    <td style="min-width: 150px;padding-left: 40px">
                                        <a class="cart-sumsub" href="<?php echo base_url('cart/sumsize/' . $items['cartid'] . '/' . $items['id']); ?>">-</a>
                                        <input type="hidden" value="<?php echo $items['size']; ?>" style="width: 30px;text-align: center;">
                                        <input type="text" disabled="disabled" value="<?php
                                        $re = $this->size_model->get_info($items['size']);
                                        echo $re->name;
                                        ?>" style="width: 30px;text-align: center;">
                                               <?php
                                               $input = array();
                                               $input['where'] = array('product_id' => $items['id']);
                                               $input['order'] = array('size_id', 'DESC');
                                               $input['limit'] = array('1', '0');
                                               $size_max = $this->sizedetail_model->get_list($input);
                                               if ($items['size'] < $size_max[0]->size_id) {
                                                   ?>
                                            <a class="cart-sumsub" href="<?php echo base_url('cart/sumsize/' . $items['cartid'] . '/' . $items['id']); ?>">+</a>
                                        <?php } ?>
                                    </td>
                                    
                                    <td style="text-align: center"><a style="color: #00FF00" href="<?php echo base_url('cart/newsize/' . $items['id']); ?>"><span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span></a></td>
                                    <td><?php echo number_format($items['subtotal']); ?> VNĐ</td>
                                    <td><a style="color: red" href="<?php echo base_url('cart/del/' . $items['cartid']); ?>"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a></td>

                                </tr>
                            <?php }
                            ?>
                            <tr>
                                <td colspan="6">Tổng tiền</td>
                                <td style="font-weight: bold;color:green"><?php echo number_format($total_price); ?> VNĐ</td>
                                <td><a style="font-weight: bold;color: red" href="<?php echo base_url('cart/del'); ?>">Xóa toàn bộ</a></td>

                            </tr>
                            <tr style="border: none">
                                <td colspan="8"><a style="float: right;;border: none" href="<?php echo base_url('order'); ?>" class="btn btn-success">Đặt mua</a></td>
                            </tr>

                        </tbody>
                    </table>

                </div>
            </div>
        <?php } else { ?>
            <div class="panel panel-info " style="margin-bottom: 15px">
                <div class="panel-heading">
                    <h3 class="panel-title">GIỎ HÀNG ( 0 sản phẩm )</h3>
                </div>
                <div class="panel-body">
                    <div class="text-center">
                        <img src="<?php echo base_url('upload/cart-empty.png') ?>" alt="">
                        <h4 style="color:red">Không có sản phẩm trong giỏ hàng</h4>
                        <a href="<?php echo base_url('product/hot'); ?>" class="btn btn-info">Mua sắm</a>
                    </div>

                </div>
            </div>

        <?php }
        ?>



    </div>
    
</div>
