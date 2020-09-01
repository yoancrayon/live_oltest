<?php namespace App\Models;
use CodeIgniter\Model;
 
class Test_model extends Model
{
	public function eksekusi($kode,$inputuser)
	{
		$session = session();
		
		if (!file_exists(WRITEPATH .'eksekusi/'.$session->get('username'))) {
		mkdir(WRITEPATH .'eksekusi/'.$session->get('username'), 0777, true);
		}
		
	chdir(WRITEPATH .'eksekusi/'.$session->get('username'));	
	putenv("PATH=C:\Program Files\Java\jdk-12.0.2\bin");
	$CC="javac";
	$out="java Main";
	$code=$kode;
	$input=$inputuser;
	$filename_code="Main.java";
	$filename_in="input.txt";
	$filename_error="error.txt";
	$runtime_file="runtime.txt";
	$executable="*.class";
	$command=$CC." ".$filename_code;	
	$command_error=$command." 2>".$filename_error;
	$runtime_error_command=$out." 2>".$runtime_file;

	//if(trim($code)=="")
	//die("The code area is empty");
	
	$file_code=fopen($filename_code,"w+");
	fwrite($file_code,$code);
	fclose($file_code);
	$file_in=fopen($filename_in,"w+");
	fwrite($file_in,$input);
	fclose($file_in);
	exec("cacls  $executable /g everyone:f"); 
	exec("cacls  $filename_error /g everyone:f");	

	shell_exec($command_error);
	$error=file_get_contents($filename_error);

	if(trim($error)=="")
	{
		if(trim($input)=="")
		{
			shell_exec($runtime_error_command);
			$runtime_error=file_get_contents($runtime_file);
			$output=shell_exec($out);
		}
		else
		{
			shell_exec($runtime_error_command);
			$runtime_error=file_get_contents($runtime_file);
			$out=$out." < ".$filename_in;
			$output=shell_exec($out);
		}
		//echo "<pre>$runtime_error</pre>";
		//echo "<pre>$output</pre>";
		return $output;
		  //echo "<textarea id='div' class=\"form-control\" name=\"output\" rows=\"10\" cols=\"50\">$output</textarea><br><br>";
	}
	else if(!strpos($error,"error"))
	{
		echo "<pre>$error</pre>";
		if(trim($input)=="")
		{
			$output=shell_exec($out);
		}
		else
		{
			$out=$out." < ".$filename_in;
			$output=shell_exec($out);
		}
		//echo "<pre>$output</pre>";
		return $output;
		  //echo "<textarea id='div' class=\"form-control\" name=\"output\" rows=\"10\" cols=\"50\">$output</textarea><br><br>";
	}
	else
	{
		return $error;
	}
	exec("del $filename_code");
	exec("del *.txt");
	exec("del $executable");
		
	}
	
	public function prepareujian($idujian,$username)
	{
		
		$db = db_connect('default');
		$textq="call prepareujian('".$idujian."','".$username."')";
		
		$query=$db->query($textq);
		$row   = $query->getRowArray();
		return $row;
		
	}
	
	public function getjawabanpesertaujian($idujian,$idpertanyaan,$username)
	{
		$db = db_connect('default');
		$query=$db->query("call getjawabanpesertaujian('".$idujian."','".$idpertanyaan."','".$username."')");
		$row   = $query->getResult();
		return $row;
		
		
		
	}
	
	public function updatejawaban($data){
 
		$db = db_connect('default');
		$textq="call updatejawabanpesertaujian('".$data["idujian"]."','".$data["idpertanyaan"]."','".$data["username"]."',".$this->db->escape($data["jawaban"]).",".$this->db->escape($data["inputjawaban"]).",".$this->db->escape($data["outputjawab"]).",'".$data["initialtime"]."',".$data["intimer"].",".$data["incountdown_timer"].")";
		$query=$db->query($textq);
		$row   = $query->getRowArray();
		return $row;
		
		
	}
	
	public function isupdlogjsontest($idujian,$username,$json)
	{
		$db = db_connect('default');
		$textq="call insupdlogjsontest(".$this->db->escape($idujian).",".$this->db->escape($username).",".$this->db->escape($json).")";
		$query=$db->query($textq);
		$row   = $query->getRowArray();
		return $row;
	}
	
	
	public function getquisoner($idujian)
	{
		
		$db = db_connect('default');
		$textq=" SELECT   `id_survey` as `name`,   `type`,   `title` FROM   `live_oltest`.`quisioner_ujian` WHERE id_ujian='".$idujian."'";
	
		$query=$db->query($textq);
		$row   = $query->getRowArray();
		return $row;
		
	}
	
	
	public function getpilihan($idujian,$idsurvey)
	{
		
		$db = db_connect('default');
		$textq=" SELECT  `values`,  `text` FROM `live_oltest`.`quisioner_ujian_jawab` WHERE id_ujian='".$idujian."' AND id_survey='".$idsurvey."'";
		$query=$db->query($textq);
		$row   = $query->getRowArray();
		return $row;
		
	}
	
}