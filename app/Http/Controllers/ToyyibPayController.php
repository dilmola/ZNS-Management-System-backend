<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Services\ComponentService;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;
use Throwable;
class ToyyibPayController extends Controller
{
    public function createBill()
    {
        $some_data = array(
            'userSecretKey' => config('toyyibpay.key'),
            'categoryCode' => config('toyyibpay.category'),
            'billName'=>'ZNS ',
            'billDescription'=>' ',
            'billPriceSetting'=>0,
            'billPayorInfo'=>1,
            'billAmount'=>1000,
            // 'billReturnUrl'=> route('toyyibpay-status'),
            // 'billCallbackUrl'=> route('toyyibpay-callback'),
            'billExternalReferenceNo' => ' ',
            'billTo'=>' ',
            'billEmail'=>'client@gmail.com',
            'billPhone'=>'0111111',
            'billSplitPayment'=>0,
            'billSplitPaymentArgs'=>'',
            'billPaymentChannel'=> 0,
            'billContentEmail'=>'Thank you for purchasing our product!',
            'billChargeToCustomer'=>1,
            'billExpiryDate'=>'17-12-2025 17:00:00',
            'billExpiryDays'=>3
          );  

          $url = "https://dev.toyyibpay.com/index.php/api/createBill";
          $response = Http::asForm()->post($url, $some_data);
          $billCode = $response[0]['BillCode'];
          return redirect("https://dev.toyyibpay.com/" . $billCode);

    }

    public function paymentStatus()
    {

    }

    public function callback()
    {

    }
}
