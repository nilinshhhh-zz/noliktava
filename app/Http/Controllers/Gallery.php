<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;

class Gallery extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    /**
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function getMedia() // gets all images from specific folder for gallery
    {
        $dir = "img/media"; // directory
        $ImagesArray[] = null; // define empty array
        $file_display = [ 'jpg', 'jpeg', 'png', 'gif' ]; // allowed file types

        if (file_exists($dir) == false) { // if directory doesnt exist
            return null;
        }
        else {
            $dir_contents = scandir($dir); // scans php directory
            foreach ($dir_contents as $file) { // loops trough all files and adds them in array
                $file_type = pathinfo($file, PATHINFO_EXTENSION);
                if (in_array($file_type, $file_display) == true) {
                    $ImagesArray[] = $file;
                }
            }
        }
        return view ('/gallery')->with('gallery', $ImagesArray); // returns view with image array
    }
}