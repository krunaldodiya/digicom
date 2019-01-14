<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDirectoryTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('directory', function (Blueprint $table) {
            $table->increments('id');

            $table->unsignedInteger('user_id');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');

            $table->string('gender');
            $table->string('relation');
            $table->boolean('status')->default(false);

            $table->string('name')->nullable();
            $table->string('dob', 10)->nullable();
            $table->string('avatar')->nullable();
            $table->string('marital_status')->nullable();

            $table->string('education')->nullable();
            $table->string('occupation')->nullable();
            $table->string('father_city')->nullable();
            $table->string('mother_city')->nullable();

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
        Schema::dropIfExists('directory');
    }
}
