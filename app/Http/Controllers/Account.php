<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Order;
use Auth;

class Account extends Controller
{
    public function loadMyOrders() {
        $orders = Order::all()->where('user_id', Auth::user()->id)->sortByDesc('created_at');;
        return view('account/myorders', ['orders' => $orders]);
    }
}
