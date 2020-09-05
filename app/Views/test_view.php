<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.js" integrity="sha512-WNLxfP/8cVYL9sj8Jnp6et0BkubLP31jhTG9vhL/F5uEZmg5wEzKoXp1kJslzPQWwPT1eyMiSxlKCgzHLOTOTQ==" crossorigin="anonymous"></script>
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
      height: 150px;
    }


    </style>
<script>
    var myServerData = <?= json_encode($pertanyaan)?>; // Don't forget to sanitize
                                                 //server data
	localStorage.setItem("myServerData", JSON.stringify(myServerData));											 
	/*  window.onbeforeunload = function(e) {
        // Turning off the event
        e.preventDefault();
    }; */

	
					
</script>
<link rel="apple-touch-icon" sizes="57x57" href="<?php echo base_url('favicon/apple-icon-57x57.png'); ?>">
<link rel="apple-touch-icon" sizes="60x60" href="<?php echo base_url('favicon/apple-icon-60x60.png'); ?>">
<link rel="apple-touch-icon" sizes="72x72" href="<?php echo base_url('favicon/apple-icon-76x76.png'); ?>">
<link rel="apple-touch-icon" sizes="76x76" href="<?php echo base_url('favicon/apple-icon-76x76.png'); ?>">
<link rel="apple-touch-icon" sizes="114x114" href="<?php echo base_url('favicon/apple-icon-114x114.png'); ?>">
<link rel="apple-touch-icon" sizes="120x120" href="<?php echo base_url('favicon/apple-icon-120x120.png'); ?>">
<link rel="apple-touch-icon" sizes="144x144" href="<?php echo base_url('favicon/apple-icon-144x144.png'); ?>">
<link rel="apple-touch-icon" sizes="152x152" href="<?php echo base_url('favicon/apple-icon-152x152.png'); ?>">
<link rel="apple-touch-icon" sizes="180x180" href="<?php echo base_url('favicon/apple-icon-180x180.png'); ?>">
<link rel="icon" type="image/png" sizes="192x192"  href="<?php echo base_url('favicon/android-icon-192x192.png'); ?>">
<link rel="icon" type="image/png" sizes="32x32" href="<?php echo base_url('favicon/favicon-32x32.png'); ?>">
<link rel="icon" type="image/png" sizes="96x96" href="<?php echo base_url('favicon/favicon-96x96.png'); ?>">
<link rel="icon" type="image/png" sizes="16x16" href="<?php echo base_url('favicon/favicon-16x16.png'); ?>">
<link rel="manifest" href="<?php echo base_url('favicon/manifest.json'); ?>">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage" content="<?php echo base_url('favicon/ms-icon-144x144.png'); ?>">
<meta name="theme-color" content="#ffffff">


<title>Test - livE Online Java Exercise</title>



</head>
<body>

<nav class="navbar navbar-dark fixed-top bg-dark flex-md-no p-0 shadow">
    <div class="container-fluid">
        <a href="#" class="navbar-brand mr-3">livE Online Java Exercise</a>
        
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
		<span>Waktu Pengerjaan : </span>
		<span id="minutes"></span><span id="titik">:</span><span id="seconds"></span>
		<span id="minutesselesai" style="display:none"></span><span id="titikselesai" style="display:none">:</span><span id="secondsselesai" style="display:none"></span>
		
        <h3 class="card-title" id="soalke">Soal 1
					</h3>
      
	 <p class="card-text mt-2" id="pertanyaan">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	 
	 <form>
	 <div class="form-group">
		<label >Tulis Kodemu</label>
		<div id="editor"></div>
		
		
		
	 </div>
	 <div class="form-group">
		<label for="inputcode">Input</label>
		<input type="text" class="form-control" id="inputcode" placeholder="input">
	 </div>
	 <button type="button" class="btn btn-primary" id="runcode">RUN KODE</button>
	 <button type="button" class="btn btn-danger" id="resetcode">Reset KODE</button>
	 
	 <div class="form-group">
	 <label for="text-output">Output</label>
	 <textarea class="form-control" id="text-output" rows="3" disabled="true"></textarea>
	 </div>
	 <button type="button" class="btn btn-primary pull-right align-self-end ml-auto justify-content-end" id="simpanjawaban">Simpan Jawaban</button>
	 <button type="button" class="btn btn-info pull-right align-self-end ml-auto justify-content-end" id="akhirujian" style="display:none">Akhiri Ujian</button>
	 
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