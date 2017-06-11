<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests\ContactFormRequest;

class Contacts extends Controller
{

    public function create()
    {
        return view('contacts');
    }

    public function store(ContactFormRequest $request)
    {
        try {
            \Mail::send('emails.contact',
                array(
                    'name' => $request->get('name'),
                    'email' => $request->get('email'),
                    'user_message' => $request->get('message')
                ), function($message)
                {
                    $message->from('martins1881@inbox.lv');
                    $message->to('martins1881@inbox.lv', 'Admin')->subject('Contact Us Form');
                });
        } catch(\Exception $e) {
            return \Redirect::route('contact')->with('contact', 'Cannot send email at the moment... please contact administrator');
        }


        return \Redirect::route('contact')->with('contact', 'Thanks for contacting us! We will respond as soon as possible!');

    }
}
