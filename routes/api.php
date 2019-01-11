<?php

use App\User;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

$data = [
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jammu & Kashmir",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttarakhand",
    "Uttar Pradesh",
    "West Bengal",
    "Andaman and Nicobar Islands",
    "Chandigarh",
    "Dadra and Nagar Haveli",
    "Daman & Diu",
    "The Government of NCT of Delhi",
    "Lakshadweep",
    "Puducherry"
];

Route::group(['prefix' => 'admin', 'middleware' => 'guest:api'], function () use ($data) {
    Route::get('/test', function () use ($data) {
        $private_jobs = collect($data)->map(function ($state) {
            return [
                "name" => "Private jobs in $state",
                "topic_id" => 4,
                "owner_id" => 1,
                'photo' => 'https://templatic.com/_data/icons/Multiple-job-types.png',
                'anyone_can_post' => true,
                'anyone_can_join' => true,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ];
        });

        $government_jobs = collect($data)->map(function ($state) {
            return [
                "name" => "Government jobs in $state",
                "topic_id" => 4,
                "owner_id" => 1,
                'photo' => 'https://templatic.com/_data/icons/Multiple-job-types.png',
                'anyone_can_post' => true,
                'anyone_can_join' => true,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ];
        });

        $breaking_news = collect($data)->map(function ($state) {
            return [
                "name" => "Breaking news of $state",
                "topic_id" => 5,
                "owner_id" => 1,
                'photo' => 'https://spacecoasttpo.com/wp-content/uploads/2017/08/News_feed.png',
                'anyone_can_post' => true,
                'anyone_can_join' => true,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ];
        });

        $final = array_merge($private_jobs->toArray(), $government_jobs->toArray(), $breaking_news->toArray());

        $insert = DB::table('groups')->insert($final);
        return 'done';


    });
});

Route::group(['prefix' => 'otp', 'middleware' => 'guest:api'], function () {
    Route::post('/request-otp', 'OtpController@requestOtp');
    Route::post('/verify-otp', 'OtpController@verifyOtp');
});

Route::group(['prefix' => 'settings', 'middleware' => 'auth:api'], function () {
    Route::post('/set-mobile-status', 'SettingController@setMobileStatus');
    Route::post('/set-birthday-status', 'SettingController@setBirthdayStatus');
    Route::post('/update-aadhaar-card', 'SettingController@updateAadhaarCard');
    Route::post('/update-secondary-mobile', 'SettingController@updateSecondaryMobile');
    Route::post('/delete-account', 'SettingController@deleteAccount');
});

Route::group(['prefix' => 'users', 'middleware' => 'auth:api'], function () {
    Route::post('/id', 'UserController@getUserById');
    Route::post('/me', 'UserController@me');
    Route::post('/all', 'UserController@getAllUsers');
    Route::post('/profile/update', 'UserController@updateProfile');
    Route::post('/avatar/change', 'UserController@changeAvatar');
});

Route::group(['prefix' => 'family', 'middleware' => 'auth:api'], function () {
    Route::post('/request', 'FamilyController@manageRequest');
    Route::post('/add', 'FamilyController@addMember');
    Route::post('/switch', 'FamilyController@switchMember');
});