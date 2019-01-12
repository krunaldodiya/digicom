<?php

namespace App\Http\Controllers;

use App\Community;
use App\UserCommunity;

class CommunityController extends Controller
{
    public function getCommunities()
    {
        $communities = Community::withCount('members')->get();
        return ['communities' => $communities];
    }
}
