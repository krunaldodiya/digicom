<?php

namespace App\Http\Controllers;

use App\Community;
use App\UserCommunity;
use Illuminate\Http\Request;
use App\Repositories\UserRepository;

class CommunityController extends Controller
{
    public $userRepo;

    public function __construct(UserRepository $userRepo)
    {
        $this->userRepo = $userRepo;
    }

    public function get(Request $request)
    {
        $communities = Community::withCount('members')->get();

        return ['communities' => $communities];
    }

    public function skip(Request $request)
    {
        $user = auth()->user();

        $skip = $user->setting()->update(['skip_community' => true]);

        return ['success' => $skip];
    }

    public function select(Request $request)
    {
        $authUser = auth()->user();

        $communities = UserCommunity::firstOrCreate([
            'user_id' => $authUser['id'],
            'community_id' => $request['community']['id']
        ]);

        $skip = $authUser->setting()->update(['skip_community' => true]);
        $user = $this->userRepo->getUserById($authUser['id']);

        return ['user' => $user];
    }
}
