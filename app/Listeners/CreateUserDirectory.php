<?php

namespace App\Listeners;

use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use App\Events\CommunityWasSubscribed;
use App\Directory;

class CreateUserDirectory
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  UserWasCreated  $event
     * @return void
     */
    public function handle(CommunityWasSubscribed $event)
    {
        $user = $event->userCommunity->user;

        Directory::firstOrCreate([
            'relation' => 'Self',
            'user_id' => $user->id,
            'name' => $user->name,
            'dob' => $user->dob,
            'gender' => $user->gender,
            'avatar' => $user->avatar
        ]);
    }
}
