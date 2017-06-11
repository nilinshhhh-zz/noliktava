<?php $__env->startSection('content'); ?>
    <link rel="stylesheet" href="<?php echo asset('css/about-us.css')?>" type="text/css">
    <div class="container">
        <h1 class="about-title"><?php echo $about->title; ?></h1>

        <div class="about-content">
            <?php echo $about->body; ?>

        </div>
        <img class="about-image" src="<?php echo Voyager::image( $about->image ); ?>"/>

    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>