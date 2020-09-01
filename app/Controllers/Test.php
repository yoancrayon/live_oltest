<?php namespace App\Controllers;


use App\Models\test_Model;
use App\Models\ujian_Model;

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
		if ($session->idujian)
		{
		return view('test_view',$data);
		}
		else{
		return redirect()->to(base_url('ujian'));
			
		}
		
		
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
	
	public function finalize()
	{
		$testmodel=new Test_model();
		
		$session = session();
		
		
		$res=$testmodel->isupdlogjsontest($session->get('idujian'),$session->get('username'),$this->request->getPost('json'));
		
		if ($res["errstate"]=="00000")
		{
			return "success";
		}
		else {
			return "failed";
		}
	}
	
	
	
	public function summaritest(){
		$testmodel=new Test_model();
		$session = session();
		$idujian=$session->get('idujian');
		$session->remove('idujian');
		$session->remove('start_ujian');
		$session->remove('is_ujian');
		$session->remove('durasiujian');
		$ujianmodel=new Ujian_model();

		$res=$ujianmodel->getlistujian($idujian,"x");
		$idujian="20200820 115341";
		
		foreach ($res as $row)
		{
			$namaujian= $row->nama_ujian;
			$tglmulai= $row->tanggal_mulai;
			$tglselesai= $row->tanggal_selesai;
		}
		
		
		
		$data=[
		'nama'=>$session->get('nama'),
		'username'=>$session->get('username'),
		'k_jenis_user'=>$session->get('k_jenis_user'),
		'jenis_user'=>$session->get('jenis_user'),
		'namaujian'=>$namaujian,
		'tglmulai'=>$tglmulai,
		'tglselesai'=>$tglselesai,
		'idujian'=>$idujian
		];
		return view('test_sum_view',$data);
	}
	
	
	public function getsummaryujian()
	{
		$ujianmodel=new Ujian_model();
		$session = session();
		$username=$session->get('username');
		$idujian=$this->request->getPost('idujian');
		
		$sumamry=$ujianmodel->getlisthasilujian($idujian,"x",$username);
		
		return json_encode($sumamry);
	}
	
	
	public function getquisoner()
	{   $testmodel=new Test_model();
		$idujian="20200820 115341";
		
		$sumamry=$testmodel->getquisoner($idujian);
	
		$i=0;
		foreach($sumamry as $row){
			
			if ($row->type=="radiogroup")
			{
				
				$choice=$testmodel->getpilihan($idujian,$row->name);
				$sumamry[i]->["choices"]=[$choice];
				
			}
			$i++;
		}
		
		print_r($choice);
		exit;
		
		
		$data=[
		"name"=>'pages1',
		"elements"=>[$sumamry]
		];
		$pages=[
		"pages"=>[$data]
		];
		
		return json_encode($pages);
		
	}
	
	
	
}


/* 
{
 "pages": [
  {
   "name": "page1",
   "elements": [
    {
     "type": "text",
     "name": "question2",
     "title": "NAMA"
    },
    {
     "type": "radiogroup",
     "name": "question1",
     "title": "JENIS SEKOLAH",
     "choices": [
      {
       "value": "item1",
       "text": "SMA"
      },
      {
       "value": "item2",
       "text": "SMK"
      }
     ]
    }
   ]
  }
 ]
} */