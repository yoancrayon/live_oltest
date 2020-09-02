<?php namespace App\Controllers;


use App\Models\Login_model;
class Login extends BaseController
{
	
	
	public function index()
	{
		$session = session();
		if ($session->username)
		{
			
		return redirect()->to(base_url('dashboard'));
		}
		else
		{
		return view('login_view');
		}
	}
	
	public function getLoginstat()
	{
		
		$loginmodel=new Login_model(); 
		$session = session();
		$username=$this->request->getPost('username');
		$pass=$this->request->getPost('password');
		$stat=$loginmodel->getLogin($username, $pass); 
		
		
		if ($stat=='1') 
		{
			  $userdata=$loginmodel->getUserinfo($this->request->getPost('username'));
			  
			  $session->set('username', $userdata['username']);
              $session->set('nama', $userdata['nama']);
			  $session->set('k_jenis_user', $userdata['k_jenis_user']);
			  $session->set('jenis_user', $userdata['jenis_user']);
			  $session->set('isLoggedIn', TRUE);
			
			return "success";
			
		}
		else
		{
		return False;
			
		}		
	}

	//--------------------------------------------------------------------

}
