<?php

use Illuminate\Database\Seeder;

class ProductTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $product = new App\Product([
            'image_path' => 'http://baltsport.lv/34044-large_default/easton-speed-1pc-jr-hokeja-apaksvela.jpg',
            'title' => 'Apaksvela',
            'description' => 'Ayee',
            'price' => 49.99,
            'category_id' => 1
         ]);
        $product->save();

        $product = new App\Product([
            'image_path' => 'http://www.gouptime.lv/image/catalog/ext/3076152122-1184567136-252489.jpg',
            'title' => 'Ripa',
            'description' => 'Shit ripa',
            'price' => 9.99,
            'category_id' => 1
        ]);
        $product->save();

        $product = new App\Product([
            'image_path' => 'http://www.gouptime.lv/image/catalog/ext/3076152122-1184567136-252489.jpg',
            'title' => 'Ripa ',
            'description' => 'Diz betta',
            'price' => 15.99,
            'category_id' => 2
        ]);
        $product->save();
    }
}
