@extends('layouts.app')

@section('content')
    <link rel="stylesheet" href="<?php echo asset('css/about-us.css')?>" type="text/css">
    <div class="container teamdiv">
        <h1 class="about-title">{!! $division->title !!}</h1>

        <div class="team-division">
            {!! $division->body !!}
        </div>
    </div>
@endsection
