<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ShopItemList;
use Validator;

class TestController extends Controller
{
    public function uploadImage(Request $request)
    {
        // Validate the request, check if the file is present, etc.
        $validator = Validator::make($request->all(), [
            'name_of_item' => 'required',
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


    public function getShopItemList()
    {
        $items = ShopItemList::all();

        return response()->json(['data' => $items]);
    }

    public function getShopItems()
    {
        $items = ShopItem::all();
        return response()->json(['data' => $items]);
    }

    public function uploadItem(Request $request)
    {
        $request->validate([
            'name_of_item' => 'required',
            'description_item' => 'required',
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        $imagePath = $request->file('image')->store('images');

        $item = ShopItem::create([
            'name_of_item' => $request->input('name_of_item'),
            'description_item' => $request->input('description_item'),
            'image_item' => $imagePath,
        ]);

        return response()->json(['message' => 'Item uploaded successfully', 'data' => $item]);
    }

    public function editItem(Request $request, $id)
    {
        $request->validate([
            'name_of_item' => 'required',
            'description_item' => 'required',
            'image' => 'sometimes|image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);
    
        $item = ShopItem::find($id);
    
        if (!$item) {
            return response()->json(['message' => 'Item not found'], 404);
        }
    
        if ($request->hasFile('image')) {
            // Handle file upload
            $image = $request->file('image');
            $imageName = time() . '.' . $image->getClientOriginalExtension();
            $image->move(public_path('images'), $imageName);
    
            // Update the item with the new image path
            $item->update([
                'name_of_item' => $request->input('name_of_item'),
                'description_item' => $request->input('description_item'),
                'image_path' => 'images/' . $imageName,
            ]);
        } else {
            // Update the item without changing the image
            $item->update([
                'name_of_item' => $request->input('name_of_item'),
                'description_item' => $request->input('description_item'),
            ]);
        }
    
        return response()->json(['message' => 'Item edited successfully', 'data' => $item]);
        
    }

    public function deleteItem($id)
    {
        $item = ShopItem::find($id);

        if (!$item) {
            return response()->json(['message' => 'Item not found'], 404);
        }

        $item->delete();

        return response()->json(['message' => 'Item deleted successfully']);
    }
}
