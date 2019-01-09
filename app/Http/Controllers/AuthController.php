<?php

namespace App\Http\Controllers;

use App\Http\Requests\Login;
use App\Http\Requests\Register;
use App\User;
use App\Exceptions\OtpVerificationFailed;
use Error;
use Illuminate\Validation\ValidationException;
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

    protected function getToken($authUser)
    {
        $user = $this->userRepo->getUserById($authUser['id']);
        $token = $user->createToken('SocialStock', [])->accessToken;

        return compact('user', 'token');
    }

    public function login(Login $request)
    {
        try {
            $user = User::find($request->user_id);

            if ($user) {
                return $this->getToken($user);
            }

            throw ValidationException::withMessages([
                'password' => ['Invalid Password.']
            ]);

        } catch (Exception $e) {
            return ['error' => $e->getMessage()];
        }
    }

    public function register(Register $request)
    {
        $authUser = auth()->user();

        try {
            $createUser = User::create([
                'name' => $request->name,
                'gender' => $request->gender,
                'marital_status' => $request->marital_status,
                'dob' => $request->dob,
                'avatar' => $request->avatar,
                'status' => true
            ]);

            if ($createUser && $createUser->setting()->create()) {
                if ($request->relation !== 'Self') {
                    //
                }

                return $this->getToken($createUser);
            }

            throw new OtpVerificationFailed("Error, Try again later.");
        } catch (Exception $e) {
            return ['error' => $e->getMessage()];
        }
    }
}
