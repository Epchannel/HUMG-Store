
<div class="col-xs-12 col-sm-9 col-md-9 col-lg-9 clearpaddingr">
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearpadding">
        <ol class="breadcrumb">
            <li><a href="<?php echo base_url(); ?>"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Trang chủ</a></li>
            <li><a href="<?php echo base_url($name_catalog . '-c' . $catalog_product->id); ?>"><?php echo $catalog_product->name; ?></a></li>
            <li class="active"><?php echo $product->name; ?></li>
        </ol>




        <!-- zoom image -->
        <script src="<?php echo public_url('js'); ?>/jqzoom_ev/js/jquery.jqzoom-core.js" type="text/javascript"></script>
        <link rel="stylesheet" href="<?php echo public_url('js'); ?>/jqzoom_ev/css/jquery.jqzoom.css" type="text/css">
        <script type="text/javascript">
            $(document).ready(function () {
                $('.jqzoom').jqzoom({
                    zoomType: 'standard',
                });
            });
        </script>
        <?php $rate_feeback = 5; ?>
        <!--         end zoom image -->
        <script type="text/javascript">
            $(document).ready(function () {
                //raty
                $('.raty_detailt').raty({
                    score: function () {
                        return $(this).attr('data-score');
                    },
                    half: true,
                    click: function (score, evt) {
                    }
                });
            });
        </script>
        <!--        End Raty -->







        <div class="panel panel-info " >
            <div class="panel-heading cus-color">
                <h3 class="panel-title">Xem chi tiết sản phẩm</h3>
            </div>
            <div class="panel-body">
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                    <div class="text-center">
                        <a href="<?php echo base_url(); ?>upload/product/<?php echo $product->image_link; ?>" class="jqzoom" rel="gal1" title="triumph">
                            <img  src="<?php echo base_url(); ?>upload/product/<?php echo $product->image_link; ?>" alt="" style="max-width:380px;max-height: 500px">
                        </a>
                        <div class="clearfix"></div>
                        <ul id="thumblist" style="margin-top: 20px;">
                            <li >
                                <a class="zoomThumbActive" href='javascript:void(0);' rel="{gallery: 'gal1', smallimage: '<?php echo base_url(); ?>/upload/product/<?php echo $product->image_link ?>',largeimage: '<?php echo base_url(); ?>/upload/product/<?php echo $product->image_link ?>'}">
                                    <img src='<?php echo base_url(); ?>/upload/product/<?php echo $product->image_link ?>'>
                                </a>
                            </li>
                            <?php if (is_array($image_list)): ?>
                                <?php foreach ($image_list as $value) { ?>
                                    <li>
                                        <a href='javascript:void(0);' rel="{gallery: 'gal1', smallimage: '<?php echo base_url(); ?>/upload/product/<?php echo $value ?>',largeimage: '<?php echo base_url(); ?>/upload/product/<?php echo $value ?>'}">
                                            <img src='<?php echo base_url(); ?>/upload/product/<?php echo $value; ?>'>
                                        </a>
                                    </li>
                                <?php } ?> <?php endif; ?>
                        </ul>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" style="padding: 10px">
                    <h1 style="font-size: 22px;text-transform:uppercase;color: #111111;font-weight:bold;"><?php echo $product->name; ?></h1>
                    <p><?php echo $product->content; ?></p>

                    <?php
                    if ($product->discount > 0) {
                        $price_new = $product->price - $product->discount;
                        ?><p>Giá cũ: <strong><del><?php echo number_format($product->price) ?> VNĐ</del></strong></p>
                        <p>Giá khuyến mại: <span style="font-weight: bold;color: green"><?php echo number_format($price_new); ?> VNĐ</span></p>
                    <?php } else { ?>
                        <p>Giá: <span style="font-weight: bold;color: green"><?php echo number_format($product->price); ?> VNĐ</span></p> <?php
                    }
                    ?>
                    <p>Size hiện có: 
                        <?php
                        foreach ($size_array as $size) {
                            $res = $this->size_model->get_info($size->size_id);
                            ?>  
                            <span><?php echo $size->quantity ?>  - <?php echo $res->name; ?> ; </span>

                        <?php } ?>
                        
                        <?php if(sizeof($size_array) == 0) { ?>
                             <span>Sản phẩm đã hết hàng</span>
                        <?php } ?>
                    </p>
                    <p>Số lượt xem: <?php echo $product->view; ?></p>
                    <p> Đánh giá &nbsp;
                        <?php $raty_tb = $product->rate_total / $product->rate_count; ?>
                        <span> <?php echo round($raty_tb, 2); ?>/</span><b  class='rate_count'><?php echo $product->rate_count; ?></b>
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
                    <a href="<?php echo base_url('cart/add/' . $product->id); ?>" class="btn btn-info"> Thêm vào giỏ hàng</a>
                </div>

            </div>
        </div>


        <div class="panel panel-info">
            <div class="panel-heading cus-color" style="text-align: left">
                <h3 class="panel-title">Đánh giá sản phẩm</h3>
            </div>
            <div class="panel-body">
                <?php if ($comments != null) { ?>    
                    <?php foreach ($comments as $value) {
                        ?>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearpadding" style="padding-bottom: 10px;margin-top:10px; border-bottom: 1px solid #ddd">
                            <div class="col-sm-1" style="padding-right: 0px !important">
                                <img style="max-width: 30px;float: right" src="<?php echo base_url(); ?>/upload/<?php echo 'user-default.png' ?>" />
                            </div>
                            <div class="col-sm-11" >
                                <div class="col-xs-10" >
                                    <span><b><u> <?php
                                                $user = $this->user_model->get_info($value->user_id);
                                                echo $user->name;
                                                ?>
                                            </u></b></span></div>
                                <div class="col-xs-12" style="padding-left: 0px">
                                    <div class="col-xs-3">
                                        <?php
                                        $i2 = 1;

                                        for ($i2; $i2 <= $value->rate; $i2++) {
                                            echo '<i class="fa fa-star" style="color:gold"></i>';
                                        }
                                        $i3 = 1;
                                        for ($i3; $i3 <= (5 - $value->rate); $i3++) {
                                            echo '<i class="fa fa-star-o" style="color: gold"></i>';
                                        }
                                        ?>

                                    </div>
                                    <div class="col-xs-7">Đăng ngày:  <?php echo mdate(" %d/%m/%Y", $value->date); ?></div>
                                </div>
                                <div class="col-xs-12" style="margin-top: 5px;margin-bottom: 5px"><p><?php echo $value->content; ?></p></div>
                                <?php if (!empty($value->image_link)) { ?>
                                    <div class="col-xs-12" > 
                                        <img style="max-width: 100px;float: left" src="<?php echo base_url(); ?>/upload/comment/<?php echo $value->image_link; ?>" />
                                    </div>
                                <?php } ?>
                            </div>
                        </div>
                    <?php } ?>
                <?php } else { ?>	
                    <p>Sản phẩm chưa có bình luận</p>	  	
                <?php } ?>

                <?php if ($check == TRUE) { ?>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearpadding" style="margin-top: 15px">
                        <div class="col-lg-1" style="padding: 0px"><image style="max-width: 30px;float: right" src="<?php echo base_url(); ?>/upload/user-default.png" > </div>  
                        <div class="col-lg-11">
                            <form id="addComment" name="" method="post" enctype="multipart/form-data">

                                <input name="id" value="<?php echo $product->id ?>" class="col-lg-10" type="hidden"/>
                                <div class="col-md-10">
                                    <input name="content" value="" class="col-lg-10" type="text"/>
                                </div>
                                <div class="col-md-10" style="margin-top: 5px;margin-bottom: 5px;">
                                    <span class='raty_detailt' style = 'margin:5px' id='start' data-score='<?php echo $rate_feeback ?>' ></span>
                                </div>
                                <div class="col-md-10">
                                    <input type="file" id="image" name="image">
                                </div>
                                <button id="add_comment" style="position: absolute; top:0px;right: 190px" class="btn btn-success" type="submit"> Gửi</button>
                            </form>
                        </div>
                    </div>
                <?php } else { ?>	
                    <p>Vui lòng đăng nhập và mua sản phẩm để bình luận !</p>	  	
                <?php } ?>
            </div>
        </div>





        <div class="panel panel-info">
            <div class="panel-heading cus-color">
                <h3 class="panel-title">Sản phẩm liên quan</h3>
            </div>
            <div class="panel-body">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearpadding">
                    <?php
                    foreach ($productsub as $value) {
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
        <div class="panel panel-info">
            <div class="panel-heading cus-color" style="text-align: left">
                <h3 class="panel-title">Có thể bạn thích</h3>
            </div>
            <div class="panel-body">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearpadding">
                    <?php
                    foreach ($productview as $value) {
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
</div>