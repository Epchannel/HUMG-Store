
<script type="text/javascript">
    $(document).ready(function () {
        
        $.ajax({
            url: 'https://online-gateway.ghn.vn/shiip/public-api/master-data/province',
            type: 'POST',
            dataType: 'json',
            headers: {
                'token': '464ef410-6fc8-11ec-9054-0a1729325323'
            },
            contentType: 'application/json; charset=utf-8',
            success: function (result) {
                // CallBack(result);
                $.each(result, function (key, value) {
                    if (key.includes("data"))
                    {
                        $.each(value, function (key2, value2) {
                            
                                $('<option>').val(value2.ProvinceID).text(value2.ProvinceName).appendTo('#province');
                            
                        })
                    }

                })

            },
            error: function (error) {

            }
        });
    });
</script>

<script type="text/javascript">
    $(document).ready(function () {
        $('#province').change(function (envent) {
            var province = $('#province').val();
            province = parseInt(province);

            $('#district')
                    .empty()
                    .append('<option value>--Chọn Quận,Huyện--</option>');

            $.ajax({
                url: 'https://online-gateway.ghn.vn/shiip/public-api/master-data/district',
                type: 'GET',
                dataType: 'json',
                headers: {
                    'token': '464ef410-6fc8-11ec-9054-0a1729325323',
                },
                data: {province_id: province},
                contentType: 'application/json; charset=utf-8',
                success: function (result) {
                    // CallBack(result);
                    $.each(result, function (key, value) {
                        if (key.includes("data"))
                        {
                            $.each(value, function (key2, value2) {
                                $('<option>').val(value2.DistrictID).text(value2.DistrictName).appendTo('#district');
                            })
                        }

                    })

                },
                error: function (error) {

                }
            });
        });
    });
</script>

<script type="text/javascript">
    $(document).ready(function () {
        $('#district').change(function (envent) {
            var district = $('#district').val();
            district = parseInt(district);

            var a = $("#province option:selected").text();
            var b = $("#district option:selected").text();
            
           
            $('#name_province').val(a);
            $('#name_district').val(b);

            
        });
    });

</script>


<div class="row">
    <ol class="breadcrumb">
        <li><a href="#"><svg class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg></a></li>
        <li class="active">Đối tác vận chuyển</li>
    </ol>
</div><!--/.row-->

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-info">
            <div class="panel-heading">
                Chỉnh sửa địa chỉ
            </div>
            <div class="panel-body">
                <div class="col-lg-12">
                    <h3><?php echo $shipping->name ?></h3>
                </div>
                <form class="form-horizontal" name="" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label">Tỉnh - Thành phố</label>
                        <div class="col-sm-5">
                            <select  class="form-control" name="province" id="province" style="min-width: 200px;padding: 5px">
                                <option value>--Chọn Tỉnh,Thành Phố--</option>
                            </select>
                            <input style="min-width: 200px" type="hidden"  id="name_province" name="name_province" value="">
                        </div>
                        <div class="col-sm-4">
                            <?php echo form_error('province'); ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label">Quận-Huyện</label>
                        <div class="col-sm-5">
                            <select class="form-control" name="district" id="district" style="min-width: 200px;padding: 5px">
                                <option value>--Chọn Quận,Huyện--</option>
                            </select>
                            <input style="min-width: 200px" type="hidden" id="name_district" name="name_district" value="">
                        </div>
                    </div>


                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-5">
                            <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div><!--/.row-->
