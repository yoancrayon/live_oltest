<?php namespace App\Models;
use CodeIgniter\Model;
 
class Ujian_model extends Model
{
	public function getlistujian($idujian,$username){
		
		$db = db_connect('default');
		$query=$db->query("call getlistujian('".$idujian."','".$username."')");
		$row   = $query->getResult();
		return $row;
		
	}
	
	public function insupdujian($data)
	{
		$db = db_connect('default');
		$textq="call insupdujian('".$data["id_ujian"]."','".$data["nama_ujian"]."','".$data["tanggal_mulai"]."','".$data["tanggal_selesai"]."',".$data["durasi"].",'".$data["sername"]."')";
		$query=$db->query($textq);
		$row   = $query->getRowArray();
		return $row;
		
		
	}
	
	public function delujian($idujian)
	{
		$db = db_connect('default');
		$textq="call delujian('".$idujian."')";
		$query=$db->query($textq);
		$row   = $query->getRowArray();
		return $row;
		
		
	}
	
}