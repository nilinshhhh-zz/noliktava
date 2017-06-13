@extends('layouts.app')

@section('content')
    <link rel="stylesheet" href="<?php echo asset('css/news.css')?>" type="text/css">
    <div class="container">
        <br><br>
        <div class="row">
            @foreach($posts as $post)
                <div class="col-md-3 news">
                    <a href="/post/{{ $post->slug }}">
                        <img src="{{ Voyager::image( $post->image ) }}" style="width:100%">

                        <span>{{ $post->title }}</span>
                    </a>
                </div>
            @endforeach
        </div>
    </div>
@endsection
