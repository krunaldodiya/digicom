<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UserProfile extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'mobile', 'created_at', 'updated_at'
    ];

    protected $dates = ['created_at', 'updated_at'];
}
