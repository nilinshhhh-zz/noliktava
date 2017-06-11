<?php $__env->startSection('content'); ?>
    <link rel="stylesheet" href="<?php echo asset('css/contacts.css')?>" type="text/css">
    <div class="content-container contact-us">
        <h1>Contact Us</h1>

        <ul>
            <?php $__currentLoopData = $errors->all(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $error): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <li><?php echo e($error); ?></li>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </ul>

        <?php echo Form::open(array('route' => 'contact_store', 'class' => 'form contact')); ?>


        <?php if(Session::get('contact')): ?>
            <div class="alert alert-info">
                <?php echo e(Session::get('contact')); ?>

            </div>
        <?php endif; ?>

        <div class="form-group">
            <?php echo Form::label('Your Name'); ?>

            <?php echo Form::text('name', null,
                array('required',
                      'class'=>'form-control',
                      'placeholder'=>'Your name')); ?>

        </div>

        <div class="form-group">
            <?php echo Form::label('Your E-mail Address'); ?>

            <?php echo Form::text('email', null,
                array('required',
                      'class'=>'form-control',
                      'placeholder'=>'Your e-mail address')); ?>

        </div>

        <div class="form-group">
            <?php echo Form::label('Your Message'); ?>

            <?php echo Form::textarea('message', null,
                array('required',
                      'class'=>'form-control',
                      'placeholder'=>'Your message')); ?>

        </div>

        <div class="form-group">
            <?php echo Form::submit('Contact Us!',
              array('class'=>'btn btn-primary')); ?>

        </div>

        <?php echo Form::close(); ?>

    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>