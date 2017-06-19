<?php $__env->startSection('content'); ?>
    <link rel="stylesheet" href="<?php echo asset('css/news.css')?>" type="text/css">
    <div class="container">
        <br><br>
        <div class="row">
            <?php $__currentLoopData = $posts; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $post): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <div class="col-md-3 news">
                    <a href="/post/<?php echo e($post->slug); ?>">
                        <img src="<?php echo e(Voyager::image( $post->image )); ?>" style="width:100%">

                        <span><?php echo e($post->title); ?></span>
                    </a>
                </div>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>