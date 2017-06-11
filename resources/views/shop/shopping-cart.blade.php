@extends('layouts.app')

@section('content')
    <link href="{{ asset('css/shop.css') }}" rel="stylesheet">
    <div class="container cart">
        @if (Session::has('cart') && isset($products))
            <div class="row title col-sm-6 col-md-6 col-md-offset-3 col-sm-offset-3">
                <h2>Your shopping cart :</h2>
            </div>
            <div class="row">
                <div class="product col-sm-6 col-md-6 col-md-offset-3 col-sm-offset-3">
                    <ul class="list-group">
                        @foreach($products as $product)
                            <li class="list-group-item product-container">
                                <span class="badge">Qty : {{$product['qty']}}</span>
                                <strong>{{$product['item']['title']}}</strong>
                                <span class="label label-success">${{$product['price']}}</span>
                                <div class="btn-group">
                                    <button type="button" data-toggle="dropdown" class="btn btn-primary btn-xs dropdown-toggle">
                                        <span class="caret">

                                        </span>
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li><a href="{{ route('product.removeFromCart', [$product['item']['id']]) }}">Remove</a></li>
                                    </ul>
                                </div>
                            </li>
                        @endforeach
                    </ul>
                </div>
            </div>


            <div class="row total">
                <div class="col-sm-6 col-md-6 col-md-offset-3 col-sm-offset-3">
                    <strong>Total: ${{ $totalPrice }}</strong>
                    <a href="{{route('checkout')}}" type="button" class="btn btn-success">
                        Checkout
                    </a>
                </div>
            </div>

        @else
            <div class="row">
                <div class="row title col-sm-6 col-md-6 col-md-offset-3 col-sm-offset-3">
                    <h2 class="no-items">No items in cart... <a class="continue" href="{{ route('shop') }}">continue shopping</a></h2>

                </div>
            </div>
        @endif
    </div>
@endsection
