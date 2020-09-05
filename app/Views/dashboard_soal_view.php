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




 <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
	  
	   editor {
      background-color: #f5f5f5;
    }

    #editor {
      width: auto;
      height: 250px;
    }
	
	 editor2 {
      background-color: #f5f5f5;
    }

    #editor2 {
      width: auto;
      height: 250px;
    }
    </style>
<!-- <link rel="apple-touch-icon" href="/docs/4.4/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/4.4/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/4.4/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/4.4/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/4.4/assets/img/favicons/safari-pinned-tab.svg" color="#563d7c">
<link rel="icon" href="/docs/4.4/assets/img/favicons/favicon.ico"> -->

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


<meta name="msapplication-config" content="/docs/4.4/assets/img/favicons/browserconfig.xml">
<meta name="theme-color" content="#563d7c">	
<title>Pertanyaan - livE Online Java Exercise</title>
</head>
<body>
 
<nav class="navbar navbar-dark fixed-top bg-dark flex-md-no p-0 shadow">
  <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">livE Online Java Exercise</a>

 
   
  
  <ul class="navbar-nav px-3">
  
    <li class="nav-item text-nowrap col-md-2ml-auto">
	<!-- <span class="nav-text ml-auto"><?php echo "Hi, ".$nama; ?></span>-->
	  <a class="nav-link navbar-right" href="<?php echo base_url('dashboard/SignOut'); ?>"><?php echo "Hi, ".$nama; ?></a>
    </li>
  </ul> 
  
  			
</nav>

 
 
 
<div class="container-fluid">
	<div class="row">

		<nav class="col-md-2 d-none d-md-block bg-light sidebar">
      <div class="sidebar-sticky">
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link " href="<?php echo base_url('dashboard'); ?>">
              <span data-feather="home"></span>
              Dashboard 
            </a>
          </li>
		  <?php 
          echo '<li class="nav-item">';
          echo '  <a class="nav-link " href="'.base_url('dashboard/pengguna').'">';
          echo '    <span data-feather="users"></span>';
          echo 'Pengguna';
          echo '  </a>';
          echo '</li>';
		  
		  ?>
		  
		  <?php  if ($k_jenis_user == "1" || $k_jenis_user == "2" || $k_jenis_user == "3")  {
		  
          echo '<li class="nav-item">';
          echo '  <a class="nav-link " href="'.base_url('ujian').'">';
          echo '    <span data-feather="layers"></span>';
          echo 'Ujian ';
          echo '  </a>';
          echo ' </li>';
		  }
		  if ($k_jenis_user == "1" || $k_jenis_user == "2" ) {
          echo '<li class="nav-item">';
          echo '  <a class="nav-link active" href="#">';
          echo '    <span data-feather="layers"></span>';
          echo '    Pertanyaan <span class="sr-only">(current)</span>';
          echo '  </a>';
          echo '</li>';
		  
		  
		  
          echo '<li class="nav-item">';
          echo '  <a class="nav-link" href="'.base_url('ujian/pesertaujian').'">';
          echo '    <span data-feather="users"></span>';
          echo '    Peserta';
          echo '  </a>';
          echo '</li>';
		  }
		  ?>
		  
          <li class="nav-item">
            <a class="nav-link" href="<?php echo base_url('ujian/hasilujian');?>">
              <span data-feather="layers"></span>
              Hasil UJian
            </a>
          </li>
		  <?php  if ($k_jenis_user == "1" || $k_jenis_user == "2" ){
			   
		  echo '<li class="nav-item">';
          echo '  <a class="nav-link" href="'.base_url('ujian/quisioner').'">';
          echo '    <span data-feather="layers"></span>';
          echo '    Quisioner';
          echo '  </a>';
          echo '</li>';   
			   
			   
			   
		   }
		  ?>
		  
        </ul>

        
      </div>
    </nav>
	
	<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Daftar Pertanyaan Ujian</h1>
      </div>
	  <div> 
	
	  
	  <div class="input-group mb-3   "
	  style="display:  <?php  if ($k_jenis_user != "1" && $k_jenis_user != "2" )  {echo "none";} else { echo "blok";} ?>;"
	  >
		<div class="input-group-append">
				<label class="input-group-text" for="inputGroupSelect02">Nama Ujian</label>
		</div>
		<select class="input-group-append custom-select col-md-2" id="dropdownnamaujian">
				
				<?php
				echo '<option selected  value="x">Seluruh Ujian</option>';
				foreach ($dropdown_ujian as $row)
				{
					echo '<option value="'.$row->id_ujian.'">'.$row->nama_ujian.'</option>';
					
				}
				
				?>
		</select>
		
		<button class="btn btn-success align-self-end ml-auto justify-content-end" id="newsoal">Tambah</button>	
		
		</div>
	  
	 
		<table id="table" class="display table-striped table-bordered" cellspacing="0" width="100%">
                <thead>
                    <tr><th>NAMA UJIAN</th><th>PERTANYAAN</th><th>TEMPLATE JAWABAN</th><th>EKSPEKTASI JAWABAN</th><th>ACTION</th></tr>
                </thead>
                <tbody>
                </tbody>
        </table>
	
	  </div>		
		
      </div>
	 
    </main>



	</div>
	

<!-- Modal -->
<div class="modal fade " id="modalcenter" tabindex="-1" role="dialog" aria-labelledby="JudulModal" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-xl" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="judulmodal">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
	

		<div class="row">
    <div class="col-md-6">	
	 <div class="form-group" style="display:none">
		<input type="text" class="form-control" id="modalidujian" >
	 </div> 
	 <div class="form-group" style="display:none">
		<input type="text" class="form-control" id="modalidpertanyaan" >
	 </div>
	
	
	
	<div class="form-group">
	<label for="pertanyaan">Pertanyaan</label>
    <textarea class="form-control" id="pertanyaan" rows="4"></textarea>
	</div>
	
	
	<label>Template Jawaban</label>
     <div id="editor"></div>
    <div class="form-group">
	<label for="ekspektasijawaban">Ekspektasi Jawaban</label>
    <textarea class="form-control" id="ekspektasijawaban" rows="4"></textarea>
	
	
	</div>
	</div>
	
	  <div class="col-md-6">
	  <label>Coba Jawaban</label>
	  <div id="editor2"></div>
	 
	  <div class="form-group">
	  <label for="cobajawabaninput">Coba Jawaban Input</label>
      <textarea type="text" class="form-control" id="cobajawabaninput" rows="4"></textarea>
	  </div>
	  
	 <div class="form-group">
	<label for="cobajawabanoutput" >Output Jawaban</label>
    <textarea class="form-control" id="cobajawabanoutput" rows="4" disabled></textarea>
	</div>
	   </div>
      </div>
	  </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="modaldiscard">Close</button>
		<button type="button" class="btn btn-info" id="cobajawab">Coba Jawab</button>
        <button type="button" class="btn btn-primary" id="savemodal">Save changes</button>
		
      </div>
    </div>
  </div>
</div>


		<script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.9.0/feather.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
	<script src="<?php echo base_url('assets/js/ellipsis.js'); ?>"></script></body>
	<script src="<?php echo base_url('assets/js/ace/ace.js'); ?>"></script>
	<script src="<?php echo base_url('assets/js/ace/ext-language_tools.js'); ?>"></script>
	<script src="<?php echo base_url('assets/js/ace/mode-java.js'); ?>"></script>
	
	</body>
<!--<script src="https://pagecdn.io/lib/ace/1.4.12/ace.js" crossorigin="anonymous" integrity="sha256-Q9hnBpgBFstzZOr+OKFOWZWfcF5nFXO8Qz48Nmndo6U=" ></script>-->
	<script src="<?php echo base_url('assets/js/soal.js'); ?>"></script></body>
		<script src="<?php echo base_url('assets/js/dashboarddosen.js'); ?>"></script> 



		
		</body>
</body>
</html>