<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PageAdmin extends Model
{
    protected $fillable = [
        'user_id', 'page_id', 'created_at', 'updated_at',
    ];

    protected $dates = ['created_at', 'updated_at'];
}
