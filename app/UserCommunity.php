<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Events\CommunityWasSubscribed;

class UserCommunity extends Model
{
    protected $table = "user_community";

    protected $fillable = [
        'user_id', 'community_id', 'created_at', 'updated_at',
    ];

    protected $dates = ['created_at', 'updated_at'];

    /**
     * The attributes shows the list of events.
     *
     * @var array
     */
    protected $dispatchesEvents = [
        'created' => CommunityWasSubscribed::class
    ];

    public function community()
    {
        return $this->belongsTo(Community::class, 'community_id', 'id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }
}
