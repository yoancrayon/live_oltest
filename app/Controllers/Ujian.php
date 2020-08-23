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
		
		
		
		if ($session->get('k_jenis_user')=="1")
		{
			$usersession="x";
		}
		else
		{
			$usersession=$session->get('username');
			
		}
		$listujian=$ujianmodel->getlistujian("x",$usersession);
		return json_encode($listujian);
	}
	
	public function saveujian()
	{
		$ujianmodel=new Ujian_model();
		$session = session();
		
		$idujian=$this->request->getPost('idujian');
		$namaujian=$this->request->getPost('namaujian');
		$tglmulai=$this->request->getPost('tglmulai');
		$tglselesai=$this->request->getPost('tglselesai');
		$durasi=$this->request->getPost('durasi');
		
		$data=[
		"id_ujian"=>$idujian,
		"nama_ujian"=>$namaujian,
		"tanggal_mulai"=>$tglmulai,
		"tanggal_selesai"=>$tglselesai,
		"durasi"=>$durasi,
		"username"=>$session->get('username')
		
		];
		
		$res=$ujianmodel->insupdujian($data);
		
		if ($res["errstate"]=="00000")
		{
			return "success";
		}
		else {
			return "failed";
		}
		
		
	}
	
	public function hapusujian()
	{
		$ujianmodel=new Ujian_model();
		$idujian=$this->request->getPost('idujian');
		$res=$ujianmodel->delujian($idujian);
		
		if ($res["errstate"]=="00000")
		{
			return "success";
		}
		else {
			return "failed";
		}
	}
	
	public function pesertaujian()
	{
		$session = session();
		$ujianmodel=new Ujian_model();
		$session = session();
		if ($session->get('k_jenis_user')=="1")
		{
			$usersession="x";
		}
		else
		{
			$usersession=$session->get('username');
			
		}
		
		$dropdown_ujian=$ujianmodel->getlistujian("x",$usersession);
		$data=[
		'nama'=>$session->get('nama'),
		'username'=>$session->get('username'),
		'k_jenis_user'=>$session->get('k_jenis_user'),
		'jenis_user'=>$session->get('jenis_user'),
		'dropdown_ujian'=>$dropdown_ujian
		
		];
		
		return view('dashboard_peserta_view',$data);
		
		
	}
	
	public function getpeserta()
	{
		$ujianmodel=new Ujian_model();
		$idujian=$this->request->getPost('idujian');
		$session = session();
		if ($session->get('k_jenis_user')=="1")
		{
			$usersession="x";
		}
		else
		{
			$usersession=$session->get('username');
			
		}
		$listpeserta=$ujianmodel->getpeserta($idujian,"x",$usersession);
		return json_encode($listpeserta);
		
	}
	
	
	public function getpesertanoikut()
	{
		$ujianmodel=new Ujian_model();
		$idujian=$this->request->getPost('idujian');
		
		$listpeserta=$ujianmodel->getpesertanoujian($idujian);
		return json_encode($listpeserta);
		
		
	}
	
	public function inserpesertaujian()
	{
		$ujianmodel=new Ujian_model();
		$idujian=$this->request->getPost('idujian');
		$groupusername=$this->request->getPost('groupusername');
		$session = session();
		
		$arruserpeserta=explode(",",$groupusername);
		
		
		foreach($arruserpeserta as $usernamepeserta){
			
			$res=$ujianmodel->inspesertaujian($idujian,$usernamepeserta,$session->get('username'));
		}
		
		
		
		if ($res["errstate"]=="00000")
		{
			return "success";
		}
		else {
			return "failed";
		}
		
	}
	
	
	public function delerpesertaujian()
	{
		$ujianmodel=new Ujian_model();
		$idujian=$this->request->getPost('idujian');
		$usernamepeserta=$this->request->getPost('usernamepeserta');
		
		$res=$ujianmodel->delpesertaujian($idujian,$usernamepeserta);
		
		if ($res["errstate"]=="00000")
		{
			return "success";
		}
		else {
			return "failed";
		}
		
	}
	
	public function soal()
	{
		$session = session();
		$ujianmodel=new Ujian_model();
		$session = session();
		if ($session->get('k_jenis_user')=="1")
		{
			$usersession="x";
		}
		else
		{
			$usersession=$session->get('username');
			
		}
		
		$dropdown_ujian=$ujianmodel->getlistujian("x",$usersession);
		$data=[
		'nama'=>$session->get('nama'),
		'username'=>$session->get('username'),
		'k_jenis_user'=>$session->get('k_jenis_user'),
		'jenis_user'=>$session->get('jenis_user'),
		'dropdown_ujian'=>$dropdown_ujian
		
		];
		
		return view('dashboard_soal_view',$data);
		
		
	}
	
	public function getpertanyaan()
	{
		
		$ujianmodel=new Ujian_model();
		$idujian=$this->request->getPost('idujian');
		$session = session();
		if ($session->get('k_jenis_user')=="1")
		{
			$usersession="x";
		}
		else
		{
			$usersession=$session->get('username');
			
		}
		$listpertanyaan=$ujianmodel->getpertanyaan($idujian,"x",$usersession);
		return json_encode($listpertanyaan);
		
	}
	
	public function savepertanyaan()
	{
		$ujianmodel=new Ujian_model();
		$idpertanyaan=$this->request->getPost('idpertanyaan');
		$idujian=$this->request->getPost('idujian');
		$pertanyaan=$this->request->getPost('pertanyaan');
		$templatejawaban=$this->request->getPost('templatejawaban');
		
		
		
		$session = session();
		$data=[
		"id_pertanyaan"=>$idpertanyaan,
		"id_ujian"=>$idujian,
		"pertanyaan"=>$pertanyaan,
		"template_jawaban"=>$templatejawaban,
		"username"=>$session->get('username')
		];
		
		
		
		$res=$ujianmodel->insupdpertanyaan($data);
		
		if ($res["errstate"]=="00000")
		{
			return "success";
		}
		else {
			return "failed";
		}
		
		
	}
	
}
