<?php $__env->startSection('content'); ?>
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">

                <h1><?php echo e($post->title); ?></h1>
                <img src="<?php echo e(Voyager::image( $post->image )); ?>" style="width:100%">
                <p><?php echo $post->body; ?></p>

            </div>
        </div>
    </div>

<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>