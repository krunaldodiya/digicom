<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    protected $fillable = [
        'page_id', 'user_id', 'description', 'category', 'location', 'date', 'contact', 'url', 'created_at', 'updated_at',
    ];

    protected $dates = ['created_at', 'updated_at'];
}
