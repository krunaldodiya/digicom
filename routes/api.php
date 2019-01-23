<?php

use App\User;

Route::group(['prefix' => 'admin', 'middleware' => 'guest:api'], function () {
    Route::get('/test', function () {
        $user = User::with('contacts', 'community.detail')->find(1);
        $skip = $user->setting()->update(['skip_community' => true]);

        return ['user' => $user];
    });
});

Route::group(['prefix' => 'otp', 'middleware' => 'guest:api'], function () {
    Route::post('/request-otp', 'OtpController@requestOtp');
    Route::post('/verify-otp', 'OtpController@verifyOtp');
});

Route::group(['prefix' => 'settings', 'middleware' => 'auth:api'], function () {
    Route::post('/set-mobile-status', 'SettingController@setMobileStatus');
    Route::post('/set-birthday-status', 'SettingController@setBirthdayStatus');
    Route::post('/change-mobile', 'SettingController@changeMobile');
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
    Route::post('/remove', 'FamilyController@removeMember');
    Route::post('/add', 'FamilyController@addMember');
    Route::post('/update', 'FamilyController@updateMember');
});

Route::group(['prefix' => 'communities', 'middleware' => 'auth:api'], function () {
    Route::post('/get', 'CommunityController@get');
    Route::post('/skip', 'CommunityController@skip');
    Route::post('/select', 'CommunityController@select');
});