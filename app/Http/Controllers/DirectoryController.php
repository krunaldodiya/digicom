<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\Repositories\UserRepository;

class UserController extends Controller
{
    public $userRepo;

    public function __construct(UserRepository $userRepo)
    {
        $this->userRepo = $userRepo;
    }

    public function getUsers(Request $request)
    {
        $limit = 10;
        $authUser = auth()->user();
        $users = User::with('setting')
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
}


