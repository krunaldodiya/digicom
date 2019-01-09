<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Relative;
use App\User;

class FamilyController extends Controller
{
    public function manageRequest(Request $request)
    {
        $authUser = auth()->user();

        if ($request->type === 'send') {
            return $this->send($request, $authUser);
        }

        if ($request->type === 'add') {
            return $this->add($request, $authUser);
        }

        if ($request->type === 'remove') {
            return $this->remove($request, $authUser);
        }
    }

    public function send($request, $authUser)
    {
        $from = $request->from;
        $to = $request->to;

        try {
            Relative::insert([
                [
                    'user_id' => $authUser['id'],
                    'from' => $from,
                    'to' => $to,
                    'from_relation' => $request['from_relation'],
                    'to_relation' => $request['to_relation'],
                    'status' => false
                ],
                [
                    'user_id' => $authUser['id'],
                    'from' => $to,
                    'to' => $from,
                    'from_relation' => $request['to_relation'],
                    'to_relation' => $request['from_relation'],
                    'status' => false
                ]
            ]);

            $from = User::with('caste', 'sub_caste', 'setting', 'relatives.user.setting')->where(['id' => $from])->first();
            $to = User::with('caste', 'sub_caste', 'setting', 'relatives.user.setting')->where(['id' => $to])->first();

            return compact('from', 'to');
        } catch (Exception $e) {
            return ['error' => $e->getMessage()];
        }
    }

    public function add($request, $authUser)
    {
        $from = $request->from;
        $to = $request->to;

        try {
            Relative::where(['from' => $from, 'to' => $to])
                ->orWhere(['from' => $to, 'to' => $from])
                ->update(['status' => true]);

            $from = User::with('caste', 'sub_caste', 'setting', 'relatives.user.setting')->where(['id' => $from])->first();
            $to = User::with('caste', 'sub_caste', 'setting', 'relatives.user.setting')->where(['id' => $to])->first();

            return compact('from', 'to');
        } catch (Exception $e) {
            return ['error' => $e->getMessage()];
        }
    }

    public function remove($request, $authUser)
    {
        $from = $request->from;
        $to = $request->to;

        try {
            Relative::where(['from' => $from, 'to' => $to])
                ->orWhere(['from' => $to, 'to' => $from])
                ->delete();

            $from = User::with('caste', 'sub_caste', 'setting', 'relatives.user.setting')->where(['id' => $from])->first();
            $to = User::with('caste', 'sub_caste', 'setting', 'relatives.user.setting')->where(['id' => $to])->first();

            return compact('from', 'to');
        } catch (Exception $e) {
            return ['error' => $e->getMessage()];
        }
    }

    public function addMember()
    {
        //
    }

    public function switchMember()
    {
        //
    }
}
