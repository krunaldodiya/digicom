<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Community extends Model
{
    protected $fillable = [
        'religion', 'name', 'photo', 'status', 'created_at', 'updated_at',
    ];

    protected $dates = ['created_at', 'updated_at'];

    public function members()
    {
        return $this->hasMany(UserCommunity::class);
    }
}
