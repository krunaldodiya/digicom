<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UserRelative extends Model
{
    protected $fillable = [
        'user_id', 'from', 'to', 'from_relation', 'to_relation', 'status', 'created_at', 'updated_at',
    ];

    protected $dates = ['created_at', 'updated_at'];

    public function user()
    {
        return $this->hasOne(User::class, 'id', 'from');
    }
}
