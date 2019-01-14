<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Directory extends Model
{
    protected $table = "directory";

    protected $fillable = [
        'user_id', 'relation', 'name', 'dob', 'gender', 'avatar', 'marital_status',
        'education', 'occupation', 'father_city', 'mother_city', 'status', 'created_at', 'updated_at'
    ];

    protected $dates = ['created_at', 'updated_at'];
}
