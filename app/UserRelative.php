<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UserRelative extends Model
{
    protected $fillable = [
        'user_id', 'relative_id', 'relation', 'status', 'created_at', 'updated_at',
    ];

    protected $dates = ['created_at', 'updated_at'];

    public function relative()
    {
        return $this->hasOne(User::class, 'id', 'relative_id');
    }
}
