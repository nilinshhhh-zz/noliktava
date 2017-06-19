@extends('layouts.app')

@section('content')
    <div class="container">
            <div class="row">
                <div class="col-sm-6 col-md-6 col-md-offset-3 col-sm-offset-3">
                    <h1>Checkout</h1>
                    <h4>Your total: ${{$total}}</h4>
                    <form action="{{route('checkout')}}" method="post" id="checkout-form">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label for="name">Full Name</label>
                                    <input type="text" id="name" name="name" class="form-control" required>
                                </div>
                            </div>
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label for="email">Email address</label>
                                    <input type="email" id="email" name="email" class="form-control" required>
                                </div>
                            </div>
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label for="street">Street</label>
                                    <input type="text" id="street" class="form-control" name="street" required>
                                </div>
                            </div>
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label for="city">City</label>
                                    <input type="text" id="city" class="form-control" name="city" required>
                                </div>
                            </div>
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label for="country">Country</label>
                                    <input type="text" id="country" class="form-control" name="country" required>
                                </div>
                            </div>
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label for="postcode">Postcode</label>
                                    <input type="text" id="postcode" class="form-control" name="postcode" required>
                                </div>
                            </div>
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label for="telephone">Phone</label>
                                    <input type="number" id="telephone" class="form-control" name="telephone" required>
                                </div>
                            </div>
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label for="telephone">Custom notes</label>
                                    <textarea type="text" id="notes" class="form-control" name="notes" required></textarea>
                                </div>
                            </div>
                        </div>
                        {{csrf_field()}}
                        <button type="submit" class="btn btn-success">
                            Submit Order
                        </button>

                    </form>
                </div>
            </div>
    </div>
@endsection

@section('scripts')
@endsection
