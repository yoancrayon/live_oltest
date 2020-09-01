<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.js" integrity="sha512-WNLxfP/8cVYL9sj8Jnp6et0BkubLP31jhTG9vhL/F5uEZmg5wEzKoXp1kJslzPQWwPT1eyMiSxlKCgzHLOTOTQ==" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/8.11.8/sweetalert2.all.min.js"></script>

<link href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css" rel="stylesheet">

 <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>

<script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.2/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.2/js/buttons.bootstrap4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.2/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.2/js/buttons.print.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.2/js/buttons.colVis.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.6.2/css/buttons.bootstrap4.min.css" >
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css" >
<link rel="stylesheet" href="<?php echo base_url('assets/css/dashboarddosen.css'); ?>" >
<link rel="stylesheet" href="<?php echo base_url('assets/css/bootstrap-datepicker.css'); ?>" >
<script src="<?php echo base_url('assets/js/bootstrap-datepicker.js'); ?>"></script>

<link type="text/css" href="//gyrocode.github.io/jquery-datatables-checkboxes/1.2.12/css/dataTables.checkboxes.css" rel="stylesheet" />
<script type="text/javascript" src="//gyrocode.github.io/jquery-datatables-checkboxes/1.2.12/js/dataTables.checkboxes.min.js"></script>
<script>
    var idujian = <?= json_encode($idujian)?>; 
	localStorage.setItem("idujian",idujian);											 
					
</script>
<script src="<?php echo base_url('assets/js/ellipsis.js'); ?>"></script></body>

<style>
      body {
    padding-top: 70px;
  }

    </style>





</head>
<body>

<nav class="navbar navbar-dark fixed-top bg-dark flex-md-no p-0 shadow">
    <div class="container-fluid">
        <a href="#" class="navbar-brand mr-3">LIVE Online Java Exercise</a>
        
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
	
		<div class="card-header">
		<h2><?php echo $namaujian; ?></h2>
		<span>Waktu Pelaksanaan : <?php echo $tglmulai; ?></span> s/d <span><?php echo $tglselesai; ?></span>
	

		</div>
     	<div class="card-body">
		<table id="table" class="display table-striped table-bordered" cellspacing="0" width="100%">
                <thead>
                    <tr><th>PERTANYAAN</th><th>JAWABAN</th><th>OUTPUT JAWABAN</th>
					<th>STATUS ERROR</th><th>WAKTU PENGERJAAN</th><th>JUMLAH EKSEKUSI</th>
					<th>STATUS JAWABAN</th></tr>
                </thead>
                <tbody>
                </tbody>
        </table>
		
		
		<div id="surveyElement" style="display:inline-block;width:100%;"></div>
		
		<button type="button" class="d-flex btn btn-primary btn-xl ml-auto center justify-content-center" id="kembali">Kembali Ke Dashboard</button>
    	</div>
	</div>
	
	
	
</div>
</body>
	<script src="<?php echo base_url('assets/js/survey.jquery.js'); ?>"></script>   
	<!--	<link href="<?php echo base_url('assets/css/survey.min.css'); ?>" type="text/css" rel="stylesheet"/>-->
		 <link href="<?php echo base_url('assets/css/modern.css');?>" type="text/css" rel="stylesheet"/>
       
<script src="<?php echo base_url('assets/js/test_sum.js'); ?>"></script></body>

</html>