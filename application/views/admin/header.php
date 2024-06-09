<!--<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container-fluid">
                <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="<?php // echo admin_url('admin/edit/'.$login->id);    ?>">Xin chào: <?php // echo $login->name;    ?></a>
                        <a class="navbar-brand pull-right" id="logout" href="<?php // echo admin_url('admin/logout');    ?>">Đăng xuất</a>
                </div>
                                                
        </div> /.container-fluid 
</nav>-->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><span>HUMG Store </span>Admin</a>
            <ul class="user-menu">
                <li class="dropdown">
                    <a href="#" class="dropbtn" onclick="myFunction()"><svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg> <?php echo $login->name; ?> <span class="caret"></span></a>
                    <ul class="dropdown-menu dropdown-content" id="myDropdown" role="menu">
                        <li><a href="<?php echo admin_url('admin/edit/'.$login->id);    ?>"><svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg> Tài khoản của bạn</a></li>
                        <li><a href="<?php echo admin_url('admin/logout'); ?>"><svg class="glyph stroked cancel"><use xlink:href="#stroked-cancel"></use></svg> Đăng xuất</a></li>
                    </ul>
                </li>
            </ul>
        </div>

    </div><!-- /.container-fluid -->
</nav>
<script>
    /* When the user clicks on the button, 
     toggle between hiding and showing the dropdown content */
    function myFunction() {
        document.getElementById("myDropdown").classList.toggle("show");
    }

// Close the dropdown if the user clicks outside of it
    window.onclick = function (event) {
        if (!event.target.matches('.dropbtn')) {
            var dropdowns = document.getElementsByClassName("dropdown-content");
            var i;
            for (i = 0; i < dropdowns.length; i++) {
                var openDropdown = dropdowns[i];
                if (openDropdown.classList.contains('show')) {
                    openDropdown.classList.remove('show');
                }
            }
        }
    }
</script>
