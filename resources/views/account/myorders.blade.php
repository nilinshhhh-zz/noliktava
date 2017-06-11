@extends('layouts.app')

@section('content')
    <link rel="stylesheet" href="<?php echo asset('css/account.css')?>" type="text/css">
    <div class="container account">
        <div class="row">
            @if (count($orders) < 1)
                <div class="col-sm-6 col-md-6 col-md-offset-3 col-sm-offset-3 title">
                    <h1>You have no orders...</h1>
                </div>
            @else
                <div class="col-sm-6 col-md-6 col-md-offset-3 col-sm-offset-3 title">
                    <h1>My Orders</h1>
                </div>
                @foreach ($orders as $order)
                    <div class="col-sm-6 col-md-6 col-md-offset-3 col-sm-offset-3 order-container">
                        <div class="orderid">
                            Invoice ID : {{sprintf('%08d', $order->id)}}
                        </div>
                        <div class="name">
                            Name : {{$order->name}}
                        </div>
                        <div class="email">
                            Email : {{$order->contact_email}}
                        </div>
                        <div class="address">
                            Address :
                            <?php $address = unserialize($order->address)?>
                            @foreach ($address as $addressField)
                                {{$addressField}}
                            @endforeach
                        </div>
                        <div class="notes">
                            Custom notes : {{$order->notes}}
                        </div>
                        <?php $cart = unserialize($order->cart); ?>
                        <div class="order-totals">
                            <div class="total qty">
                                Total qty :{{$cart->totalQty}}
                            </div>
                            <div class="total price">
                                Total price : ${{$cart->totalPrice}}
                            </div>
                            <div class="total status">
                                <?php $status = ($order->status == 0) ? 'Processing' : 'Finished'; ?>
                                Status : {{$status}}
                            </div>
                        </div>
                        <div class="order-products">
                                <div class="order-title">
                                    Products :
                                </div>
                            @foreach ($cart->items as $product)
                                <div class="order-product">
                                    <div class="product name">
                                       - {{$product['item']->title}}
                                    </div>
                                    <div class="product price">
                                        (${{$product['item']->price}})
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>
                @endforeach
            @endif
        </div>
    </div>
@endsection

@section('scripts')
@endsection