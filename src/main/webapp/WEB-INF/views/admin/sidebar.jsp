<div id="sidebar">
    <div id="sidebar-wrapper">
        <!-- Sidebar with logo and menu -->
        <script type="text/javascript">
            $(document).ready(function () {
                $('main-nav li a').click(function () {
                    $('main-nav a').removeClass('current');
                    $(this).addClass('current');
                });
            });
        </script>
        <h1 id="sidebar-title">Booking Management </h1>

        <!-- Logo (221px wide) -->
        <img id="logo" src="<@spring.url '/assets/resource/images/bookmanag.png'/>"
             alt="Booking Page" />

        <!-- Sidebar Profile links -->
        <div id="profile-links">
            Hello, <a href="#" title="Edit your profile">${userLogin!}</a><br />
            <br />
            <div class="clear"></div>

            <form action="<@spring.url '/login/index/logout'/>" method="post">
                <a href="javascript:;" onclick="parentNode.submit();"
                   title="Sign Out">Sign Out</a>
            </form>
        </div>

        <ul id="main-nav">
            <!-- Accordion Menu -->
            <li><a href="<@spring.url '/login/index' />" class="nav-top-item no-submenu"> Dashboard </a></li>
            <li><a href="<@spring.url '/index/book' />" class="nav-top-item no-submenu">Book Now! </a> </li>
            <li><a href="<@spring.url '/index/booklist' />" class="nav-top-item no-submenu"> Booking List</a> </li>
        </ul>
        <!-- End #main-nav -->
    </div>
</div>
<!-- End #sidebar -->