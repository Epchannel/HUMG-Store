<meta charset="UTF-8">
<title>98 StreetWear Shop</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<script src="<?php echo public_url(); ?>js/jquery-3.1.1.js" type="text/javascript"></script>
<script src="<?php echo public_url('js/jqzoom_ev'); ?>js/jquery.jcarousel.pack.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="<?php echo public_url('site/'); ?>bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<?php echo public_url('site/'); ?>css/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">



<script type="text/javascript" src="<?php echo public_url('js/raty/jquery.raty.min.js') ?>"></script>



<script type="text/javascript">
    $(function () {
        $.fn.raty.defaults.path = "<?php echo public_url('js/raty/img'); ?>";
        $('.raty').raty({
            score: function () {
                return $(this).attr('data-score');
            },
            readOnly: true,
        });
    });
</script>
<style>.raty img{width:16px !important;height:16px; !important;}</style>
