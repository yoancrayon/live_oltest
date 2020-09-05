<?php namespace App\Controllers;


use App\Models\Test_model;
use App\Models\Ujian_model;

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
		//$idujian="20200820 115341";
		
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
		
		$sumamry=$ujianmodel->getlisthasilujian($idujian,"x",$username,"x");
		
		return json_encode($sumamry);
	}
	
	
	public function getquisoner()
	{   $testmodel=new Test_model();
		$ujianmodel=new Ujian_model();
		$idujian=$this->request->getPost('idujian');
		//$idujian="20200820 115341";
		
		$sumamry=$testmodel->getquisoner($idujian);
		$ujian=$ujianmodel->getlistujian($idujian,"x");
		$i=0;
		$pil=array();
		foreach($sumamry as $row){
			
			if ($row->type=="radiogroup"||$row->type=="checkbox")
			{
				
				$choice=$testmodel->getpilihan($idujian,$row->name);
				foreach ($choice as $c)
				{
					
					
					array_push($pil,$c->text);
				}
				$sumamry[$i]->choices=$pil;
				
			}
			
			if ($row->type=="rating")
			{
				
				$sumamry[$i]->minRateDescription=$row->minRating;
				$sumamry[$i]->maxRateDescription=$row->maxrating;
				
			}
			
			
			$i++;
		}
		
		
	
		
		
		 
		 $question=[
		 "title"=>"Survey ".$ujian[0]->nama_ujian,
		 "questions"=>$sumamry
		 ];
		 
		return json_encode($question);
		
	}
	
	public function simpanjawabanquisioner()
	{
		$testmodel=new Test_model();
		$session = session();
		$username=$session->get('username');
		$idujian=$this->request->getPost('idujian');
		$jawabquisionerjson=$this->request->getPost('data');
		
		$res=$testmodel->insjawabanquisioner($idujian,$username,$jawabquisionerjson);
		
		
		
		if ($res["errstate"]=="00000")
		{
			return "success";
		}
		else {
			return "failed";
		}
	}
	
	
	
}

