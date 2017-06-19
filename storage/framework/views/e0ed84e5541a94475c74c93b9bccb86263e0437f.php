<?php $__env->startSection('content'); ?>
    <link href="<?php echo e(asset('css/shop.css')); ?>" rel="stylesheet">
    <div class="container cart">
        <?php if(Session::has('cart') && isset($products)): ?>
            <div class="row title col-sm-6 col-md-6 col-md-offset-3 col-sm-offset-3">
                <h2>Your shopping cart :</h2>
            </div>
            <div class="row">
                <div class="product col-sm-6 col-md-6 col-md-offset-3 col-sm-offset-3">
                    <ul class="list-group">
                        <?php $__currentLoopData = $products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <li class="list-group-item product-container">
                                <span class="badge">Qty : <?php echo e($product['qty']); ?></span>
                                <strong><?php echo e($product['item']['title']); ?></strong>
                                <span class="label label-success">$<?php echo e($product['price']); ?></span>
                                <div class="btn-group">
                                    <button type="button" data-toggle="dropdown" class="btn btn-primary btn-xs dropdown-toggle">
                                        <span class="caret">

                                        </span>
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li><a href="<?php echo e(route('product.removeFromCart', [$product['item']['id']])); ?>">Remove</a></li>
                                    </ul>
                                </div>
                            </li>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </ul>
                </div>
            </div>


            <div class="row total">
                <div class="col-sm-6 col-md-6 col-md-offset-3 col-sm-offset-3">
                    <strong>Total: $<?php echo e($totalPrice); ?></strong>
                    <a href="<?php echo e(route('checkout')); ?>" type="button" class="btn btn-success">
                        Checkout
                    </a>
                </div>
            </div>

        <?php else: ?>
            <div class="row">
                <div class="row title col-sm-6 col-md-6 col-md-offset-3 col-sm-offset-3">
                    <h2 class="no-items">No items in cart... <a class="continue" href="<?php echo e(route('shop')); ?>">continue shopping</a></h2>

                </div>
            </div>
        <?php endif; ?>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>