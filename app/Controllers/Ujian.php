<?php namespace App\Controllers;

use App\Models\ujian_Model;
class Ujian extends BaseController
{
	
	public function index()
	{
		$session = session();
		$data=[
		'nama'=>$session->get('nama'),
		'username'=>$session->get('username'),
		'k_jenis_user'=>$session->get('k_jenis_user'),
		'jenis_user'=>$session->get('jenis_user'),
		
		
		];
		
		return view('dashboard_ujian_view',$data);
		
	}
	
	public function listujian()
	{
		$ujianmodel=new Ujian_model();
		$session = session();
		$listujian=$ujianmodel->getlistujian("x",$session->get('username'));
		return json_encode($listujian);
	}
}
