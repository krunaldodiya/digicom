<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\Repositories\UserRepository;
use App\Directory;

class FamilyController extends Controller
{
    public $userRepo;

    public function __construct(UserRepository $userRepo)
    {
        $this->userRepo = $userRepo;
    }

    public function addMember(Request $request)
    {
        $authUser = auth()->user();

        $default_avatar = "https://res.cloudinary.com/marusamaj/image/upload/c_crop,h_256,w_256,x_0,y_0/v1545459450";
        $man = "${default_avatar}/man.png";
        $woman = "${default_avatar}/woman.png";
        $avatar = $request['gender'] === 'Male' ? $man : $woman;

        Directory::create([
            'user_id' => $authUser['id'],
            'relation' => $request['relation'],
            'gender' => $request['gender'],
            'marital_status' => "Single",
            'avatar' => $avatar
        ]);

        $user = $this->userRepo->getUserById($authUser['id']);
        return compact('user');
    }

    public function updateMember(Request $request)
    {
        $authUser = auth()->user();
        $member = $request->member;

        Directory::where(['id' => $member['id']])
            ->update([
                'avatar' => $member['avatar'],
                'name' => $member['name'],
                'dob' => $member['dob'],
                'marital_status' => $member['marital_status'],
                'father_city' => $member['father_city'],
                'mother_city' => $member['mother_city'],
                'education' => $member['education'],
                'occupation' => $member['occupation'],
                'status' => true
            ]);

        $user = $this->userRepo->getUserById($authUser['id']);
        return compact('user');
    }

    public function removeMember(Request $request)
    {
        $authUser = auth()->user();
        Directory::where(['id' => $request['member_id']])->delete();

        $user = $this->userRepo->getUserById($authUser['id']);
        return compact('user');
    }
}
