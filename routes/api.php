<?php

use App\User;

Route::group(['prefix' => 'test', 'middleware' => 'guest:api'], function () {
    Route::get('/', function () {
        $user = User::with('setting')
            ->where(['mobile' => '9426726815'])
            ->first();

        return ['data' => $user->setting->user_id];
    });
});

Route::group(['prefix' => 'settings', 'middleware' => 'auth:api'], function () {
    Route::post('/set-mobile-status', 'SettingController@setMobileStatus');
    Route::post('/set-birthday-status', 'SettingController@setBirthdayStatus');
    Route::post('/update-aadhaar-card', 'SettingController@updateAadhaarCard');
    Route::post('/update-secondary-mobile', 'SettingController@updateSecondaryMobile');
    Route::post('/delete-account', 'SettingController@deleteAccount');
});

Route::group(['prefix' => 'otp', 'middleware' => 'guest:api'], function () {
    Route::post('/request-otp', 'OtpController@requestOtp');
    Route::post('/verify-otp', 'OtpController@verifyOtp');
});

Route::group(['prefix' => 'sessions'], function () {
    Route::post('/login', 'AuthController@login');
    Route::post('/register', 'AuthController@register');
});

Route::group(['prefix' => 'users', 'middleware' => 'auth:api'], function () {
    Route::post('/id', 'UserController@getUserById');
    Route::post('/me', 'UserController@me');
    Route::post('/all', 'UserController@getAllUsers');
    Route::post('/profile/update', 'UserController@updateUserProfile');
});

Route::group(['prefix' => 'users'], function () {
    Route::post('/mobile', 'UserController@getUsersByMobile');
});

Route::group(['prefix' => 'avatar', 'middleware' => 'auth:api'], function () {
    Route::post('/change', 'UserController@changeAvatar');
});

Route::group(['prefix' => 'relation', 'middleware' => 'auth:api'], function () {
    Route::post('/request', 'RelativeController@requestRelation');
});

Route::group(['prefix' => 'wallet', 'middleware' => 'auth:api'], function () {
    Route::post('/info', 'UserController@wallet');
});