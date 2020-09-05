<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.js" integrity="sha512-WNLxfP/8cVYL9sj8Jnp6et0BkubLP31jhTG9vhL/F5uEZmg5wEzKoXp1kJslzPQWwPT1eyMiSxlKCgzHLOTOTQ==" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/8.11.8/sweetalert2.all.min.js"></script>



<link rel="stylesheet" href="<?php echo base_url('assets/css/dashboarddosen.css'); ?>" >
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
<title>Login Page - livE Online Java Exercise</title>
</head>

<body style="padding-top: 70px;" >


<nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
  <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">livE Online Java Exercise</a>
  
  <ul class="navbar-nav px-3">
    <li class="nav-item text-nowrap">
    <!--  <a class="nav-link" href="#">Sign out</a>-->
    </li>
  </ul>
</nav>


<div class="container-fluid">
	<div class="card border-primary mx-auto" style="width: 35rem;">
      <div class="card-body">
        <h1 class="card-title">Login
					</h1>
		<p class="card-text">Untuk Mahasiswa gunakan Username NIM dan password NIM</p>
		
		<!--<form> -->
		<div class="form-group">
		<label for="exampleFormControlInput1">Username</label>
		<input type="text" class="form-control username" id="exampleFormControlInput1" placeholder="username">
		</div>
		<div class="form-group">
		<label for="exampleFormControlInput2">Password</label>
		<input type="password" class="form-control password" id="exampleFormControlInput2" placeholder="password">
		</div>
		
		
		<button  class="btn btn-primary float-right btn-login" id="loginbutton">LOGIN</button>
		<!-- </form>-->
</div>
</div>
</div>
</body>
<script src="<?php echo base_url('assets/js/login.js'); ?>"></script></body>
</html>