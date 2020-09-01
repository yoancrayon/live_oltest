<?php namespace App\Controllers;

use App\Models\ujian_Model;
use App\Models\test_Model;
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
		$idpertanyaan=$this->request->getPost('idpertanyaan');
		$session = session();
		if ($session->get('k_jenis_user')=="1")
		{
			$usersession="x";
		}
		else
		{
			$usersession=$session->get('username');
			
		}
		$listpertanyaan=$ujianmodel->getpertanyaan($idujian,$idpertanyaan,$usersession);
		return json_encode($listpertanyaan);
		
	}
	
	public function savepertanyaan()
	{
		$ujianmodel=new Ujian_model();
		$idpertanyaan=$this->request->getPost('idpertanyaan');
		$idujian=$this->request->getPost('idujian');
		$pertanyaan=$this->request->getPost('pertanyaan');
		$templatejawaban=$this->request->getPost('templatejawaban');
		$ekspektasijawaban=$this->request->getPost('ekspektasijawaban');
		
		
		
		$session = session();
		$data=[
		"id_pertanyaan"=>$idpertanyaan,
		"id_ujian"=>$idujian,
		"pertanyaan"=>$pertanyaan,
		"template_jawaban"=>$templatejawaban,
		"username"=>$session->get('username'),
		"ekspektasijawaban"=>$ekspektasijawaban
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
	
	
	public function hapuspertanyaan()
	{
		$ujianmodel=new Ujian_model();
		$idujian=$this->request->getPost('idujian');
		$idpertanyaan=$this->request->getPost('idpertanyaan');
		
		$res=$ujianmodel->delpertanyaan($idujian,$idpertanyaan);
		
		if ($res["errstate"]=="00000")
		{
			return "success";
		}
		else {
			return "failed";
		}
		
	}
	
	public function cobapertanyaan()
	{
		
		$testmodel=new Test_model();
		$kode=$this->request->getPost('kode');
		$input=$this->request->getPost('input');
		
		
		echo $testmodel-> eksekusi($kode,$input);
	}
	
	public function listujianpeserta()
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
		
		$listujian=$ujianmodel->getlistujianpeserta("x",$usersession);
		return json_encode($listujian);
	}
	
	public function persiapanujianpeserta()
	{
		$testmodel=new Test_model();
		$ujianmodel=new Ujian_model();
		$idujian=$this->request->getPost('idujian');
		$session = session();
		$usersession=$session->get('username');
		$session->set('idujian', $idujian);
		$session->set('start_ujian', time());
		$session->set('is_ujian', true);
		
		$listujian=$ujianmodel->getlistujian($idujian,"x");
		
		foreach($listujian as $row){
			$durasi=$row->durasi;
			
		}
		$session->set('durasiujian', $durasi);
		
		
		$res=$testmodel->prepareujian($idujian,$usersession);
		
		if ($res["errstate"]=="00000")
		{
			return "success";
		}
		else {
			return "failed";
		}
		
	}
	
	
	
	function resetpesertaujian()
	{
		$idujian=$this->request->getPost('idujian');
		$usernamepeserta=$this->request->getPost('usernamepeserta');
		$ujianmodel=new Ujian_model();
		
		$res=$ujianmodel->resetpesertaujian($idujian,$usernamepeserta);
		
		if ($res["errstate"]=="00000")
		{
			return "success";
		}
		else {
			return "failed";
		}
		
	}
	
	function hasilujian(){
		
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
		if ($session->get('k_jenis_user')=="3"){
			$dropdown_ujian=$ujianmodel->getlistujianpeserta("x",$usersession);
			
		}
		else{
		$dropdown_ujian=$ujianmodel->getlistujian("x",$usersession);
		}
		
		
		
		
		$data=[
		'nama'=>$session->get('nama'),
		'username'=>$session->get('username'),
		'k_jenis_user'=>$session->get('k_jenis_user'),
		'jenis_user'=>$session->get('jenis_user'),
		'dropdown_ujian'=>$dropdown_ujian
		
		];
		
		return view('dashboard_hasil_view',$data);
		
	}
	
	public function gethasilujian()
	{
		$ujianmodel=new Ujian_model();
		$session = session();
		$username=$this->request->getPost('username');
		$idujian=$this->request->getPost('idujian');
		
		$sumamry=$ujianmodel->getlisthasilujian($idujian,"x",$username);
		
		return json_encode($sumamry);
	}
	
	public function gethasilujianspecific()
	{
		$ujianmodel=new Ujian_model();
		$session = session();
		
		$idpertanyaan=$this->request->getPost('idpertanyaan');
		$idujian=$this->request->getPost('idujian');
		$username=$this->request->getPost('username');
		
		$sumamry=$ujianmodel->getlisthasilujian($idujian,$idpertanyaan,$username);
		
		return json_encode($sumamry);
	}
	
	public function flushnilai()
	{
		
		$ujianmodel=new Ujian_model();
		$session = session();
		
		$idujian=$this->request->getPost('idujian');
		
		
		$res=$ujianmodel->flushnilai($idujian);
		
		if ($res["errstate"]=="00000")
		{
			return "success";
		}
		else {
			return "failed";
		}
		
		
	}
	
	public function updatenilai()
	{
		
		$ujianmodel=new Ujian_model();
		$session = session();
		
		$idujian=$this->request->getPost('idujian');
		$idpertanyaan=$this->request->getPost('idpertanyaan');
		$username=$this->request->getPost('username');
		$nilai=$this->request->getPost('nilai');
		
		$res=$ujianmodel->updatenilai($idujian,$idpertanyaan,$username,$nilai);
		
		if ($res["errstate"]=="00000")
		{
			return "success";
		}
		else {
			return "failed";
		}
		
		
	}
	
	public function quisioner()
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
		
		return view('dashboard_quisioner_view',$data);
		
		
	}
	
	public function listpertanyaanquisioner()

	{
		$ujianmodel=new Ujian_model();
		$session = session();
		$idujian=$this->request->getPost("idujian");
		$hasil=$ujianmodel->getquisioner($idujian,"x");
		return json_encode($hasil);
		
	}	
	
	public function simpanquisioner()
	{
		$ujianmodel=new Ujian_model();
		$idujian=$this->request->getPost("idujian");
		$idsurvey=$this->request->getPost("idsurvey");
		$type=$this->request->getPost("type");
		$title=$this->request->getPost("title");
		$minrating=$this->request->getPost("minrating");
		$maxrating=$this->request->getPost("maxrating");
	$data=[
	"idujian"=>$idujian,
	"idsurvey"=>$idsurvey,
	"type"=>$type,
	"title"=>$title,
	"minrating"=>$minrating,
	"maxrating"=>$maxrating
	];	
		
		$res=$ujianmodel->insupdquisioner($data);
		
		if ($res["errstate"]=="00000")
		{
			return "success";
		}
		else {
			return "failed";
		}
	}
	
	public function hapusquisoner()
	{
		$ujianmodel=new Ujian_model();
		$idujian=$this->request->getPost("idujian");
		$idsurvey=$this->request->getPost("idsurvey");
		
		$res=$ujianmodel->delquisioner($idujian,$idsurvey);
		
		if ($res["errstate"]=="00000")
		{
			return "success";
		}
		else {
			return "failed";
		}
		
	}
	
	
	public function listpilihanquisioner()

	{
		$ujianmodel=new Ujian_model();
		$session = session();
		$idujian=$this->request->getPost("idujian");
		$idsurvey=$this->request->getPost("idsurvey");
		$hasil=$ujianmodel->getpilihanquisioner($idujian,$idsurvey);
		return json_encode($hasil);
		
	}	
	
	public function simpanpilihanquisoner()
	{
		$ujianmodel=new Ujian_model();
		$idujian=$this->request->getPost("idujian");
		$idsurvey=$this->request->getPost("idsurvey");
		$text=$this->request->getPost("pilihan");
		
		$res=$ujianmodel->inspilihanquisioner($idujian,$idsurvey,$text);
		
		if ($res["errstate"]=="00000")
		{
			return "success";
		}
		else {
			return "failed";
		}
		
	}
	
	public function hapuspilihanquisoner()
	{
		$ujianmodel=new Ujian_model();
		$idujian=$this->request->getPost("idujian");
		$idsurvey=$this->request->getPost("idsurvey");
		$value=$this->request->getPost("value");
		
		
		$res=$ujianmodel->delpilihanquisioner($idujian,$idsurvey,$value);
		
		if ($res["errstate"]=="00000")
		{
			return "success";
		}
		else {
			return "failed";
		}
		
	}
	
	
}
