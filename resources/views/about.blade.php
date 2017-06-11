@extends('layouts.app')

@section('content')
    <link rel="stylesheet" href="<?php echo asset('css/about-us.css')?>" type="text/css">
    <div class="container">
        <h1 class="about-title">{!! $about->title !!}</h1>

        <div class="about-content">
            {!! $about->body !!}
        </div>
        <img class="about-image" src="{!! Voyager::image( $about->image ) !!}"/>

    </div>
@endsection
