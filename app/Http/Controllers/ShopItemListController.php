<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ShopItemList;
use Validator;
use Illuminate\Support\Facades\Storage; // Import the Storage facade

class ShopItemListController extends Controller
{

    public function totalAvailableItem(Request $request)
    {
        $totalItem = ShopItemList::count(); 
    
        $data = [
            'status' => 200,
            'totalItem' => $totalItem
        ];
    
        return response()->json($data, 200);
    }

    public function totalOutOfStockItem(Request $request)
    {
        $totalItem = ShopItemList::where('quantity_item', '=', 0)->count();
    
        $data = [
            'status' => 200,
            'totalItem' => $totalItem
        ];
    
        return response()->json($data, 200);
    }

    public function createShopItemLists(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name_of_item' => 'nullable',
            'description_item' => 'nullable',
            'quantity_item' => 'nullable',
            'price_item' => 'nullable',
            'image' => 'image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 422);
        }

        // Store the image in the storage folder or move it to a specific directory
        $image = $request->file('image');
        $imageName = time() . '.' . $image->getClientOriginalExtension();
        $image->move(public_path('shop/items'), $imageName);

        // You can save the image path in the database along with other fields
        $shopItem = ShopItemList::create([
            'name_of_item' => $request->input('name_of_item'),
            'description_item' => $request->input('description_item'),
            'quantity_item' => $request->input('quantity_item'),
            'price_item' => $request->input('price_item'),
            'image_item' => 'shop/items/' . $imageName,
        ]);

        return response()->json(['message' => 'Image uploaded successfully', 'data' => $shopItem]);
    }

    public function getShopItemLists()
    {
        $items = ShopItemList::all();

        return response()->json(['data' => $items]);
    }

    public function updateShopItemLists(Request $request, $itemId)
    {
        $validator = Validator::make($request->all(), [
            'name_of_item' => 'nullable',
            'description_item' => 'nullable',
            'quantity_item' => 'nullable',
            'price_item' => 'nullable',
            'image' => 'image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);
    
        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 422);
        }
    
        $shopItem = ShopItemList::find($itemId);
    
        if (!$shopItem) {
            return response()->json(['error' => 'Shop item not found'], 404);
        }
    
        $shopItem->name_of_item = $request->input('name_of_item', $shopItem->name_of_item);
        $shopItem->description_item = $request->input('description_item', $shopItem->description_item);
        $shopItem->quantity_item = $request->input('quantity_item', $shopItem->quantity_item);
        $shopItem->price_item = $request->input('price_item', $shopItem->price_item);
    
        // Update the image only if a new one is provided
        if ($request->hasFile('image')) {
            // Delete the existing image from the storage folder
            if (Storage::exists($shopItem->image_item)) {
                Storage::delete($shopItem->image_item);
            }
    
            // Store the new image in the storage folder
            $image = $request->file('image');
            $imageName = time() . '.' . $image->getClientOriginalExtension();
            $image->move(public_path('shop/items'), $imageName);
    
            // Update the image_item field in the database
            $shopItem->image_item = 'shop/items/' . $imageName;
        }
    
        // Save the changes to the database
        $shopItem->save();
    
        return response()->json(['message' => 'Shop item updated successfully', 'data' => $shopItem]);
    }
    

    public function deleteShopItemLists($itemId)
    {
        $shopItem = ShopItemList::find($itemId);

        if (!$shopItem) {
            return response()->json(['error' => 'Shop item not found'], 404);
        }

        if (Storage::exists($shopItem->image_item)) {
            Storage::delete($shopItem->image_item);
        }

        $shopItem->delete();

        return response()->json(['message' => 'Shop item deleted successfully']);
    }

}
