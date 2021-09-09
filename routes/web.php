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
    if (Auth::check()) {
        return redirect('/home');
    } else {
        return view('auth.login');
    }
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Route::get('/admin/{id}', 'HomeController@home')->middleware('auth');

Route::get('delete_client/{id}', 'PersonaController@delete')->name('deleteClient')->middleware('auth');

Route::get('getData', 'PersonaController@getData')->name('getData')->middleware('auth');

Route::get('DataClient/{id}', 'PersonaController@edit')->name('DataClient')->middleware('auth');

Route::post('Update', 'PersonaController@update')->name('UpdateClient')->middleware('auth');

Route::get('getPay/{persona}', 'PagoController@getLastFivePay')->name('getPays')->middleware('auth');

Route::post('SavePay', 'PagoController@storage')->name('SavePay')->middleware('auth');

Route::get('Notifications', 'NotificacionController@index')->name('Notifications')->middleware('auth');

Route::post('Send', 'NotificacionController@sendEmail')->name('Send')->middleware('auth');

Route::get('filter/{param}', 'PersonaController@filter')->name('filter')->middleware('auth');

Route::get('getInform', 'PersonaController@getReportUsers')->name('getInform')->middleware('auth');

Route::get('registerUser', 'PersonaController@registerView')->name('registerUser')->middleware('auth');

Route::post('saveUser', 'PersonaController@registerPerson')->name('saveUser')->middleware('auth');

Route::get('getInformWithPays', 'PersonaController@getReportUsersWithPay')->name('getInformWithPays')->middleware('auth');

Route::get('ViewUser/{id}', 'HomeController@viewUser')->name('ViewUser')->middleware('auth');

Route::get('Concepts', 'ConceptoController@index')->name('Concepts')->middleware('auth');

Route::post('SaveConcept', 'ConceptoController@store')->name('SaveConcept');

Route::post('UpdateConcept', 'ConceptoController@update')->name('UpdateConcept')->middleware('auth');

Route::get('DeleteConcept/{id}', 'ConceptoController@delete')->name('DeleteConcept')->middleware('auth');

Route::get('getDataConceptId/{id}', 'ConceptoController@getDataById')->name('getDataConceptById')->middleware('auth');

Route::get('Ingresos', 'IngresoController@index')->name('Ingresos')->middleware('auth');

Route::post('GuardarIngreso', 'IngresoController@save')->name('GuardarIngreso');

Route::post('EditarIngreso', 'IngresoController@edit')->name('EditarIngreso')->middleware('auth');

Route::get('EliminarIngreso/{id}', 'IngresoController@delete')->name('EliminarIngreso')->middleware('auth');

Route::get('ObtenerIngreso/{id}', 'IngresoController@getDataById')->name('ObtenerIngreso')->middleware('auth');

Route::get('Egresos', 'EgresoController@index')->name('Egresos')->middleware('auth');

Route::post('GuardarEgreso', 'EgresoController@save')->name('GuardarEgreso')->middleware('auth');

Route::post('EditarEgreso', 'EgresoController@edit')->name('EditarEgreso')->middleware('auth');

Route::get('EliminarEgreso/{id}', 'EgresoController@delete')->name('EliminarEgreso')->middleware('auth');

Route::get('ObtenerEgreso/{id}', 'EgresoController@getDataById')->name('ObtenerEgreso')->middleware('auth');

Route::get('ChartIngresos', 'InformesController@ChartIngresosEgresos')->name('ChartIngresos')->middleware('auth');

Route::get('getValueTimeDur/{id}', 'PagoController@getValueTimeDuration')->middleware('auth');

Route::get('EliminarPago/{id}', 'PagoController@delete')->middleware('auth');
