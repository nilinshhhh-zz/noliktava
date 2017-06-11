<?php $__env->startSection('content'); ?>
    <link rel="stylesheet" href="<?php echo asset('css/account.css')?>" type="text/css">
    <div class="container account">
        <div class="row">
            <?php if(count($orders) < 1): ?>
                <div class="col-sm-6 col-md-6 col-md-offset-3 col-sm-offset-3 title">
                    <h1>You have no orders...</h1>
                </div>
            <?php else: ?>
                <div class="col-sm-6 col-md-6 col-md-offset-3 col-sm-offset-3 title">
                    <h1>My Orders</h1>
                </div>
                <?php $__currentLoopData = $orders; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $order): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <div class="col-sm-6 col-md-6 col-md-offset-3 col-sm-offset-3 order-container">
                        <div class="orderid">
                            Invoice ID : <?php echo e(sprintf('%08d', $order->id)); ?>

                        </div>
                        <div class="name">
                            Name : <?php echo e($order->name); ?>

                        </div>
                        <div class="email">
                            Email : <?php echo e($order->contact_email); ?>

                        </div>
                        <div class="address">
                            Address :
                            <?php $address = unserialize($order->address)?>
                            <?php $__currentLoopData = $address; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $addressField): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <?php echo e($addressField); ?>

                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </div>
                        <div class="notes">
                            Custom notes : <?php echo e($order->notes); ?>

                        </div>
                        <?php $cart = unserialize($order->cart); ?>
                        <div class="order-totals">
                            <div class="total qty">
                                Total qty :<?php echo e($cart->totalQty); ?>

                            </div>
                            <div class="total price">
                                Total price : $<?php echo e($cart->totalPrice); ?>

                            </div>
                            <div class="total status">
                                <?php $status = ($order->status == 0) ? 'Processing' : 'Finished'; ?>
                                Status : <?php echo e($status); ?>

                            </div>
                        </div>
                        <div class="order-products">
                                <div class="order-title">
                                    Products :
                                </div>
                            <?php $__currentLoopData = $cart->items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <div class="order-product">
                                    <div class="product name">
                                       - <?php echo e($product['item']->title); ?>

                                    </div>
                                    <div class="product price">
                                        ($<?php echo e($product['item']->price); ?>)
                                    </div>
                                </div>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </div>
                    </div>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            <?php endif; ?>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('scripts'); ?>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.app', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>