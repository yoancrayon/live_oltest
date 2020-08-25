<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/8.11.8/sweetalert2.all.min.js"></script>

<style>
      body {
    padding-top: 70px;
  }
  
 editor {
      background-color: #f5f5f5;
    }

    #editor {
      width: auto;
      height: 250px;
    }


    </style>
<script>
    var myServerData = <?= json_encode($pertanyaan)?>; // Don't forget to sanitize
                                                 //server data
	localStorage.setItem("myServerData", JSON.stringify(myServerData));											 
												 
</script>





</head>
<body>

<nav class="navbar navbar-dark fixed-top bg-dark flex-md-no p-0 shadow">
    <div class="container-fluid">
        <a href="#" class="navbar-brand mr-3">LIVE Online Test</a>
        
       <ul class="navbar-nav px-3">
  
    <li class="nav-item text-nowrap col-md-2ml-auto">
	<!-- <span class="nav-text ml-auto"><?php echo "Hi, ".$nama; ?></span>-->
	  <a class="nav-link navbar-right" href="<?php echo base_url('dashboard/SignOut'); ?>"><?php echo "Hi, ".$nama; ?></a>
    </li>
  </ul> 
    </div>    
</nav>
	



<div class="container">
	

	<div class="card">
	<span id="iTimeShow" class="text-dark pull-rightalign-self-end ml-auto justify-content-end" style="font-size:18px;">Waktu Tersisa</span><span id='timer' style="font-size:30px;" class="text-dark pull-rightalign-self-end ml-auto justify-content-end"></span>
	
	<div class="card-header">
    
	<?php
	foreach ($pertanyaan as $row){
		
		echo '<button type="button" class="btn btn-sm btn-primary ';
		if ($row->no_urut==1) {echo "btn-success";}
		echo '" id="btnnourut">'.$row->no_urut.'</button> ';
		
		
	}
	?>

	</div>
      <div class="card-body">
        <h3 class="card-title" id="soalke">Soal 1
					</h3>
      
	 <p class="card-text mt-2" id="pertanyaan">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	 
	 <form>
	 <div class="form-group">
		<label >Tulis Kodemu</label>
		<div id="editor"></div>
		
		
		
	 </div>
	 <div class="form-group">
		<label for="exampleFormControlInput1">Input</label>
		<input type="text" class="form-control" id="exampleFormControlInput1" placeholder="input">
	 </div>
	 <button type="submit" class="btn btn-primary">RUN KODE</button>
	 <button type="button" class="btn btn-danger">Reset KODE</button>
	 
	 <div class="form-group">
	 <label for="text-output">Output</label>
	 <textarea class="form-control" id="text-output" rows="3" disabled="true"></textarea>
	 </div>
	 <button type="submit" class="btn btn-primary pull-rightalign-self-end ml-auto justify-content-end" id="simpanjawaban">Simpan Jawaban</button>
	</form>
    </div>
	</div>
	<div id="sessionplace" style="display:none">
	<input type="text" id="durasiujian" value=<?php echo $durasiujian ;?> />
	
	</div>
	
</div>
</body>
    <script src="<?php echo base_url('assets/js/ace/ace.js'); ?>"></script>
	<script src="<?php echo base_url('assets/js/ace/ext-language_tools.js'); ?>"></script>
	<script src="<?php echo base_url('assets/js/ace/mode-java.js'); ?>"></script>
	
<script src="<?php echo base_url('assets/js/test.js'); ?>"></script></body>
</html>