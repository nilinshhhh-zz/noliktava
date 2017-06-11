<!DOCTYPE html>
<html lang="<?php echo e(app()->getLocale()); ?>">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="<?php echo e(csrf_token()); ?>">

    <title>Noliktava</title>

    <!-- Styles -->
    <link href="<?php echo e(asset('css/app.css')); ?>" rel="stylesheet">
    <link href="<?php echo e(asset('css/theme.css')); ?>" rel="stylesheet">
</head>
<body>
    <div id="app">
        <nav class="navbar navbar-default navbar-static-top">
            <div class="container">
                <div class="navbar-header">

                    <!-- Collapsed Hamburger -->
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#app-navbar-collapse">
                        <span class="sr-only">Toggle Navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                    <!-- Branding Image -->
                    <a href="<?php echo e(url('/')); ?>"><img class="logo" src="<?php echo e(asset('img/cd-logo.svg')); ?>"/></a>

                </div>

                <div class="collapse navbar-collapse" id="app-navbar-collapse">
                    <ul class="nav navbar-nav">
                        <!-- Authentication Links -->
                        <?php if(Auth::guest()): ?>
                            <li>
                                <a class="red-button-container" href="<?php echo e(route('product.shoppingCart')); ?>"><button class="red-button">Cart</button></a>
                                <a class="red-button-container-mobile" href="<?php echo e(route('product.shoppingCart')); ?>">Cart</span></a>

                            </li>
                            <li>
                                <a class="red-button-container" href="<?php echo e(route('login')); ?>"><button class="red-button">Login</button></a>
                                <a class="red-button-container-mobile" href="<?php echo e(route('login')); ?>">Login</a>

                            </li>
                            <li>
                                <a class="red-button-container" href="<?php echo e(route('register')); ?>"><button class="red-button">Register</button></a>
                                <a class="red-button-container-mobile" href="<?php echo e(route('register')); ?>">Register</a>

                            </li>
                        <?php else: ?>
                            <li class="mobile">
                                <a class="red-button-container dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" ><button class="red-button"><?php echo e(Auth::user()->name); ?></button></a>
                                <a href="<?php echo e(url('/cart')); ?>">
                                    Cart
                                </a>
                                <?php if(Auth::user()->role_id === 1): ?>
                                    <a href="<?php echo e(url('/product-control')); ?>">
                                        Manage Products
                                    </a>
                                    <a href="<?php echo e(url('/order-control')); ?>">
                                        Manage Orders
                                    </a>
                                <?php endif; ?>
                                <a href="<?php echo e(route('account.myorders')); ?>">
                                    My Orders
                                </a>
                                <a class="red-button-container-mobile" href="<?php echo e(route('logout')); ?>" onclick="event.preventDefault(); document.getElementById('logout-form').submit();" >Logout</a>

                                <form id="logout-form" action="<?php echo e(route('logout')); ?>" method="POST" style="display: none;">
                                    <?php echo e(csrf_field()); ?>

                                </form>
                            </li>
                            <li class="cart desktop">
                                <a href="<?php echo e(route('product.shoppingCart')); ?>">
                                    Cart <span class="badge"><?php echo e(Session::get('cart') ? Session::get('cart')->totalQty : ''); ?></span>
                                </a>
                            </li>
                            <li class="dropdown desktop">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                                    <?php echo e(Auth::user()->name); ?> <span class="caret"></span>
                                </a>

                                <ul class="dropdown-menu" role="menu">
                                    <li>
                                        <a href="<?php echo e(route('account.myorders')); ?>">
                                            My Orders
                                        </a>

                                        <?php if(Auth::user()->role_id === 1): ?>
                                            <a href="<?php echo e(url('/product-control')); ?>">
                                                Manage Products
                                            </a>
                                            <a href="<?php echo e(url('/order-control')); ?>">
                                                Manage Orders
                                            </a>
                                        <?php endif; ?>

                                        <a href="<?php echo e(route('logout')); ?>"
                                            onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                                            Logout
                                        </a>

                                        <form id="logout-form" action="<?php echo e(route('logout')); ?>" method="POST" style="display: none;">
                                            <?php echo e(csrf_field()); ?>

                                        </form>
                                    </li>
                                </ul>
                            </li>
                        <?php endif; ?>
                    </ul>
                </div>
            </div>
        </nav>
        <div id="big-picture">

        </div>

        <?php echo e(Menu::display('main', 'navmenu')); ?>


        <?php if(session()->has('message.level')): ?>
            <div class="alert alert-<?php echo e(session('message.level')); ?>">
                <?php echo session('message.content'); ?>

            </div>
        <?php endif; ?>

        <?php echo $__env->yieldContent('content'); ?>

    </div>

    <!-- Scripts -->
    <script src="<?php echo e(asset('js/app.js')); ?>"></script>
    <script src="<?php echo e(asset('js/jquery.magnific-popup.js')); ?>"></script>
    <script src="<?php echo e(asset('js/theme.js')); ?>"></script>
</body>
</html>
