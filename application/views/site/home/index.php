<div class="row" style="margin-top: 10px">
    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title text-left"><img src="<?php echo base_url(); ?>upload/icon/new.gif" alt=""><a href="<?php echo base_url('product/news'); ?>" class='product_title'>Sản phẩm mới </a><img src="<?php echo base_url(); ?>upload/icon/new.gif" alt=""></h3>
        </div>
        <div class="panel-body">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearpadding">
                    <?php
                    foreach ($new_product as $value) {
                        $name = covert_vi_to_en($value->name);
                        $name = strtolower($name);
                        ?>
                        <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3 re-padding">
                            <div class="product_item">

                                <div class="product-image">
                                    <a href="<?php echo base_url($name . '-p' . $value->id); ?>"><img src="<?php echo base_url(); ?>upload/product/<?php echo $value->image_link; ?>" alt="" class=""></a>
                                </div>
                                <p class="product_name" ><a href="<?php echo base_url($name . '-p' . $value->id); ?>" ><?php echo $value->name; ?></a></p>
                                <?php
                                if ($value->discount > 0) {
                                    $new_price = $value->price - $value->discount;
                                    ?>
                                    <p><span class='price text-right'><?php echo number_format($new_price); ?> VNĐ</span> <del class="product-discount"><?php echo number_format($value->price); ?> VNĐ</del></p>
                                <?php } else { ?>
                                    <p><span class='price text-right'><?php echo number_format($value->price); ?> VNĐ</span></p>
                                <?php } ?>
                                <?php
                                if ($value->discount != 0)
                                    echo '<span class="label_pro">Giảm giá</span>';
                                ?>
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
        </div>
    </div>	
</div>
<div class="row">
    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title text-left"><img src="<?php echo base_url(); ?>upload/icon/hot.gif" alt=""><a href="<?php echo base_url('ban-chay'); ?>" class='product_title'>Sản phẩm bán chạy</a><img src="<?php echo base_url(); ?>upload/icon/hot.gif" alt=""></h3>
        </div>
        <div class="panel-body">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearpadding">
                    <?php
                    foreach ($hot_product as $value) {
                        $name = covert_vi_to_en($value->name);
                        $name = strtolower($name);
                        ?>
                        <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3 re-padding">
                            <div class="product_item">

                                <div class="product-image">
                                    <a href="<?php echo base_url($name . '-p' . $value->id); ?>"><img src="<?php echo base_url(); ?>upload/product/<?php echo $value->image_link; ?>" alt="" class=""></a>
                                </div>
                                <p class="product_name" ><a href="<?php echo base_url($name . '-p' . $value->id); ?>" ><?php echo $value->name; ?></a></p>
                                <?php
                                if ($value->discount > 0) {
                                    $new_price = $value->price - $value->discount;
                                    ?>
                                    <p><span class='price text-right'><?php echo number_format($new_price); ?> VNĐ</span> <del class="product-discount"><?php echo number_format($value->price); ?> VNĐ</del></p>
                                <?php } else { ?>
                                    <p><span class='price text-right'><?php echo number_format($value->price); ?> VNĐ</span></p>
                                <?php } ?>
                                <?php
                                if ($value->discount != 0)
                                    echo '<span class="label_pro">Giảm giá</span>';
                                ?>
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
        </div>
    </div>	
</div>
<div class="row">
    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title text-left"><img src="<?php echo base_url(); ?>upload/icon/hot.gif" alt=""><a href="<?php echo base_url('product/views'); ?>" class='product_title'>Sản phẩm xem nhiều</a><img src="<?php echo base_url(); ?>upload/icon/hot.gif" alt=""></h3>
        </div>
        <div class="panel-body">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearpadding">
                    <?php
                    foreach ($view_product as $value) {
                        $name = covert_vi_to_en($value->name);
                        $name = strtolower($name);
                        ?>
                        <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3 re-padding">
                            <div class="product_item">

                                <div class="product-image">
                                    <a href="<?php echo base_url($name . '-p' . $value->id); ?>"><img src="<?php echo base_url(); ?>upload/product/<?php echo $value->image_link; ?>" alt="" class=""></a>
                                </div>
                                <p class="product_name" ><a href="<?php echo base_url($name . '-p' . $value->id); ?>" ><?php echo $value->name; ?></a></p>
                                <?php
                                if ($value->discount > 0) {
                                    $new_price = $value->price - $value->discount;
                                    ?>
                                    <p><span class='price text-right'><?php echo number_format($new_price); ?> VNĐ</span> <del class="product-discount"><?php echo number_format($value->price); ?> VNĐ</del></p>
                                <?php } else { ?>
                                    <p><span class='price text-right'><?php echo number_format($value->price); ?> VNĐ</span></p>
                                <?php } ?>
                                <?php
                                if ($value->discount != 0)
                                    echo '<span class="label_pro">Giảm giá</span>';
                                ?>
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
        </div>
    </div>	
</div>