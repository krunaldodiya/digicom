<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\Http\Requests\UpdateUserProfile;
use App\Repositories\UserRepository;

class UserController extends Controller
{
    public $userRepo;

    public function __construct(UserRepository $userRepo)
    {
        $this->userRepo = $userRepo;
    }

    public function me()
    {
        $authUser = auth()->user();
        $user = $this->userRepo->getUserById($authUser['id']);

        return compact('user');
    }

    public function getUserById(Request $request)
    {
        $user = $this->userRepo->getUserById($request['user_id']);

        return compact('user');
    }

    public function updateProfile(UpdateUserProfile $request)
    {
        $authUser = auth()->user();

        try {
            $authUser->update($request->only(['name', 'dob', 'gender', 'avatar', 'status']));
            $user = $this->userRepo->getUserById($authUser['id']);

            return compact('user');
        } catch (Exception $e) {
            return ['error' => $e->getMessage()];
        }
    }

    public function changeAvatar(Request $request)
    {
        $authUser = auth()->user();

        $update = $authUser->update(['avatar' => $request->avatar]);

        return ['success' => $update ? true : false];
    }

    public function addMember(Request $request)
    {
        $authUser = auth()->user();

        $update = $authUser->update(['avatar' => $request->avatar]);

        return ['success' => $update ? true : false];
    }
}
