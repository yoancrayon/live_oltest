<?php namespace App\Controllers;

use App\Models\login_Model;
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
	   $loginmodel=new Login_model(); 
	    $dropdown_jenis_Pengguna=$loginmodel->getMjenispengguna();
		$data=[
		'nama'=>$session->get('nama'),
		'username'=>$session->get('username'),
		'k_jenis_user'=>$session->get('k_jenis_user'),
		'jenis_user'=>$session->get('jenis_user'),
		'dropdown_jenis_Pengguna'=>$dropdown_jenis_Pengguna
		
		
		];

		return view('dashboard_pengguna_view',$data);
		
	}
	public function penggunalist()
	{
		$filter =$this->request->getPost('k_jenis_user');
		$loginmodel=new Login_model(); 
		$session = session();
		if ($session->get('k_jenis_user')=='1')
		{$username="x";}
		else
		{$username=$session->get('username');}
	
		$pengguna=$loginmodel->getUser($username,$filter);
			
		return json_encode($pengguna);
		
	}
	
	public function savepengguna()
	{
		$username=$this->request->getPost('username');
		$nama=$this->request->getPost('nama');
		$k_jenis_user=$this->request->getPost('k_jenis_user');
		$password=$this->request->getPost('password');
		$loginmodel=new Login_model();
		
		$data=[
		"username"=>$username,
		"nama"=>$nama,
		"k_jenis_user"=>$k_jenis_user,
		"password"=>$password
		
		];
		$res=$loginmodel->insupdUser($data);
		
		if ($res["errstate"]=="00000")
		{
			return "success";
		}
		else {
			return "failed";
		}
		
	}
	
	public function delpengguna()
	{
		$username=$this->request->getPost('username');
		$loginmodel=new Login_model();
		$res=$loginmodel->delUser($username);
		
		if ($res["errstate"]=="00000")
		{
			return "success";
		}
		else {
			return "failed";
		}
	}
	
	
	
}	