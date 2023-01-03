<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Validator;


class HotelsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'checkin_date' => 'required',
            'checkout_date'=> 'required',
            'guest' => 'required|numeric',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false, 
                'message' => $validator->errors(), 
                'data' => new \stdClass
            ]);
        }

        $checkin_date = $request->checkin_date;
        $checkout_date = $request->checkout_date;
        $guest = $request->guest;
        $currency = $request->has('currency') ? $request->currency : 'AUD';
        $order_by = $request->has('order_by') ? $request->order_by : 'price';
        $rooms = $request->has('rooms') ? $request->rooms : '1';


        if($request->has('location') && !empty($request->location)){
            $location = $request->location;

            $locationcurl = curl_init();
            curl_setopt_array($locationcurl, [
                CURLOPT_URL => "https://booking-com.p.rapidapi.com/v1/hotels/locations?locale=en-gb&name=".$location,
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_FOLLOWLOCATION => true,
                CURLOPT_ENCODING => "",
                CURLOPT_MAXREDIRS => 10,
                CURLOPT_TIMEOUT => 30,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => "GET",
                CURLOPT_HTTPHEADER => [
                    "X-RapidAPI-Host: booking-com.p.rapidapi.com",
                    "X-RapidAPI-Key: 0b25e31205msh048d149f048fc52p1df385jsn7277d80143f7"
                ],
            ]);

            $locationRes = curl_exec($locationcurl);
            $locationErr = curl_error($locationcurl);
            $locationData = json_decode($locationRes);
            curl_close($locationcurl);

            if ($locationErr || count($locationData) < 1) {
                return response()->json([
                    'success' => false, 
                    'message' => !empty($locationErr) ? $locationErr : 'Some problem exists, Please select another lcoation.', 
                    'data' => new \stdClass
                ]);

            } else {
                
                $dest_id = $locationData[0]->dest_id;
                $dest_type = $locationData[0]->dest_type;
            }

        } else {
            $dest_id = '1593';
            $dest_type = 'country';
        }

        
        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_URL => "https://booking-com.p.rapidapi.com/v1/hotels/search?checkin_date=".$checkin_date."&checkout_date=".$checkout_date."&units=metric&dest_id=".$dest_id."&dest_type=".$dest_type."&locale=en-gb&adults_number=".$guest."&order_by=".$order_by."&filter_by_currency=".$currency."&room_number=".$rooms,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "GET",
            CURLOPT_HTTPHEADER => [
                "X-RapidAPI-Host: booking-com.p.rapidapi.com",
                "X-RapidAPI-Key: 0b25e31205msh048d149f048fc52p1df385jsn7277d80143f7"
            ],
        ]);

        $response = curl_exec($curl);
        $data = json_decode($response);
        $err = curl_error($curl);

        curl_close($curl);

        if ($err || !property_exists($data, 'result')) {
            return response()->json([
                'success' => false, 
                'message' => !empty($err) ? $err : 'Some problem exists, Please try again.', 
                'data' => new \stdClass
            ]);
        } else {
            $responseResult = [];
            if(count($data->result) > 0){
                $i = 0;
                foreach($data->result as $result){
                    $responseResult[$i]['hotel_id'] = $result->hotel_id;
                    $responseResult[$i]['url'] = $result->url;
                    $responseResult[$i]['latitude'] = $result->latitude;
                    $responseResult[$i]['longitude'] = $result->longitude;
                    $responseResult[$i]['address'] = $result->address;
                    $responseResult[$i]['review_score_word'] = $result->review_score_word;
                    $responseResult[$i]['review_score'] = $result->review_score;
                    $responseResult[$i]['review_nr'] = $result->review_nr;
                    $responseResult[$i]['hotel_name'] = $result->hotel_name;
                    $responseResult[$i]['city'] = $result->city;
                    $responseResult[$i]['currency_code'] = $result->currency_code;
                    $responseResult[$i]['main_photo_url'] = $result->main_photo_url;
                    $responseResult[$i]['max_photo_url'] = $result->max_photo_url;
                    $responseResult[$i]['max_1440_photo_url'] = $result->max_1440_photo_url;
                    $responseResult[$i]['timezone'] = $result->timezone;
                    $responseResult[$i]['distance'] = $result->distance;
                    $responseResult[$i]['min_total_price'] = $result->min_total_price;
                    $i++;
                }
            }
            return response()->json([
                'success' => true, 
                'message' => 'Hotels Listing', 
                'data' => $responseResult
            ]);
        }

    }



    public function indexWithHotels(Request $request){
        $validator = Validator::make($request->all(), [
            'checkin_date' => 'required',
            'checkout_date'=> 'required|gte:checkin_date',
            'guest' => 'required|numeric',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false, 
                'message' => $validator->errors(), 
                'data' => new \stdClass
            ]);
        }

        $checkin_date = $request->checkin_date;
        $checkout_date = $request->checkout_date;
        $guest = $request->guest;
        $currency = $request->has('currency') ? $request->currency : 'AUD';
        $rooms = $request->has('rooms') ? $request->rooms : '1';

        switch($request->order_by) {
            case('distance'):
                $order_by = 'DISTANCE_FROM_LANDMARK';
                break;
            case('price'):
                $order_by = 'PRICE';
                break;
            case('review_score'):
                $order_by = 'GUEST_RATING';
                break;
            case('popularity'):
                $order_by = 'BEST_SELLER';
                break;
            default:
                $order_by = 'PRICE';
        }

        if($request->has('location') && !empty($request->location)){

            $locationcurl = curl_init();
            curl_setopt_array($locationcurl, [
                CURLOPT_URL => "https://hotels-com-provider.p.rapidapi.com/v1/destinations/search?query=Chandigarh&currency=USD&locale=en_US",
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_FOLLOWLOCATION => true,
                CURLOPT_ENCODING => "",
                CURLOPT_MAXREDIRS => 10,
                CURLOPT_TIMEOUT => 30,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => "GET",
                CURLOPT_HTTPHEADER => [
                    "X-RapidAPI-Host: hotels-com-provider.p.rapidapi.com",
                    "X-RapidAPI-Key: a7eb353464msh4c8ec01acebad99p10eb70jsna8e9f246528a"
                ],
            ]);

            $locationRes = curl_exec($locationcurl);
            $locationErr = curl_error($locationcurl);
            $locationData = json_decode($locationRes);
            curl_close($locationcurl);

            if ($locationErr || count($locationData->suggestions) < 1) {
                return response()->json([
                    'success' => false, 
                    'message' => !empty($locationErr) ? $locationErr : 'Some problem exists, Please select another lcoation.', 
                    'data' => new \stdClass
                ]);

            } else {

                $suggestions = $locationData->suggestions;
                $dest_id = $suggestions[0]->entities[0]->destinationId;
            }
            
        } else {
            $dest_id = '26633';
        }

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_URL => "https://hotels-com-provider.p.rapidapi.com/v1/hotels/search?checkin_date=".$checkin_date."&checkout_date=".$checkout_date."&sort_order=".$order_by."&destination_id=".$dest_id."&adults_number=".$guest."&locale=en_US&currency=".$currency,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "GET",
            CURLOPT_HTTPHEADER => [
                "X-RapidAPI-Host: hotels-com-provider.p.rapidapi.com",
                "X-RapidAPI-Key: a7eb353464msh4c8ec01acebad99p10eb70jsna8e9f246528a"
            ],
        ]);
        $response = curl_exec($curl);
        $err = curl_error($curl);
        $data = json_decode($response);
        curl_close($curl);



        if ($err || !property_exists($data, 'searchResults')) {
            return response()->json([
                'success' => false, 
                'message' => !empty($err) ? $err : 'Some problem exists, Please try again.', 
                'data' => new \stdClass
            ]);
        } else {
            $responseResult = [];
            if(count($data->searchResults->results) > 0){
                $i = 0;
                foreach($data->searchResults->results as $result){
                    $responseResult[$i]['hotel_id'] = $result->id;
                    $responseResult[$i]['url'] = 'https://in.hotels.com/ho'.$result->id.'/'.strtolower(str_replace(" ","-",$result->name).'-'.$result->address->locality.'-'.$result->address->countryName).'?chkin='.$checkin_date.'&chkout='.$checkout_date.'&rooms='.$rooms;
                    $responseResult[$i]['latitude'] = $result->coordinate->lat;
                    $responseResult[$i]['longitude'] = $result->coordinate->lon;
                    $responseResult[$i]['address'] = $result->address->streetAddress;
                    //$responseResult[$i]['review_score_word'] = $result->review_score_word;
                    $responseResult[$i]['review_score'] = $result->starRating;
                    $responseResult[$i]['hotel_name'] = $result->name;
                    $responseResult[$i]['city'] = $result->address->locality;
                    $responseResult[$i]['currency_code'] = $currency;
                    //$responseResult[$i]['main_photo_url'] = $result->main_photo_url;
                    //$responseResult[$i]['max_photo_url'] = $result->max_photo_url;
                    $responseResult[$i]['max_1440_photo_url'] = $result->optimizedThumbUrls->srpDesktop;
                    //$responseResult[$i]['timezone'] = $result->timezone;
                    $responseResult[$i]['distance'] = $result->landmarks[0]->distance;
                    $responseResult[$i]['min_total_price'] = $result->ratePlan->price->exactCurrent;
                    $i++;
                }
            }
            return response()->json([
                'success' => true, 
                'message' => 'Hotels Listing', 
                'data' => $responseResult
            ]);
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    { 
        $curl = curl_init();

        curl_setopt_array($curl, [
            CURLOPT_URL => "https://booking-com.p.rapidapi.com/v1/hotels/data?hotel_id=".$id."&locale=en-gb",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "GET",
            CURLOPT_HTTPHEADER => [
                "X-RapidAPI-Host: booking-com.p.rapidapi.com",
                "X-RapidAPI-Key: a7eb353464msh4c8ec01acebad99p10eb70jsna8e9f246528a"
            ],
        ]);

        $response = curl_exec($curl);
        $data = json_decode($response);
        $err = curl_error($curl);

        curl_close($curl);

        if ($err) {
            return response()->json([
                'success' => 'false', 
                'message' => $err, 
                'data' => new \stdClass
            ]);
        } else {
            return response()->json([
                'success' => 'success', 
                'message' => 'Hotel Details', 
                'data' => $data
            ]);
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
