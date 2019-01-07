<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PostImage extends Model
{
    protected $fillable = [
        'page_id', 'post_id', 'user_id', 'photo', 'created_at', 'updated_at',
    ];

    protected $dates = ['created_at', 'updated_at'];
}
