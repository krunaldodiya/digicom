<?php

namespace App\Repositories;

use Carbon\Carbon;
use App\Repositories\Contracts\UserRepositoryInterface;
use App\User;

class UserRepository implements UserRepositoryInterface
{
    public function getUserById($user_id)
    {
        return User::with('contacts', 'community', 'family_members', 'setting', 'wallet.transactions')
            ->where(['id' => $user_id])
            ->first();
    }
}