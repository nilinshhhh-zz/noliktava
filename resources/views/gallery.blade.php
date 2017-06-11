@extends('layouts.app')

@section('content')
    <link href="{{ asset('css/magnific-popup.css') }}" rel="stylesheet">
    <link href="{{ asset('css/magnific-popup.css') }}" rel="stylesheet">
    <div class="container">
        <div id="container" class="row">

                <div class="gallery">
                        <?php foreach ($gallery as $image):?>
                            <?php if ($image != null) : ?>
                                <div class="col-md-4 mix category-a">
                                    <div class="single-portfolio">
                                        <a class="gallery-item" href="{{ URL::to('/')}}/img/media/<?php echo $image?>">
                                            <img class="img-responsive" src="{{ URL::to('/')}}/img/media/<?php echo $image?>" alt="One" />
                                        </a>
                                    </div>
                                </div>
                            <?php endif; ?>
                        <?php endforeach; ?>
                </div>

        </div>
    </div>
@endsection



