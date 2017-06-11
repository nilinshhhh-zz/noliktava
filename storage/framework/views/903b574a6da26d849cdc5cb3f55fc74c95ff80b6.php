<?php $__env->startSection('content'); ?>
    <link href="<?php echo e(asset('css/control.css')); ?>" rel="stylesheet">
    <div class="container control">
        <div class="row search">
            <?php echo Form::open(array('route' => 'searchControl', 'class' => 'form search')); ?>


            <?php if(Session::get('search')): ?>
                <div class="alert alert-info">
                    <?php echo e(Session::get('search')); ?>

                </div>
            <?php endif; ?>

            <div class="sidebar">
                <?php echo Form::text('keyword', null,
                    array('required',
                          'class'=>'form-control search',
                          'placeholder'=>'Search...')); ?>

            </div>
            <div class="form-group">
                <?php echo Form::submit('search',
                  array('class'=>'btn btn-primary')); ?>

            </div>

            <?php echo Form::close(); ?>

        </div>
        <div class="row add">
            <div class="form-group">
                <div class="field control">
                    <a href="<?php echo e(route('control.Add')); ?>" class="btn btn-primary">Add new product...</a>
                </div>
            </div>
        </div>
        <div class="allproducts">
        <?php if(isset($products)): ?>
            <div class="title">
                <h4>Products:</h4>
            </div>
            <?php $count = 0; ?>
            <?php $__currentLoopData = $products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <?php $count++?>
                <div class="product">
                    <div class="field id">
                        <span class="id">ID : <?php echo e($product->id); ?></span>
                    </div>
                    <div class="field title">
                        <span class="title">TITLE : <?php echo e($product->title); ?></span>
                    </div>
                    <div class="field control">
                        <a href="<?php echo e(route('control.Edit', $product->id)); ?>" class="edit btn btn-primary action submit">EDIT</a>
                        <a href="<?php echo e(route('control.Delete', $product->id)); ?>" class="edit btn btn-primary action submit">DELETE</a>
                    </div>
                </div>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            <?php if($count == 0): ?>
                <div class="message">
                    <h4>No products found...</h4>
                </div>
            <?php endif; ?>
        <?php endif; ?>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>