<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\Http\Requests\UidSetting;
use App\Http\Requests\MobileSetting;
use App\Repositories\UserRepository;

class SettingController extends Controller
{
    public $userRepo;

    public function __construct(UserRepository $userRepo)
    {
        $this->userRepo = $userRepo;
    }

    public function deleteAccount(Request $request)
    {
        $authUser = auth()->user();

        try {
            $delete = $authUser->delete();

            return ['deleted' => $delete ? true : false];
        } catch (Exception $e) {
            return ['error' => $e->getMessage()];
        }
    }

    public function setMobileStatus(Request $request)
    {
        $authUser = auth()->user();
        $setting = $request['setting'];

        try {
            $authUser->setting()->update(['show_mobile' => $setting]['show_mobile']);
            $user = $this->userRepo->getUserById($authUser['id']);

            return compact('user');
        } catch (Exception $e) {
            return ['error' => $e->getMessage()];
        }
    }

    public function setBirthdayStatus(Request $request)
    {
        $authUser = auth()->user();
        $setting = $request['setting'];

        try {
            $authUser->setting()->update(['show_birthday' => $setting]['show_birthday']);
            $user = $this->userRepo->getUserById($authUser['id']);

            return compact('user');
        } catch (Exception $e) {
            return ['error' => $e->getMessage()];
        }
    }

    public function changeMobile(MobileSetting $request)
    {
        $authUser = auth()->user();
        $secondary_mobile = $request['secondary_mobile'];

        try {
            $authUser->update(['secondary_mobile' => $secondary_mobile]);
            $user = $this->userRepo->getUserById($authUser['id']);

            return compact('user');
        } catch (Exception $e) {
            return ['error' => $e->getMessage()];
        }
    }
}
