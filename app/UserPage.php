<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UserPage extends Model
{
    protected $fillable = [
        'user_id', 'page_id', 'created_at', 'updated_at',
    ];

    protected $dates = ['created_at', 'updated_at'];
}
