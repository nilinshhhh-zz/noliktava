@extends('layouts.app')

@section('content')
    <link rel="stylesheet" href="<?php echo asset('css/contacts.css')?>" type="text/css">
    <div class="content-container contact-us">
        <h1>Contact Us</h1>

        <ul>
            @foreach($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>

        {!! Form::open(array('route' => 'contact_store', 'class' => 'form contact')) !!}

        @if (Session::get('contact'))
            <div class="alert alert-info">
                {{Session::get('contact')}}
            </div>
        @endif

        <div class="form-group">
            {!! Form::label('Your Name') !!}
            {!! Form::text('name', null,
                array('required',
                      'class'=>'form-control',
                      'placeholder'=>'Your name')) !!}
        </div>

        <div class="form-group">
            {!! Form::label('Your E-mail Address') !!}
            {!! Form::text('email', null,
                array('required',
                      'class'=>'form-control',
                      'placeholder'=>'Your e-mail address')) !!}
        </div>

        <div class="form-group">
            {!! Form::label('Your Message') !!}
            {!! Form::textarea('message', null,
                array('required',
                      'class'=>'form-control',
                      'placeholder'=>'Your message')) !!}
        </div>

        <div class="form-group">
            {!! Form::submit('Contact Us!',
              array('class'=>'btn btn-primary')) !!}
        </div>

        {!! Form::close() !!}
    </div>
@endsection
