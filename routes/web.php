<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

//两种无限级分类的方法
Route::get('deep1','Deep\DeepCateController@deep1');
Route::get('deep2','Deep\DeepCateController@deep2');
