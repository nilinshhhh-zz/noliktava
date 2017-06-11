<?php
Route::get('/', function () {
    $posts = App\Post::all();
    return view('index', compact('posts'));
});

Route::get('/gallery',
    ['as' => 'gallery', 'uses' => 'Gallery@getMedia']);

Route::get('/about',
    ['as' => 'about', 'uses' => 'About@create']
);

Route::get('post/{slug}', function($slug){
    $post = App\Post::where('slug', '=', $slug)->firstOrFail();
    return view('post', compact('post'));
});

Route::get('/contacts',
    ['as' => 'contact', 'uses' => 'Contacts@create']);

Route::post('/contacts',
    ['as' => 'contact_store', 'uses' => 'Contacts@store']);

Route::post('/search',
    ['as' => 'search', 'uses' => 'Search@search']);

Route::post('/order-control/search',
    ['as' => 'searchOrders', 'uses' => 'Search@searchOrders']);

Route::post('/product-control/search',
    ['as' => 'searchControl', 'uses' => 'Search@searchControl']);

Route::post('/orderControl/changeOrderStatus',
    ['as' => 'changeOrderStatus', 'uses' => 'ProductController@changeOrderStatus']);

Route::get('/product-control/delete/{id}', [
    'uses' => 'ProductController@controlDelete',
    'as' => 'control.Delete',
    'middleware' => 'auth'
]);

Route::get('/product-control/edit/{id}', [
    'uses' => 'ProductController@controlEdit',
    'as' => 'control.Edit',
    'middleware' => 'auth'
]);

Route::get('/product-control/add', [
    'uses' => 'ProductController@controlAdd',
    'as' => 'control.Add',
    'middleware' => 'auth'
]);

Route::get('/add-to-cart/{id}', [
    'uses' => 'ProductController@addToCart',
    'as' => 'product.addToCart',
    'middleware' => 'auth'
]);

Route::get('/remove-from-cart/{id}', [
    'uses' => 'ProductController@removeFromCart',
    'as' => 'product.removeFromCart'
]);

Route::get('/shopping-cart', [
    'uses' => 'ProductController@getCart',
    'as' => 'product.shoppingCart',
    'middleware' => 'auth'
]);

Route::get('/order-control', [
    'uses' => 'ProductController@controlOrders',
    'as' => 'order.control',
    'middleware' => 'auth'
]);

Route::get('/product-control', [
    'uses' => 'ProductController@controlProducts',
    'as' => 'product.control',
    'middleware' => 'auth'
]);

Route::get('/checkout', [
    'uses' => 'ProductController@getCheckout',
    'as' => 'checkout',
    'middleware' => 'auth'
]);

Route::post('/checkout', [
    'uses' => 'ProductController@postCheckout',
    'as' => 'checkout'
]);

Route::post('/product-control/edit', [
    'uses' => 'ProductController@controlPostEdit',
    'as' => 'control.postedit'
]);

Route::post('/product-control', [
    'uses' => 'ProductController@controlPostAdd',
    'as' => 'control.postAdd'
]);

Route::get('/orders', [
   'uses' => 'Account@loadMyOrders',
    'as' => 'account.myorders',
    'middleware' => 'auth'
]);

Route::get('/shop',
    ['as' => 'shop', 'uses' => 'ProductController@getIndex']);

Route::get('/shop/{id}', [
    'uses' => 'ProductController@filterByCategory',
    'as' => 'shop.filter'
]);

Route::get('/home', 'HomeController@index')->name('home');

Auth::routes();

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
