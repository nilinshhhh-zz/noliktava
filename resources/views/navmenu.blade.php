<div class="cd-secondary-nav">
    <a href="#" class="cd-secondary-nav-trigger">Menu<span></span></a> <!-- button visible on small devices -->
    <nav>
        <ul>
            @foreach($items as $menu_item)
                <li>
                    <a href="{{ $menu_item->url }}" style="text-decoration:none">
                        <b><font size="2">{{ $menu_item->title }}</font></b>
                        <span></span><!-- icon -->
                    </a>
                </li>
            @endforeach
        </ul>
    </nav>
</div>