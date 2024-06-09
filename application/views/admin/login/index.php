<!DOCTYPE html>
<html>
    <head>
        <?php $this->load->view('admin/head.php'); ?>
    </head>

    <body>
        <div class="row">
            <div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading" style=" background-color: #30a5ff;margin-bottom: 10px;color: white;text-align: center;font-size: 25px;">ĐĂNG NHẬP</div>
                    <div class="panel-body">



                        <form role="form" method="post">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="E-mail" name="email" type="email" autofocus=""><?php echo form_error('email'); ?>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Mật khẩu" name="password" type="password" value=""><?php echo form_error('email'); ?>
                                </div>

                                <div class="alert bg-danger hide" role="alert" id="AlertBox" style="background-color: white;">
                                    <?php echo form_error('login'); ?>
                                </div>
                                
                                <div class="checkbox">
                                    <label>
                                        <input name="remember" type="checkbox" value="Remember Me">Nhớ tên đăng nhập
                                    </label>
                                </div>
                                <button type="submit" class="btn btn-primary">Đăng nhập</button>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div><!-- /.col-->
        </div><!-- /.row -->	
        <?php $this->load->view('admin/footer.php'); ?>	
        <script type="text/javascript">
            $(function () {
                $('#AlertBox').children().css("color", "red");
                $('#AlertBox').removeClass('hide');
                $('#AlertBox').delay(2000).slideUp(500);
            });
        </script>
    </body>

</html>
