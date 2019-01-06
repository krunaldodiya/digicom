<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Carbon\Carbon;
use App\Caste;
use App\User;
use App\Community;
use App\Http\Requests\AddCommunity;

class CommunityController extends Controller
{
    public function __construct()
    {
        //
    }

    public function getCommunities(Request $request)
    {
        $communities = Community::withCount('members')
            ->orderBy('members_count', 'desc')
            ->orderBy('created_at', 'desc')
            ->get();

        return ['communities' => $communities];
    }

    public function addCommunity(AddCommunity $request)
    {
        $community = Community::create($request->all());

        $communities = Community::withCount('members')
            ->orderBy('members_count', 'desc')
            ->orderBy('created_at', 'desc')
            ->get();

        return ['communities' => $communities];
    }
}
