<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UserPage extends Model
{
    use HasApiTokens, Notifiable, HasWallet;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'community_id', 'name', 'father_city', 'mother_city', 'mobile', 'secondary_mobile', 'gender', 'dob',
        'marital_status', 'education', 'occupation', 'address', 'avatar', 'profile_updated', 'created_at', 'updated_at'
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

    public function setPasswordAttribute($password)
    {
        $this->attributes['password'] = bcrypt($password);
    }

    public function getAgeAttribute()
    {
        return Carbon::parse($this->attributes['dob'])->age;
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

    public function relatives()
    {
        return $this->hasMany(Relative::class, 'to');
    }

    public function community()
    {
        return $this->belongsTo(Community::class);
    }
}
