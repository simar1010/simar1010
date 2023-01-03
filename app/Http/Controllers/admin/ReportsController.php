<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;

class ReportsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $query = User::where('is_admin','!=', 1);
        $daterange = $request->daterange;
        $startDate = $request->startDate;
        $endDate = $request->endDate;
        if($request->has('daterange') && !empty($request->daterange)){
            $query->whereBetween('created_at', [$request->startDate, $request->endDate]);
        } else {
            $query->whereBetween('created_at', [date('Y-m-d', strtotime('-30 days')), date('Y-m-d')]);
        }

        $users = $query->latest()->paginate(10);
        $lastpage = $users->lastPage();
        $page = $request->has('page')  ? $request->page : 1;
        if ($page>$lastpage) {
          return redirect()->back();
        };

        return view('admin.reports.index', compact('users', 'page', 'daterange', 'startDate', 'endDate'));
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
        //
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
