<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;


class Cors
{
    public function handle($request, Closure $next)
    {
        $response = $next($request);
        $response->header('Referrer-Policy', 'strict-origin-when-cross-origin');

        return $response;
    }
}