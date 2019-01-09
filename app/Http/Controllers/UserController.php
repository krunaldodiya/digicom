<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Caste;
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

    public function getUsersByMobile(Request $request)
    {
        $users = User::where('mobile', $request->mobile)
            ->orWhere('secondary_mobile', $request->mobile)
            ->get();

        return compact('users');
    }

    public function getUserById(Request $request)
    {
        $user = $this->userRepo->getUserById($request['user_id']);

        return compact('user');
    }

    public function updateUserProfile(UpdateUserProfile $request)
    {
        $authUser = auth()->user();
        $input = $request->only(['name', 'dob', 'gender', 'marital_status', 'avatar', 'status']);

        try {
            $authUser->update($input);
            $user = $this->userRepo->getUserById($authUser['id']);

            return compact('user');
        } catch (Exception $e) {
            return ['error' => $e->getMessage()];
        }
    }

    public function getAllUsers(Request $request)
    {
        $limit = 10;
        $authUser = auth()->user();
        $users = User::with('setting', 'relatives.user.setting')
            ->where(['status' => true])
            ->where(function ($query) use ($request) {
                if ($request->has('filters')) {
                    $filters = $request['filters'];

                    if ($filters['keywords']) {
                        $keywords = $filters['keywords'];

                        $query
                            ->where('name', 'LIKE', "%${keywords}%")
                            ->orWhere('mobile', 'LIKE', "%${keywords}%");
                    }

                    if ($filters['father_city']) {
                        $query
                            ->where('father_city', $filters['father_city']);
                    }

                    if ($filters['mother_city']) {
                        $query
                            ->where('mother_city', $filters['mother_city']);
                    }

                    if ($filters['gender'] && $filters['gender'] !== "Any") {
                        $query
                            ->where('gender', $filters['gender']);
                    }

                    if ($filters['marital_status'] && $filters['marital_status'] !== "Any") {
                        $query
                            ->where('marital_status', $filters['marital_status']);
                    }

                    return $query;
                }

                return $query;
            })
            ->orderBy('created_at', 'desc')
            ->paginate($limit);

        return compact('users');
    }

    public function changeAvatar(Request $request)
    {
        $authUser = auth()->user();

        $update = $authUser->update(['avatar' => $request->avatar]);

        return ['success' => $update ? true : false];
    }
}
