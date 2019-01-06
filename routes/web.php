<?php

use RobinCSamuel\LaravelMsg91\Facades\LaravelMsg91;
use Illuminate\Support\Facades\Storage;
use App\Community;
use Carbon\Carbon;
use App\Page;

Auth::routes();

Route::get('/test', function () {
    $map = collect(Community::get())->map(function ($community) {
        return [
            'category_id' => 5,
            'name' => $community->name,
            'description' => $community->description,
            'photo' => $community->photo,
            'public' => true,
            'status' => true,
            "created_at" => Carbon::now(),
            "updated_at" => Carbon::now(),
        ];
    });

    $create = Page::insert($map->toArray());

    return 'done';
});

Route::get('/', 'HomeController@index')->name('home');

Route::get('/home', 'HomeController@index')->name('home');

Route::get('/terms', 'HomeController@terms')->name('terms');

Route::get('/passport', 'HomeController@passport')->name('passport');

Route::group(['prefix' => 'payments'], function () {
    Route::get('/create-order', 'PaymentController@createOrder')->name('paytm.create-order');
    Route::post('/process-order', 'PaymentController@processOrder')->name('paytm.process-order');
    Route::post('/order-response', 'PaymentController@orderResponse')->name('paytm.order-response');
    Route::get('/order-status', 'PaymentController@orderStatus')->name('payments.order-status');
});

Route::group(['prefix' => 'admin', 'middleware' => 'guest'], function () {
    Route::get('/login', 'AuthController@showLogin')->name('login.get');
    Route::post('/login', 'AuthController@processLogin')->name('login.post');
});

function test()
{
    $religions = [
        "hindu" => "https://cdn4.iconfinder.com/data/icons/smashicons-religion-flat/57/11_-_Hinduism_Flat-128.png",
        "muslim" => "https://cdn4.iconfinder.com/data/icons/ramadan-12/32/mosque-muslim-prayer-building-place-religion-islam-128.png",
        "bahai" => "https://www.makemytrip.com/travel-guide/media/dg_image/delhi/Lotus-Temple-Delhi.jpg",
        "buddhist" => "https://static-s.aa-cdn.net/img/ios/912702199/ff9928716daadd7d83639de432e617d5?v=1",
        "jain" => "https://lh3.googleusercontent.com/-ND8xR_VnE38/Vw--Uefw-II/AAAAAAAAXtw/qQfDaHLbsQY/s1600/images.jpg",
        "jewish" => "http://worldwariiartifacts.weebly.com/uploads/2/9/8/0/29803591/9444881.jpg?360",
        "parsi" => "https://zoroastrianismforbeginners.weebly.com/uploads/2/9/5/5/29552949/6426444.png?315",
        "sikh" => "https://is1-ssl.mzstatic.com/image/thumb/Purple71/v4/72/bc/29/72bc2914-560d-6e14-df51-dac309938210/source/256x256bb.jpg",
    ];

    foreach ($religions as $religion_name => $religion_photo) {
        $file = Storage::disk('public')->get("castes/{$religion_name}.json");
        $json = json_decode($file);

        $map = collect($json)->map(function ($religion) use ($religion_name, $religion_photo) {
            return [
                "name" => ucwords($religion->title),
                "description" => ucwords($religion_name),
                "photo" => $religion_photo,
                "created_at" => Carbon::now(),
                "updated_at" => Carbon::now(),
            ];
        });

        $create = Community::insert($map->toArray());
    }

    return "done";
}