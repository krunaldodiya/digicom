<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

use Carbon\Carbon;

use Illuminate\Support\Facades\Log;

class CreateQuiz extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'create:quiz';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'create quiz';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        //
    }
}
