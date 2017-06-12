<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use TCG\Voyager\Models\Page;

class About extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    public function create()
    {
        // Get content of the about page from the model, feed Page::find with page id
        $about = Page::find(3);
        // Return view with the data
        return view ('about')->with('about', $about);
    }

    public function division() {
        $division = Page::find(4);
        return view('teamdivision')->with('division', $division);
    }
}
