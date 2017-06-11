<?php $__env->startSection('content'); ?>
    <div class="container">
        <div class="col-md-3">
            <h2 class="lead">
                <a href="<?php echo e(route('shop')); ?>">
                    Ice Hockey Shop
                </a>
            </h2>

            <div class="list-group">
                <?php $__currentLoopData = $categories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <a href="<?php echo e(route('shop.filter', ['id' => $category->id])); ?>" class="list-group-item"><?php echo e($category->name); ?></a>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </div>
        </div>
        <div class="col-md-9">
            <div class="row search">
                <div class="search">
                    <?php echo Form::open(array('route' => 'search', 'class' => 'form search')); ?>


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
            </div>
        </div>
        <div class="col-md-9">
            <div class="row title">
                <h1><?php if(isset($current)): ?>
                        <?php echo e($current); ?>

                    <?php elseif(isset($searchActive)): ?>
                        Search results
                    <?php else: ?>
                        All categories
                    <?php endif; ?>
                </h1>
            </div>
        </div>
        <div class="col-md-9">
            <?php if((count($products) < 1)): ?>
                <div class="row no-products">
                <h1 class="error">No products found...</h1>
            <?php else: ?>
            <div class="row">
            <?php endif; ?>
                <?php $__currentLoopData = $products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <div class="col-sm-4 col-lg-4 col-md-4 product-container-shop">
                        <div class="thumbnail">
                            <img src="<?php echo e(URL::to('/')); ?>/images/<?php echo e($product->image_path); ?>" alt="picture">
                            <div class="caption">
                                <h4 class="pull-right">$<?php echo e($product->price); ?></h4>
                                <h4><a><?php echo e($product->title); ?></a>
                                </h4>
                                <p><?php echo e($product->description); ?></p>
                                <p>
                                    <?php $__currentLoopData = $categories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <?php if($category->id == $product->category_id): ?>
                                            <?php echo e($category->name); ?>

                                        <?php endif; ?>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </p>
                                <div class="clearfix">
                                    <a href="<?php echo e(route('product.addToCart', ['id' => $product->id])); ?>" class="btn pull-right btn-success">Add To Cart</a>
                                </div>

                            </div>
                        </div>
                    </div>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>