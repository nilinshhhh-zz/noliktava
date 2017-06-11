<?php $__env->startSection('content'); ?>
    <link href="<?php echo e(asset('css/control.css')); ?>" rel="stylesheet">
    <div class="container control">
    <div class="row container search">
        <?php echo Form::open(array('route' => 'searchOrders', 'class' => 'form search')); ?>

        <?php if(Session::get('search')): ?>
            <div class="alert alert-info">
                <?php echo e(Session::get('search')); ?>

            </div>
        <?php endif; ?>
        <div class="sidebar">
            <?php echo Form::text('keyword', null,
                array('required',
                      'class'=>'form-control search',
                      'placeholder'=>'Search orders by name...')); ?>

        </div>
        <div class="form-group">
            <?php echo Form::submit('search',
              array('class'=>'btn btn-primary')); ?>

        </div>
        <?php echo Form::close(); ?>

    </div>
    <div class="container orders">
        <?php if(count($orders) >= 1): ?>
            <h4 class="ordertitle">Orders :</h4>
            <?php $__currentLoopData = $orders; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $order): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <div class="order">
                    <div class="field id">
                        <h4>Invoice ID : <?php echo e(sprintf('%08d', $order->id)); ?></h4>
                    </div>
                    <div class="field name">
                        <h4>Full Name : <?php echo e($order->name); ?></h4>
                    </div>
                    <div class="field email">
                        <h4>Contact Email : <?php echo e($order->contact_email); ?></h4>
                    </div>
                    <div class="field address">
                        <h4>
                            Address :
                            <?php $address = unserialize($order->address)?>
                            <?php $__currentLoopData = $address; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $addressField): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <?php echo e($addressField); ?>

                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </h4>
                    </div>
                    <?php $cart = unserialize($order->cart);?>
                    <div class="field products">
                            <h4 class="order-title">
                                Products :
                            </h4>
                            <?php $__currentLoopData = $cart->items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <div class="order-product">
                                    ID : <?php echo e($product['item']->id); ?> - $<?php echo e($product['item']->price); ?>

                                </div>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </div>
                    <div class="field cart">

                        <h4>Total Qty: <?php echo e($cart->totalQty); ?></h4>
                        <h4>Total Price: $<?php echo e($cart->totalPrice); ?></h4>
                    </div>
                    <div class="field status">
                        <?php echo Form::open(array('route' => 'changeOrderStatus', 'class' => 'form search')); ?>

                        <input name="id" type="hidden" value="<?php echo e($order->id); ?>">
                        <?php echo Form::submit('Change Status',
                            array('class'=>'status btn-primary')); ?>

                        <select name="status">
                            <option value="0" <?php if ($order->status == 0) { echo 'selected'; }?>>
                                Processing
                            </option>
                            <option value="1" <?php if ($order->status == 1) { echo 'selected'; }?>>
                                Finished
                            </option>
                        </select>
                        <?php echo Form::close(); ?>

                    </div>
                </div>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        <?php else: ?>
            <h4 class="ordertitle">No orders found...</h4>
        <?php endif; ?>

    </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>