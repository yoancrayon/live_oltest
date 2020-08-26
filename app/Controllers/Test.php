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
	
	public function runcode()
	{
		$testmodel=new Test_model();
		$kode=$this->request->getPost('kode');
		$input=$this->request->getPost('input');
		
		
		echo $testmodel-> eksekusi($kode,$input);
		
	}
	
	public function simpanjawaban()
	{
		$testmodel=new Test_model();
		
		$session = session();
		
		$data=[
		"idujian"=>$session->get('idujian'),
		"username"=>$session->get('username'),
		"idpertanyaan"=>$this->request->getPost('idpertanyaan'),
		"jawaban"=>$this->request->getPost('jawaban'),
		"inputjawaban"=>$this->request->getPost('inputjawaban'),
		"outputjawab"=>$this->request->getPost('outputjawab'),
		"initialtime"=>$this->request->getPost('initialtime'),
		"intimer"=>$this->request->getPost('intimer'),
		"incountdown_timer"=>$this->request->getPost('incountdown_timer')
		];
		
		
		$res=$testmodel->updatejawaban($data);
		
		if ($res["errstate"]=="00000")
		{
			return "success";
		}
		else {
			return "failed";
		}
		
		
		
	}
	
}
