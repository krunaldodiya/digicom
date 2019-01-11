<?php

Route::group(['prefix' => 'admin', 'middleware' => 'guest:api'], function () {
    Route::get('/test', function () {
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