@extends('layouts.app')

@section('content')
    <link href="{{ asset('css/control.css') }}" rel="stylesheet">
    <div class="container control">
    <div class="row container search">
        {!! Form::open(array('route' => 'searchOrders', 'class' => 'form search')) !!}
        @if (Session::get('search'))
            <div class="alert alert-info">
                {{Session::get('search')}}
            </div>
        @endif
        <div class="sidebar">
            {!! Form::text('keyword', null,
                array('required',
                      'class'=>'form-control search',
                      'placeholder'=>'Search orders by name...')) !!}
        </div>
        <div class="form-group">
            {!! Form::submit('search',
              array('class'=>'btn btn-primary')) !!}
        </div>
        {!! Form::close() !!}
    </div>
    <div class="container orders">
        @if (count($orders) >= 1)
            <h4 class="ordertitle">Orders :</h4>
            @foreach ($orders as $order)
                <div class="order">
                    <div class="field id">
                        <h4>Invoice ID : {{sprintf('%08d', $order->id)}}</h4>
                        Ordered at : {{$order->created_at}}
                    </div>
                    <div class="field name">
                        <h4>Full Name : {{$order->name}}</h4>
                    </div>
                    <div class="field name">
                        <h4>Phone : {{$order->telephone}}</h4>
                    </div>
                    <div class="field email">
                        <h4>Contact Email : {{$order->contact_email}}</h4>
                    </div>
                    <div class="field address">
                        <h4>
                            Address :
                            <?php $address = unserialize($order->address)?>
                            @foreach ($address as $addressField)
                                {{$addressField}}
                            @endforeach
                        </h4>
                    </div>
                    <?php $cart = unserialize($order->cart);?>
                    <div class="field products">
                            <h4 class="order-title">
                                Products :
                            </h4>
                            @foreach ($cart->items as $product)
                                <div class="order-product">
                                    ID : {{$product['item']->id}} - ${{$product['item']->price}}
                                </div>
                            @endforeach
                    </div>
                    <div class="field cart">

                        <h4>Total Qty: {{$cart->totalQty}}</h4>
                        <h4>Total Price: ${{$cart->totalPrice}}</h4>
                    </div>
                    <div class="field status">
                        {!! Form::open(array('route' => 'changeOrderStatus', 'class' => 'form search')) !!}
                        <input name="id" type="hidden" value="{{$order->id}}">
                        {!! Form::submit('Change Status',
                            array('class'=>'status btn-primary')) !!}
                        <select name="status">
                            <option value="0" <?php if ($order->status == 0) { echo 'selected'; }?>>
                                Processing
                            </option>
                            <option value="1" <?php if ($order->status == 1) { echo 'selected'; }?>>
                                Finished
                            </option>
                        </select>
                        {!! Form::close() !!}
                    </div>
                </div>
            @endforeach
        @else
            <h4 class="ordertitle">No orders found...</h4>
        @endif

    </div>
    </div>
@endsection
