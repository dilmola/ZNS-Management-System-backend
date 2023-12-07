<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Carbon\Carbon;
use Faker\Factory as Faker;
use App\Models\User;

class AppointmentClientTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run()
    {
        $faker = Faker::create('ms_MY'); // English locale for Malaysia
   

        foreach (range(1, 30) as $index) {
            $township = $faker->township();
            $townState = $faker->townState();

            \DB::table('profile')->insert([
                'date_apointment' => $faker->date_apointment,
                'phone' => '601' . $faker->numberBetween(100000000, 999999999),
                'address' => $township . ', ' . $townState,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ]);
        }
    }
}
