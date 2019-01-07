<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class Post extends Model
{
    protected $fillable = [
        'name', 'description', 'photo', 'status', 'created_at', 'updated_at',
    ];

    public function members()
    {
        return $this->hasMany(User::class);
    }

    protected $dates = ['created_at', 'updated_at'];
}
