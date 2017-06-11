<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>Noliktava</title>

    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <link href="{{ asset('css/theme.css') }}" rel="stylesheet">
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
                    <a href="{{ url('/') }}"><img class="logo" src="{{ asset('img/cd-logo.svg') }}"/></a>

                </div>

                <div class="collapse navbar-collapse" id="app-navbar-collapse">
                    <ul class="nav navbar-nav">
                        <!-- Authentication Links -->
                        @if (Auth::guest())
                            <li>
                                <a class="red-button-container" href="{{ route('product.shoppingCart') }}"><button class="red-button">Cart</button></a>
                                <a class="red-button-container-mobile" href="{{ route('product.shoppingCart') }}">Cart</span></a>

                            </li>
                            <li>
                                <a class="red-button-container" href="{{ route('login') }}"><button class="red-button">Login</button></a>
                                <a class="red-button-container-mobile" href="{{ route('login') }}">Login</a>

                            </li>
                            <li>
                                <a class="red-button-container" href="{{ route('register') }}"><button class="red-button">Register</button></a>
                                <a class="red-button-container-mobile" href="{{ route('register') }}">Register</a>

                            </li>
                        @else
                            <li class="mobile">
                                <a class="red-button-container dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" ><button class="red-button">{{ Auth::user()->name }}</button></a>
                                <a href="{{ url('/cart') }}">
                                    Cart
                                </a>
                                @if (Auth::user()->role_id === 1)
                                    <a href="{{ url('/product-control') }}">
                                        Manage Products
                                    </a>
                                    <a href="{{ url('/order-control') }}">
                                        Manage Orders
                                    </a>
                                @endif
                                <a href="{{ route('account.myorders') }}">
                                    My Orders
                                </a>
                                <a class="red-button-container-mobile" href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();" >Logout</a>

                                <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                    {{ csrf_field() }}
                                </form>
                            </li>
                            <li class="cart desktop">
                                <a href="{{ route('product.shoppingCart') }}">
                                    Cart <span class="badge">{{ Session::get('cart') ? Session::get('cart')->totalQty : '' }}</span>
                                </a>
                            </li>
                            <li class="dropdown desktop">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                                    {{ Auth::user()->name }} <span class="caret"></span>
                                </a>

                                <ul class="dropdown-menu" role="menu">
                                    <li>
                                        <a href="{{ route('account.myorders') }}">
                                            My Orders
                                        </a>

                                        @if (Auth::user()->role_id === 1)
                                            <a href="{{ url('/product-control') }}">
                                                Manage Products
                                            </a>
                                            <a href="{{ url('/order-control') }}">
                                                Manage Orders
                                            </a>
                                        @endif

                                        <a href="{{ route('logout') }}"
                                            onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                                            Logout
                                        </a>

                                        <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                            {{ csrf_field() }}
                                        </form>
                                    </li>
                                </ul>
                            </li>
                        @endif
                    </ul>
                </div>
            </div>
        </nav>
        <div id="big-picture">
            <div class="web-title">blessedstone</div>
        </div>

        {{Menu::display('main', 'navmenu')}}

        @if(session()->has('message.level'))
            <div class="alert alert-{{ session('message.level') }}">
                {!! session('message.content') !!}
            </div>
        @endif

        @yield('content')

    </div>

    <!-- Scripts -->
    <script src="{{ asset('js/app.js') }}"></script>
    <script src="{{ asset('js/jquery.magnific-popup.js') }}"></script>
    <script src="{{ asset('js/theme.js') }}"></script>
</body>
</html>
