<script src="<?php echo public_url('admin/'); ?>js/jquery-1.11.1.min.js"></script>
<script src="<?php echo public_url('admin/'); ?>js/bootstrap.min.js"></script>
<script src="<?php echo public_url('admin/'); ?>js/chart.min.js"></script>
<script src="<?php echo public_url('admin/'); ?>js/chart-data.js"></script>
<script src="<?php echo public_url('admin/'); ?>js/easypiechart.js"></script>
<script src="<?php echo public_url('admin/'); ?>js/easypiechart-data.js"></script>
<script src="<?php echo public_url('admin/'); ?>js/bootstrap-datepicker.js"></script>
<script>
    $(document).ready(function ($) {
        $("#logout").click(function (e) {
            e.preventDefault();
            window.location.href = "admin/logout"
        });
        $('#calendar').datepicker({
        });

        !function ($) {
            $(document).on("click", "ul.nav li.parent > a > span.icon", function () {
                $(this).find('em:first').toggleClass("glyphicon-minus");
            });
            $(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
        }(window.jQuery);

        $(window).on('resize', function () {
            if ($(window).width() > 768)
                $('#sidebar-collapse').collapse('show')
        })
        $(window).on('resize', function () {
            if ($(window).width() <= 767)
                $('#sidebar-collapse').collapse('hide')
        })
    });

</script>
<script type="text/javascript">
    $("#li-nav").click(function () {
        var isSomethingTrue = $("#li-nav").hasClass("open");
        
        if (isSomethingTrue) {
            $('#li-nav').removeClass('open');
        } else {
            $('#li-nav').addClass('open');
        }
        $('ul').removeAttr("style");
    });

</script>