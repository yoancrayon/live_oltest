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

</head>

<body style="padding-top: 70px;" >


<nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
  <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">LIVE Online Test</a>
  
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