<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Repositories\UserRepository;

class AuthController extends Controller
{
    public $userRepo;

    public function __construct(UserRepository $userRepo)
    {
        $this->userRepo = $userRepo;
    }

    public function showLogin()
    {
        return view('login');
    }

    public function processLogin(Request $request)
    {
        $auth = $request->password === "iamkrunal@1987";

        return $auth ? auth()->loginUsingId(1) : redirect()->back()->withErrors('Authentication failed.');
    }
}
