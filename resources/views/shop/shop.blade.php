@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="col-md-3">
            <h2 class="lead">
                <a href="{{ route('shop') }}">
                    Ice Hockey Shop
                </a>
            </h2>

            <div class="list-group">
                @foreach ($categories as $category)
                <a href="{{ route('shop.filter', ['id' => $category->id]) }}" class="list-group-item">{{$category->name}}</a>
                @endforeach
            </div>
        </div>
        <div class="col-md-9">
            <div class="row search">
                <div class="search">
                    {!! Form::open(array('route' => 'search', 'class' => 'form search')) !!}

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
            </div>
        </div>
        <div class="col-md-9">
            <div class="row title">
                <h1>@if(isset($current))
                        {{ $current }}
                    @elseif (isset($searchActive))
                        Search results
                    @else
                        All categories
                    @endif
                </h1>
            </div>
        </div>
        <div class="col-md-9">
            @if ((count($products) < 1))
                <div class="row no-products">
                <h1 class="error">No products found...</h1>
            @else
            <div class="row">
            @endif
                @foreach($products as $product)
                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <img src="{{ URL::to('/')}}/images/{{$product->image_path}}" alt="picture">
                            <div class="caption">
                                <h4 class="pull-right">${{ $product->price }}</h4>
                                <h4><a>{{ $product->title }}</a>
                                </h4>
                                <p>{{ $product->description }}</p>
                                <p>
                                    @foreach ($categories as $category)
                                        @if ($category->id == $product->category_id)
                                            {{$category->name}}
                                        @endif
                                    @endforeach
                                </p>
                                <div class="clearfix">
                                    <a href="{{ route('product.addToCart', ['id' => $product->id]) }}" class="btn pull-right btn-success">Add To Cart</a>
                                </div>

                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </div>
@endsection
