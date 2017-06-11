<?php

namespace App\Http\Controllers;

use App\Cart;
use App\Product;
use App\Order;
use Illuminate\Http\Request;
use Session;
use TCG\Voyager\Models\Category;
use TCG\Voyager\Voyager;
use Illuminate\Support\Facades\Auth;
use TCG\Voyager\Facades\Voyager as VoyagerFacades;
use Illuminate\Support\Facades\Storage;

class ProductController extends Controller
{
    public function getIndex() {
        $products = Product::all()->sortByDesc('created_at');
        $categories = Category::all();
        return view('shop/shop', ['products' => $products, 'categories'=>$categories]);
    }

    /** Add to cart */
    public function addToCart(Request $request, $id) {
        $product = Product::find($id); // finds product using Product model
        $oldCart = Session::has('cart') ? Session::get('cart') : null; // checks for cart
        $cart = new Cart($oldCart); // creates new cart from old cart
        $cart->add($product, $product->id); // adds product in cart

        $request->session()->put('cart', $cart);
        $request->session()->flash('message.level', 'success');
        $request->session()->flash('message.content', 'Product successfully added to cart!!');
        return redirect()->back(); // redirects to last location in site
    }

    public function removeFromCart(Request $request, $id) {
        $product = Product::find($id);
        $cart=Cart::remove($product,$product->id);
        if ($cart == null) {
            $request->session()->remove('cart');
        } else {
            $request->session()->put('cart', $cart);
        }

        $request->session()->flash('message.level', 'success');
        $request->session()->flash('message.content', 'Product removed from cart...');
        return redirect()->route('product.shoppingCart');
    }

    public function getCart() {
        if (!Session::has('cart')) {
            return view('shop.shopping-cart');
        }
        $oldCart = Session::get('cart');
        $cart = new Cart($oldCart);
        return view('shop.shopping-cart', ['products' => $cart->items, 'totalPrice' => $cart->totalPrice]);
    }

    public function getCheckout() {
        if (!Session::has('cart')) {
            return view('shop.shopping-cart');
        }
        $oldCart = Session::get('cart');
        $cart = new Cart($oldCart);
        $total = $cart->totalPrice;
        return view('shop.checkout', ['total'=>$total]);
    }

    public function postCheckout(Request $request) {
        if (!Session::has('cart')) { // checks for cart
            return view('shop.shopping-cart');
        }
        $oldCart = Session::get('cart');
        $cart = new Cart($oldCart); // creates new cart from old cart
        try {
            $order = new Order(); // creates new order instance
            $order->cart = serialize($cart); // serializes cart and puts in order instance
            $order->name = $request->input('name');
            $order->telephone = $request->input('telephone');
            $street = $request->input('street');
            $city = $request->input('city');
            $country = $request->input('country');
            $postcode = $request->input('postcode');
            $address = array(); // creates new empty array
            array_push($address, $street, $city, $country, $postcode); // pushes all address fields into one variable
            $order->address = serialize($address); // serializes address variable and pushes into order instance
            $order->contact_email = $request->input('email');
            $order->notes = $request->input('notes');
            $order->status = 0; // default status (processing...)
            Auth::user()->orders()->save($order); // Adds order to customer using model relations
        } catch (\Exception $e) {
            $request->session()->flash('message.level', 'error');
            $request->session()->flash('message.content', 'Couldn\'t make order...');
            return redirect()->route('checkout'); // redirects to checkout if error
        }
        Session::forget('cart'); // clears cart
        $request->session()->flash('message.level', 'success');
        $request->session()->flash('message.content',  'Order sent!');
        return redirect()->route('shop'); // redirects back to shop
    }

    public function filterByCategory(Request $request, $id) {
        $products = Product::all()->where('category_id', $id);
        $categories = Category::all();
        foreach ($categories as $category) {
            if ($category->id == $id) {
                $current = $category->name;
            }
        }
        return view('shop/shop', ['products' => $products, 'categories'=>$categories, 'current' => $current]);
    }


    public function controlProducts() {
        if (!Auth::guest()) {
            $user = VoyagerFacades::model('User')->find(Auth::id());

            if (!$user->hasPermission('browse_admin')) {
                redirect('/');
            }
            $products = Product::all()->sortByDesc('created_at');
            return view('control.products', ['products' => $products]);
        }
    }

    public function controlDelete(Request $request, $id) {
        if (!Auth::guest()) {
            $user = VoyagerFacades::model('User')->find(Auth::id());

            if (!$user->hasPermission('browse_admin')) {
                redirect('/');
            }
            Product::destroy($id);
            $products = Product::all();
            $request->session()->flash('message.level', 'success');
            $request->session()->flash('message.content', 'Product deleted!');
            return view('control.products', ['deleted' => true, 'products' => $products]);
        }
    }

    public function controlEdit(Request $request, $id) {
        if (!Auth::guest()) {
            $user = VoyagerFacades::model('User')->find(Auth::id());

            if (!$user->hasPermission('browse_admin')) {
                redirect('/');
            }
            $product = Product::find($id);
            $categories = Category::all();

            return view('control.edit', ['product' => $product, 'categories' => $categories]);
        }
    }

    /**
     * Post product edit event
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Http\RedirectResponse|\Illuminate\View\View
     */
    public function controlPostEdit(Request $request) {
        $id = $request->input('id');
        try {
            $product = Product::find($id); // finds product by id

            if (($request->input('title') !== null)) {
                $product->title = $request->input('title');
            }

            if ($request->input('changeimage')) { // image upload
                $image = $request->file('imagepath');
                $input['imagename'] = time().'.'.$image->getClientOriginalExtension(); // creates file name
                $destinationPath = public_path('/images'); // set image destination
                $uploadedImage = $image->move($destinationPath, $input['imagename']); // moves file
                $product->image_path = $input['imagename']; // adds imagename to database for product
            }

            if (($request->input('description') !== null)) {
                $product->description = $request->input('description');
            }
            if (($request->input('price') !== null)) {
                $product->price = $request->input('price');
            }
            if (($request->input('catid') !== null)) {
                $product->category_id = $request->input('catid');
            }

            $product->save(); // saves product
        } catch (\Exception $e) {
            $request->session()->flash('message.level', 'error');
            $request->session()->flash('message.content', 'Cannot save this product...');
            return view('control.edit', ['id' => $id]); // if error - returns back to edit with error msg
        }
        $request->session()->flash('message.level', 'success');
        $request->session()->flash('message.content', 'Product saved!');
        return redirect()->route('product.control'); // redirects back to product control
    }

    public function controlAdd(Request $request) {
        if (!Auth::guest()) {
            $user = VoyagerFacades::model('User')->find(Auth::id());

            if (!$user->hasPermission('browse_admin')) {
                redirect('/');
            }

            $categories = Category::all();

            return view('control.add', ['categories' => $categories]);
        }
    }

    public function controlPostAdd(Request $request) {
        try {
            $product = new Product();

            if (($request->input('title') !== null)) {
                $product->title = $request->input('title');
            }

            $image = $request->file('imagepath');
            $input['imagename'] = time().'.'.$image->getClientOriginalExtension();
            $destinationPath = public_path('/images');
            $uploadedImage = $image->move($destinationPath, $input['imagename']);
            $product->image_path = $input['imagename'];

            if (($request->input('description') !== null)) {
                $product->description = $request->input('description');
            }
            if (($request->input('price') !== null)) {
                $product->price = $request->input('price');
            }
            if (($request->input('catid') !== null)) {
                $product->category_id = $request->input('catid');
            }

            $product->save();
        } catch (\Exception $e) {
            $request->session()->flash('message.level', 'error');
            $request->session()->flash('message.content', 'Cannot add this product...'.$e);
            return redirect()->route('control.Add');
        }
        $request->session()->flash('message.level', 'success');
        $request->session()->flash('message.content', 'Product saved!');
        return redirect()->route('product.control');
    }

    public function controlOrders() {
        if (!Auth::guest()) {
            $user = VoyagerFacades::model('User')->find(Auth::id());

            if (!$user->hasPermission('browse_admin')) {
                redirect('/');
            }
            $orders = Order::all()->sortByDesc('created_at');
            return view('control.orders', ['orders' => $orders]);
        }
    }

    /**
     * Change order status (admin)
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function changeOrderStatus(Request $request) {
        if (!Auth::guest()) { // if isnt guest
            $user = VoyagerFacades::model('User')->find(Auth::id());
            if (!$user->hasPermission('browse_admin')) { // if user hasnt permissions redirect to homepage
                redirect('/');
            }
        }
        $orderId = $request->input('id'); // gets data from form
        $status = $request->input('status');
        $order = Order::find($orderId); // finds order id using Order model
        if ($order !== null) { // if finds order
            $order->status = $status;
            $order->save(); // saves data to database
        }
        $request->session()->flash('message.level', 'success');
        $request->session()->flash('message.content', 'Order status changed!');
        $allOrders = Order::all()->sortByDesc('created_at');
        return view('control.orders', ['orders' => $allOrders]); // redirect to order control with orders
    }
}
