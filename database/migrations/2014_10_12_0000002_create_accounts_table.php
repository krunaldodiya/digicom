<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAccountsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('accounts', function (Blueprint $table) {
            $table->increments('id');

            $table->unsignedInteger('user_id');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');

            $table->string('secondary_mobile', 10);
            $table->string('name')->nullable();
            $table->string('dob', 10)->nullable();
            $table->string('gender')->default('Male');
            $table->string('avatar')->nullable();

            $table->string('marital_status')->default('Single');
            $table->string('education')->nullable();
            $table->string('occupation')->nullable();
            $table->string('father_city')->nullable();
            $table->string('mother_city')->nullable();
            $table->text('address')->nullable();
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
        Schema::dropIfExists('accounts');
    }
}
