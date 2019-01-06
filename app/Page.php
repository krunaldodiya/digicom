<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class Page extends Model
{
    protected $fillable = [
       'category_id', 'name', 'description', 'photo', 'public', 'status', 'created_at', 'updated_at',
    ];

    public function members()
    {
        return $this->hasMany(User::class);
    }

    protected $dates = ['created_at', 'updated_at'];
}
