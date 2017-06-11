@extends('layouts.app')

@section('content')
    <link href="{{ asset('css/control.css') }}" rel="stylesheet">
    <div class="container edit control">
        @if (isset($product))
            <div class="title">
                <h4 class="form-title">Edit product :</h4>
            </div>
            {{ Form::open( array('route' => 'control.postedit', 'id'=>'edit-form', 'files' => true)) }}
                <div class="row">
                    <input type="hidden" id="id" name="id" class="form-control" value="{{$product->id}}" hidden>
                    <div class="col-xs-12">
                        <div class="form-group">
                            <label for="title">Title</label>
                            <input type="text" id="title" name="title" class="form-control" value="{{$product->title}}" required>
                        </div>
                    </div>
                    <div class="col-xs-12">
                        <div class="form-group">
                            <label for="imagepath">Image</label>
                            <input type="file" id="imagepath" name="imagepath" class="form-control">
                        </div>
                    </div>
                    <div class="col-xs-12">
                        <div class="form-group">
                            <label for="changeimage">Change image?</label>
                            <input type="checkbox" id="changeimage" name="changeimage">
                        </div>
                    </div>
                    <div class="col-xs-12">
                        <div class="form-group">
                            <label for="description">Description</label>
                            <textarea type="text" id="description" class="form-control" name="description" required>{{$product->description}}</textarea>
                        </div>
                    </div>
                    <div class="col-xs-12">
                        <div class="form-group">
                            <label for="price">Price ($)</label>
                            <input type="text" id="price" class="form-control" name="price" value="{{$product->price}}" required>
                        </div>
                    </div>
                    <div class="col-xs-12">
                        <div class="form-group">
                            <label for="catid">Category</label>
                            <select type="text" id="catid" class="form-control" name="catid" required>
                                @foreach ($categories as $category)
                                    <option value="{{$category->id}}" <?php if ($category->id == $product->category_id) { echo "selected"; }?>>{{$category->name}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                </div>
                {{csrf_field()}}
                <button type="submit" class="btn btn-success">
                    Submit Edit
                </button>
            {{ Form::close() }}

        @endif
    </div>
@endsection
