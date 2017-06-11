<?php
namespace App;

use Session;

class Cart
{
    public $items;
    public $totalQty;
    public $totalPrice;

    public function __construct($oldCart)
    {
        if ($oldCart) {
            $this->items = $oldCart->items;
            $this->totalQty = $oldCart->totalQty;
            $this->totalPrice = $oldCart->totalPrice;

        }
    }

    // Adds item to cart session
    public function add($item, $id) {
        // structure
        $storedItem =
            [
                'qty' => 0,
                'price' => $item->price,
                'item' => $item
            ];
        // if there are items in current cart
        if ($this->items) {
            if (array_key_exists($id, $this->items)) {
                $storedItem = $this->items[$id];
            }
        }
        // adds quantity, calculates price
        $storedItem['qty']++;
        $storedItem['price'] = $item['price'] * $storedItem['qty'];
        $this->items[$id] = $storedItem;
        $this->totalQty++;
        $this->totalPrice += $item->price;
    }

    // Removes by one quantity at the time from cart
    public static function remove($item,$id) {
        // checks if session has cart
        if(Session::has('cart')){
            $cart=Session::get('cart');
            $products=$cart->items; // gets all cart items
            if(array_key_exists($id,$products)) { // searches for specific id in cart items
                if($products[$id]['qty']>1){ // if quantity if larger than one - remove by one item
                    $cart->totalQty--;
                    $cart->totalPrice=$cart->totalPrice-$item->price;
                    $products[$id]['qty']--;
                    $products[$id]['price']=$item->price;
                } else { // if quantity is 1 - delete item
                    unset($products[$id]);
                    $cart->totalQty--; // decrease quantity
                    if (($cart->totalPrice - $item->price) < 0) { // bugfix - never let cart be under 0 price
                        $cart->totalPrice = 0;
                    } else {
                        $cart->totalPrice = $cart->totalPrice - $item->price;
                    }

                }
            }
            $newCart=new Cart($cart); // creates new cart instance
            $newCart->totalQty=$cart->totalQty; // adds new value in new cart
            if ($newCart->totalQty <= 0) { // checks quantity (bugfix)
                return null;
            }
            $newCart->totalPrice=$cart->totalPrice;
            $newCart->items=$products;
            return $newCart; // returns new cart
        }
    }
}