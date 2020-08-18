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
	
	public function getUser($username,$kjenisuser)
	{
		$db = db_connect('default');
		$query=$db->query("call getuserinfoall('".$username."','".$kjenisuser."')");
		$row   = $query->getResult();
		return $row;
		
	}
	
	
	public function getMjenispengguna()
	{
		$db = db_connect('default');
		$query=$db->query("SELECT k_jenis_user,content as jenis_pengguna FROM m_jenis_user");
		$row   = $query->getResult();
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