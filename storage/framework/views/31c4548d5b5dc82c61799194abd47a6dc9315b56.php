<div class="cd-secondary-nav">
    <a href="#" class="cd-secondary-nav-trigger">Menu<span></span></a> <!-- button visible on small devices -->
    <nav>
        <ul>
            <?php $__currentLoopData = $items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $menu_item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <li>
                    <a href="<?php echo e($menu_item->url); ?>" style="text-decoration:none">
                        <b><font size="2"><?php echo e($menu_item->title); ?></font></b>
                        <span></span><!-- icon -->
                    </a>
                </li>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </ul>
    </nav>
</div>