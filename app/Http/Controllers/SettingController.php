<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\Http\Requests\UidSetting;
use App\Http\Requests\MobileSetting;

class SettingController extends Controller
{
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
            $user = User::with('caste', 'sub_caste', 'setting', 'relatives.user.setting')->where(['id' => $authUser['id']])->first();

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
            $user = User::with('caste', 'sub_caste', 'setting', 'relatives.user.setting')->where(['id' => $authUser['id']])->first();

            return compact('user');
        } catch (Exception $e) {
            return ['error' => $e->getMessage()];
        }
    }

    public function updateAadhaarCard(UidSetting $request)
    {
        $authUser = auth()->user();
        $uid = $request['uid'];

        try {
            $authUser->update(['uid' => $uid]);
            $user = User::with('caste', 'sub_caste', 'setting', 'relatives.user.setting')->where(['id' => $authUser['id']])->first();

            return compact('user');
        } catch (Exception $e) {
            return ['error' => $e->getMessage()];
        }
    }

    public function updateSecondaryMobile(MobileSetting $request)
    {
        $authUser = auth()->user();
        $secondary_mobile = $request['secondary_mobile'];

        try {
            $authUser->update(['secondary_mobile' => $secondary_mobile]);
            $user = User::with('caste', 'sub_caste', 'setting', 'relatives.user.setting')->where(['id' => $authUser['id']])->first();

            return compact('user');
        } catch (Exception $e) {
            return ['error' => $e->getMessage()];
        }
    }
}
