<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ShopItemList extends Model
{
    use HasFactory;

    protected $table = 'shop_item_lists';

    protected $guarded = [];
}