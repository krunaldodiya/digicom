<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Contact extends Model
{
    protected $fillable = [
        'user_id', 'contact_id', 'contact_number', 'contact_name', 'created_at', 'updated_at',
    ];

    protected $dates = ['created_at', 'updated_at'];
}
