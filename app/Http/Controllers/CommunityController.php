<?php

namespace App\Http\Controllers;

use App\Community;
use App\UserCommunity;

class CommunityController extends Controller
{
    public function get()
    {
        $communities = Community::withCount('members')->get();

        return ['communities' => $communities];
    }

    public function skip()
    {
        $user = auth()->user();

        $skip = $user->setting()->update(['skip_community' => true]);

        return ['user' => $user];
    }

    public function select(Request $request)
    {
        $user = auth()->user();

        $communities = UserCommunity::firstOrCreate([
            'user_id' => $user->id,
            'community_id' => $request->community_id
        ]);

        $skip = $user->setting()->update(['skip_community' => true]);

        return ['user' => $user];
    }
}
