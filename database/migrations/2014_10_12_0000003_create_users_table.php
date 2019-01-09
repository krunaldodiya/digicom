<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->increments('id');
            $table->string('mobile', 10)->unique()->nullable();
            $table->string('secondary_mobile', 10);
            $table->string('name')->nullable();
            $table->string('dob', 10)->nullable();
            $table->string('gender')->default('Male');
            $table->string('avatar')->nullable();
            $table->string('marital_status')->default('Single');
            $table->boolean('status')->default(false);
            $table->rememberToken();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}
