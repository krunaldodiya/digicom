<?php

namespace App\Providers;

use Illuminate\Support\Facades\Event;
use Illuminate\Auth\Events\Registered;
use Illuminate\Auth\Listeners\SendEmailVerificationNotification;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

use App\Events\UserWasCreated;
use App\Listeners\CreateUserWallet;
use App\Events\UpdateOrderStatus;
use App\Listeners\OrderStatusUpdated;
use App\Listeners\CreateUserSetting;
use App\Events\CommunityWasSubscribed;
use App\Listeners\CreateUserDirectory;

class EventServiceProvider extends ServiceProvider
{
    /**
     * The event listener mappings for the application.
     *
     * @var array
     */
    protected $listen = [
        UpdateOrderStatus::class => [
            OrderStatusUpdated::class,
        ],

        UserWasCreated::class => [
            CreateUserWallet::class,
            CreateUserSetting::class,
        ],

        CommunityWasSubscribed::class => [
            CreateUserDirectory::class,
        ]
    ];

    /**
     * Register any events for your application.
     *
     * @return void
     */
    public function boot()
    {
        parent::boot();

        //
    }
}
