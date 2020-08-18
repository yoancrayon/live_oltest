<?php namespace App\Models;
use CodeIgniter\Model;
 
class Login_model extends Model
{
   
     
    public function getLogin ($username,$password)
	{
		$textq="call getloginstat('".$username."','".$password."')";
		$db = db_connect('default');
		$query=$db->query($textq);
		$row   = $query->getRowArray(); 
		return $row['status_login'];
		
	}
	
	public function getUserinfo($username)
	{
		$db = db_connect('default');
		$query=$db->query("call getuserinfo('".$username."')");
		$row   = $query->getRowArray();
		return $row;
		
	}
	
	
	public function getMjenispengguna()
	{
		
		$query=$db->query("select k_jenis_pengguna,jenis_pengguna from m_jenis_user");
		$row   = $query->getRowArray();
		return $row;
		
	}
	
	
	public function insupdUser($data)
	{
		$query=$db->query("call insupdpengguna('".$data['username']."','".$data['password']."','".$data['k_jenis_user']."','".$data['nama']."')");
		$row   = $query->getRowArray();
		return $row;	
		
		
	}
	public function delUser($username)
	{
		
		$query=$db->query("call delpengguna('".$username."')");
		$row   = $query->getRowArray();
		return $row;
		
	}
	
 
}