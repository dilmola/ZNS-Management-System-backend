<?php

namespace App\Http\Middleware;

use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken as Middleware;

class VerifyCsrfToken extends Middleware
{
    /**
     * The URIs that should be excluded from CSRF verification.
     *
     * @var array<int, string>
     */
    protected $except = [
        'upload', // Add any routes you want to exclude from CSRF protection here
        '/delete/shop/item/lists{itemId}',
        '/update/shop/item/lists/{itemId}'
    ];
}
