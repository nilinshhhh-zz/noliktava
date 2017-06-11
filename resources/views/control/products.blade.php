@extends('layouts.app')

@section('content')
    <link href="{{ asset('css/control.css') }}" rel="stylesheet">
    <div class="container control">
        <div class="row search">
            {!! Form::open(array('route' => 'searchControl', 'class' => 'form search')) !!}

            @if (Session::get('search'))
                <div class="alert alert-info">
                    {{Session::get('search')}}
                </div>
            @endif

            <div class="sidebar">
                {!! Form::text('keyword', null,
                    array('required',
                          'class'=>'form-control search',
                          'placeholder'=>'Search...')) !!}
            </div>
            <div class="form-group">
                {!! Form::submit('search',
                  array('class'=>'btn btn-primary')) !!}
            </div>

            {!! Form::close() !!}
        </div>
        <div class="row add">
            <div class="form-group">
                <div class="field control">
                    <a href="{{ route('control.Add') }}" class="btn btn-primary">Add new product...</a>
                </div>
            </div>
        </div>
        <div class="allproducts">
        @if (isset($products))
            <div class="title">
                <h4>Products:</h4>
            </div>
            <?php $count = 0; ?>
            @foreach($products as $product)
                <?php $count++?>
                <div class="product">
                    <div class="field id">
                        <span class="id">ID : {{$product->id}}</span>
                    </div>
                    <div class="field title">
                        <span class="title">TITLE : {{$product->title}}</span>
                    </div>
                    <div class="field control">
                        <a href="{{ route('control.Edit', $product->id) }}" class="edit btn btn-primary action submit">EDIT</a>
                        <a href="{{ route('control.Delete', $product->id) }}" class="edit btn btn-primary action submit">DELETE</a>
                    </div>
                </div>
            @endforeach
            @if ($count == 0)
                <div class="message">
                    <h4>No products found...</h4>
                </div>
            @endif
        @endif
        </div>
    </div>
@endsection
