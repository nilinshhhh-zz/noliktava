<?php $__env->startSection('content'); ?>
    <link href="<?php echo e(asset('css/magnific-popup.css')); ?>" rel="stylesheet">
    <link href="<?php echo e(asset('css/magnific-popup.css')); ?>" rel="stylesheet">
    <div class="container">
        <div id="container" class="row">

                <div class="gallery">
                        <?php foreach ($gallery as $image):?>
                            <?php if ($image != null) : ?>
                                <div class="col-md-4 mix category-a">
                                    <div class="single-portfolio">
                                        <a class="gallery-item" href="<?php echo e(URL::to('/')); ?>/img/media/<?php echo $image?>">
                                            <img class="img-responsive" src="<?php echo e(URL::to('/')); ?>/img/media/<?php echo $image?>" alt="One" />
                                        </a>
                                    </div>
                                </div>
                            <?php endif; ?>
                        <?php endforeach; ?>
                </div>

        </div>
    </div>
<?php $__env->stopSection(); ?>




<?php echo $__env->make('layouts.app', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>