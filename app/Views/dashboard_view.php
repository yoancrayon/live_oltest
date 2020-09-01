<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

<link rel="stylesheet" href="<?php echo base_url('assets/css/dashboarddosen.css'); ?>" >

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
    </style>
<link rel="apple-touch-icon" href="/docs/4.4/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/4.4/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/4.4/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/4.4/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/4.4/assets/img/favicons/safari-pinned-tab.svg" color="#563d7c">
<link rel="icon" href="/docs/4.4/assets/img/favicons/favicon.ico">
<meta name="msapplication-config" content="/docs/4.4/assets/img/favicons/browserconfig.xml">
<meta name="theme-color" content="#563d7c">	

</head>
<body>
 
<nav class="navbar navbar-dark fixed-top bg-dark flex-md-no p-0 shadow">
  <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">LIVE Online Java Exercise</a>

 
   
  
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
            <a class="nav-link active" href="<?php echo base_url('dashboard')?>">
              <span data-feather="home"></span>
              Dashboard  <span class="sr-only">(current)</span>
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
		  if ($k_jenis_user == "1" || $k_jenis_user == "2"  ) { 
          echo '<li class="nav-item">';
          echo '  <a class="nav-link" href="'.base_url('ujian/soal').'">';
          echo '    <span data-feather="layers"></span>';
          echo '    Pertanyaan';
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
        <h1 class="h2">Preface</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
          <div class="btn-group mr-2"> 
          </div
        </div>
      </div>
	
	 
      
      </div>
      <img src="<?php echo base_url('Images/live logo.png'); ?>" class="ml-auto justify-content-center align-items-center mx-auto text-center" />
	   <p class="text-justify font-weight-normal text-monospace">
	  livE (Online java exercise ) sebagai Sarana meningkatkan kualitas praktikum pada mata kuliah Praktikum Dasar Pemrograman. Tersedianya livE akan memudahkan mahasiswa untuk melakukan praktikum Dasar pemrograman.
<ol><li> Mahasiswa dapat melakukan langkah-langkah percobaan dan latihan pada website tanpa harus melakukan instalasi perangkat lunak pada masing-masing Komputer mahasiswa</li>
<li> Meningkatnnya efektifitas praktikum pada perkuliahan Praktikum Dasar Pemrograman pada Program Studi D-III Teknik Informatika Jurusan Teknologi Informasi Politeknik Negeri Malang</li></ol>
	  </p>
	  <p class="text-justify font-weight-normal text-monospace">Didasari dari banyaknya mahasiswa yang mengalami kesusahan mengenai instalasi dan konfigurasi perangkat praktikum seperti JDK di laptop masing-masing. Hal ini biasaya terjadi pada mahasiswa semester awal yang berasal dari SMA dan belum familiar dengan pemrograman komputer. jika mahasiswa tersebut tidak dapat mengonfigurasi perangkat lunak penunjang praktikum, mengakibatkan mahasiswa tersebut tidak dapat melakukan langkah percobaan dan latihan praktikum. Permasalahan instalasi dan pengkonfigurasian perangkat lunak praktikum tersebut dilakukan dengan pendampingan dan pengarahan oleh dosen kepada mahasiswa dalam proses instalasi. Ketika mahasiswa tidak segera membenarkan instalasi dan konfigurasi perangkat lunak yang digunakan untuk praktikum, maka mahasiswa tersebut tidak akan bisa melakukan langkah-langkah percobaan maupun latihan-latihan yang ada pada panduan penuntun praktikum (jobsheet)</P>
      
    </main>



	</div>

</div>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.9.0/feather.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>

	<script src="<?php echo base_url('assets/js/dashboarddosen.js'); ?>"></script></body>
</body>
</html>