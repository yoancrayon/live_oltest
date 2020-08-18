$(document).ready(function() {
	var base_url = window.location.origin;

var host = window.location.host;

var pathArray = window.location.pathname.split( '/' );
	$(".btn-login").click( function() {
		var username=document.getElementById("exampleFormControlInput1").value;  
		var password=document.getElementById("exampleFormControlInput2").value;  
		
		

		if(username.length == "") {

            Swal.fire({
              type: 'warning',
              title: 'Oops...',
              text: 'Username Wajib Diisi !'
            });

          } else if(password.length == "") {

            Swal.fire({
              type: 'warning',
              title: 'Oops...',
              text: 'Password Wajib Diisi !'
            });

          } else {
			$.ajax({
				url: "http://localhost/live_oltest/public/login/getLoginstat",  
				type: "POST",
				data: {
                  "username": username,
                  "password": password
				},
				success:function(response){

                if (response == "success") {

                  Swal.fire({
                    type: 'success',
                    title: 'Login Berhasil!',
                    text: 'Anda akan di arahkan dalam 3 Detik',
                    timer: 3000,
                    showCancelButton: false,
                    showConfirmButton: false
                  })
                  .then (function() {
                    window.location.href = "http://localhost/live_oltest/public/dashboard";
                  });

                } else {

                  Swal.fire({
                    type: 'error',
                    title: 'Login Gagal!',
                    text: 'silahkan coba lagi!'
                  });


                }

                console.log(response);

              },

              error:function(response){

                  Swal.fire({
                    type: 'error',
                    title: 'Opps!',
                    text: 'server error!'
                  });

                  console.log(response);

              }
				
				
				
				
			});
		  
		  }
		
	});
	
	
});