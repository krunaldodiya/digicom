<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use KD\Wallet\Traits\HasWallet;
use App\Events\UserWasCreated;
use Laravel\Passport\HasApiTokens;
use Hash;
use Carbon\Carbon;

class User extends Authenticatable
{
    use HasApiTokens, Notifiable, HasWallet;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'mobile', 'name', 'dob', 'gender', 'avatar', 'marital_status', 'status', 'created_at', 'updated_at'
    ];

    protected $appends = ['age'];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'remember_token', 'password'
    ];

    /**
     * The attributes shows the list of events.
     *
     * @var array
     */
    protected $dispatchesEvents = [
        'created' => UserWasCreated::class
    ];

    public function getAgeAttribute()
    {
        return $this->dob ? Carbon::parse($this->dob)->age : 0;
    }

    public function getAvatarAttribute()
    {
        $avatar = $this->attributes['avatar'];

        if (is_null($avatar)) {
            $default_avatar = "https://res.cloudinary.com/marusamaj/image/upload/c_crop,h_256,w_256,x_0,y_0/v1545459450";

            $man = "${default_avatar}/man.png";
            $woman = "${default_avatar}/woman.png";

            $avatar = $this->attributes['gender'] === 'Male' ? $man : $woman;
        }

        return $avatar;
    }

    public function setting()
    {
        return $this->hasOne(Setting::class);
    }

    public function community()
    {
        return $this->belongsTo(UserCommunity::class, 'id', 'user_id');
    }

    public function contacts()
    {
        return $this->hasMany(Contact::class);
    }

    public function family_members()
    {
        return $this->hasMany(Directory::class);
    }
}
