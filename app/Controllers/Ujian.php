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
		$data=[
		'nama'=>$session->get('nama'),
		'username'=>$session->get('username'),
		'k_jenis_user'=>$session->get('k_jenis_user'),
		'jenis_user'=>$session->get('jenis_user'),
		
		
		];
		
		return view('dashboard_peserta_view',$data);
		
		
	}
	
}
