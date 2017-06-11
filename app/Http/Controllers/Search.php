<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests\SearchRequest;
use App\Product;
use App\Order;
use TCG\Voyager\Models\Category;

class Search extends Controller
{

    public function search(SearchRequest $request)
    {
       $key = $request->get('keyword');
       $products = Product::where('title', $key)
            ->orWhere('title', 'like', '%' . $key . '%')->get();
        $categories = Category::all();
        return view('shop/shop', ['products' => $products, 'categories'=>$categories, 'searchActive'=>'active']);
    }

    public function searchControl(SearchRequest $request)
    {
        $key = $request->get('keyword');
        $products = Product::where('title', $key)
            ->orWhere('title', 'like', '%' . $key . '%')->get();
        return view('control/products', ['products' => $products, 'searchActive'=>'active']);
    }

    public function searchOrders(SearchRequest $request)
    {
        $key = $request->get('keyword');
        $orders = Order::where('name', $key)
            ->orWhere('name', 'like', '%' . $key . '%')->get();
        return view('control/orders', ['orders' => $orders, 'searchActive'=>'active']);
    }
}
