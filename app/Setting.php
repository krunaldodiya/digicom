<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Setting extends Model
{
    protected $fillable = [
        'user_id', 'show_mobile', 'show_birthday', 'created_at', 'updated_at',
    ];

    protected $dates = ['created_at', 'updated_at'];
}
