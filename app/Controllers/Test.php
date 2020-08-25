<?php namespace App\Controllers;


use App\Models\test_Model;
class Test extends BaseController
{
	
	public function index()
	{
		$session = session();
	
	
	
		$testmodel=new Test_model();
		
		$pertanyaan=$testmodel->getjawabanpesertaujian($session->get('idujian'),"x",$session->get('username'));
		
		$data=[
		'nama'=>$session->get('nama'),
		'username'=>$session->get('username'),
		'k_jenis_user'=>$session->get('k_jenis_user'),
		'jenis_user'=>$session->get('jenis_user'),
		'idujian'=>$session->get('idujian'),
		'start_ujian'=>$session->get('start_ujian'),
		'is_ujian'=>$session->get('is_ujian'),
		'durasiujian'=>$session->get('durasiujian'),
		'pertanyaan'=>$pertanyaan
		
		
		];
		
		return view('test_view',$data);
		
		
		
	}
	
	
	
}
