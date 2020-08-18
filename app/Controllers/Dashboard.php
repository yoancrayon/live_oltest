<?php namespace App\Controllers;

class Dashboard extends BaseController
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
		$data;
		return view('dashboard_view',$data);
		
	}
	
	public function SignOut()
	{
		$session = session();
		$session->destroy();
		return redirect()->to(base_url('login'));
	}
	
	
	public function pengguna()
	{
		$session = session();
		$data=[
		'nama'=>$session->get('nama'),
		'username'=>$session->get('username'),
		'k_jenis_user'=>$session->get('k_jenis_user'),
		'jenis_user'=>$session->get('jenis_user'),
		
		
		];
		$data;
		return view('dashboard_pengguna_view',$data);
		
	}
	
}	