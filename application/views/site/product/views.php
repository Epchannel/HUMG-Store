<div class="col-xs-12 col-sm-9 col-md-9 col-lg-9 clearpaddingr">
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearpadding">
        <ol class="breadcrumb">
            <li><a href="<?php echo base_url(); ?>"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Trang chủ</a></li>
            <li class="active">Sản phẩm xem nhiều</li>
        </ol>

        <div class="panel panel-info">
            <div class="panel-heading" style="text-align: left">
                <h3 class="panel-title">Sản phẩm xem nhiều</h3>
            </div>
            <div class="panel-body">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearpadding">
                    <?php
                    foreach ($product_list as $value) {
                        $name = covert_vi_to_en($value->name);
                        $name = strtolower($name);
                        ?>
                        <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3 re-padding">
                            <div class="product_item">
                                <p class="product_name" ><a href="<?php echo base_url($name . '-p' . $value->id); ?>" ><?php echo $value->name; ?></a></p>
                                <div class="product-image">
                                    <a href="<?php echo base_url($name . '-p' . $value->id); ?>"><img src="<?php echo base_url(); ?>upload/product/<?php echo $value->image_link; ?>" alt="" class=""></a>
                                </div>
                                <?php
                                if ($value->discount > 0) {
                                    $new_price = $value->price - $value->discount;
                                    ?>
                                    <p><span class='price text-right'><?php echo number_format($new_price); ?> VNĐ</span> <del class="product-discount"><?php echo number_format($value->price); ?> VNĐ</del></p>
                                <?php } else { ?>
                                    <p><span class='price text-right'><?php echo number_format($value->price); ?> VNĐ</span></p>
                                    <?php } ?>
                                <p>
                                    <?php $raty_tb = round($value->rate_total / $value->rate_count); ?>

                                    <?php
                                    $i2 = 1;

                                    for ($i2; $i2 <= $raty_tb; $i2++) {
                                        echo '<i class="fa fa-star" style="color:gold"></i>';
                                    }
                                    $i3 = 1;
                                    for ($i3; $i3 <= (5 - $raty_tb); $i3++) {
                                        echo '<i class="fa fa-star-o" style="color: gold"></i>';
                                    }
                                    ?>
                                </p>
                                <?php
                                $query_count = 'SELECT SUM(quantity) As totalproduct FROM sizedetail WHERE product_id = ' . $value->id;
                                $result = $this->sizedetail_model->query2($query_count);
                                $sl = $result->totalproduct;
                                if ($sl > 0) {
                                    ?>
                                    <a href="<?php echo base_url('cart/add/' . $value->id); ?>"><button class='btn btn-info'><span class="fa fa-shopping-cart" aria-hidden="true"></span> Thêm giỏ hàng</button></a>
                                <?php } else { ?>
                                    <a style="pointer-events: none;"><button style="pointer-events: none;background-color: #333;border: none " class='btn btn-info'>Hết hàng</button></a>
    <?php } ?>
                            </div>
                        </div>
                <?php } ?>	
                </div>
<?php echo $this->pagination->create_links(); ?>
            </div>
        </div>

    </div>
</div>