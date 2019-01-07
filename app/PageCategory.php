<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PageCategory extends Model
{
    protected $fillable = [
        'name', 'created_at', 'updated_at',
    ];

    protected $dates = ['created_at', 'updated_at'];
}
