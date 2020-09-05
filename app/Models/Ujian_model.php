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
		$textq="call insupdujian('".$data["id_ujian"]."','".$data["nama_ujian"]."','".$data["tanggal_mulai"]."','".$data["tanggal_selesai"]."',".$data["durasi"].",'".$data["username"]."')";
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
	
	public function getpeserta($idujian,$usernamepeserta,$username)
	{
		$db = db_connect('default');
		$query=$db->query("call getpesertaujian('".$idujian."','".$usernamepeserta."','".$username."')");
		$row   = $query->getResult();
		return $row;
		
		
	}
	
	public function getpesertanoujian($idujian)
	{
		$db = db_connect('default');
		$query=$db->query("call getpesertanoujian('".$idujian."')");
		$row   = $query->getResult();
		return $row;
		
		
	}
	
	//inspesertaujian
	
	public function inspesertaujian($idujian,$usernamepeserta,$username)
	{
		$db = db_connect('default');
		$textq="call inspesertaujian('".$idujian."','".$usernamepeserta."','".$username."')";
		$query=$db->query($textq);
		$row   = $query->getRowArray();
		return $row;
		
		
	}
	
	//delpesertaujian
	
	public function delpesertaujian($idujian,$usernamepeserta)
	{
		$db = db_connect('default');
		$textq="call delpesertaujian('".$idujian."','".$usernamepeserta."')";
		$query=$db->query($textq);
		$row   = $query->getRowArray();
		return $row;
		
		
	}
	
	//getpertanyaan	

	public function getpertanyaan($idujian,$idpertanyaan,$username)
	{
		$db = db_connect('default');
		$query=$db->query("call getpertanyaan('".$idujian."','".$idpertanyaan."','".$username."')");
		$row   = $query->getResult();
		return $row;
		
		
	}
	
	//insupdpertyaan
	
	public function insupdpertanyaan($data)
	{
		 
		$db = db_connect('default');
		$textq="call insupdpertanyaan('".$data["id_pertanyaan"]."','".$data["id_ujian"]."',".$this->db->escape($data["pertanyaan"]).",".$this->db->escape($data["template_jawaban"]).",'".$data["username"]."',".$this->db->escape($data["ekspektasijawaban"]).")";
		$query=$db->query($textq);
		$row   = $query->getRowArray();
		
		return $row;
		
	}
	
		public function delpertanyaan($idujian,$idpertanyaan)
	{
		$db = db_connect('default');
		$textq="call delpertanyaan('".$idpertanyaan."','".$idujian."')";
		$query=$db->query($textq);
		$row   = $query->getRowArray();
		return $row;
		
		
	}
	
	
	public function getlistujianpeserta($idujian,$username){
		
		$db = db_connect('default');
		$query=$db->query("call getujianpeserta('".$idujian."','".$username."')");
		$row   = $query->getResult();
		return $row;
		
	}
	
	
	public function resetpesertaujian($idujian,$username)
	{
		$db = db_connect('default');
		$textq="call resetpesertaujian('".$idujian."','".$username."')";
		$query=$db->query($textq);
		$row   = $query->getRowArray();
		return $row;
		
	}
	
	
	 public function getlisthasilujian($idujian,$idpertanyaan,$usernamepeserta,$usernameujian)
	{
		$db = db_connect('default');
		$textq="call getsummaryujian('".$idujian."','".$idpertanyaan."','".$usernamepeserta."','".$usernameujian."')";
		$query=$db->query($textq);
		$row   = $query->getResult();
	   
		return $row;
		
		
	} 
	
	
	public function flushnilai($idujian)
	{
		$db = db_connect('default');
		$textq="call flushnilai('".$idujian."')";
		$query=$db->query($textq);
		$row   = $query->getRowArray();
		return $row;
		
	}
	
	public function updatenilai($idujian,$idpertanyaan,$username,$nilai)
	{
		
		$db = db_connect('default');
		$textq="call updatenilaipeserta('".$idujian."','".$idpertanyaan."','".$username."','".$nilai."')";
		$query=$db->query($textq);
		$row   = $query->getRowArray();
		return $row;
		
	}
	
	public function getquisioner($idujian,$idsurvey)
	{
		
		$db = db_connect('default');
		$textq="call getquisionerujian('".$idujian."','".$idsurvey."')";
		$query=$db->query($textq);
		$row   = $query->getResult();
	   
		return $row;
		
	}
	
	public function insupdquisioner($data)
	{
		
		$db = db_connect('default');
		$textq="call insupdquisionerujian(		'".$data["idujian"]."','".$data["idsurvey"]."','".$data["type"]."',".$this->db->escape($data["title"]).",".$this->db->escape($data["minrating"]).",".$this->db->escape($data["maxrating"]).")";
		
		$query=$db->query($textq);
		$row   = $query->getRowArray();
		return $row;
		
	}
	
	public function delquisioner($idujian,$idsurvey)
	{
		
		$db = db_connect('default');
		$textq="call delquisionerujian('".$idujian."','".$idsurvey."')";
		
		$query=$db->query($textq);
		$row   = $query->getRowArray();
		return $row;
		
	}
	
	public function getpilihanquisioner($idujian,$idsurvey)
	{
		
		$db = db_connect('default');
		$textq="call getquisionerpilihan('".$idujian."','".$idsurvey."')";
		$query=$db->query($textq);
		$row   = $query->getResult();
	   
		return $row;
		
	}
	
	public function inspilihanquisioner($idujian,$idsurvey,$text)
	{
		
		$db = db_connect('default');
		$textq="call insquisionerujianpilihan('".$idujian."','".$idsurvey."','".$text."')";
		$query=$db->query($textq);
		$row   = $query->getRowArray();
		return $row;
		
	}
	
	public function delpilihanquisioner($idujian,$idsurvey,$value)
	{
		
		$db = db_connect('default');
		$textq="call delquisionerujianpilihan('".$idujian."','".$idsurvey."','".$value."')";
		$query=$db->query($textq);
		$row   = $query->getRowArray();
		return $row;
		
	}
	
	
	
}