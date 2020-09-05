$(document).ready(function() {
	
	if (location.host == 'localhost') {
	var base_url = window.location.origin+"/live_oltest/";
	}
	else{
		var base_url = window.location.origin+"/";
	}
	
	document.getElementById("inputGroupSelect02").value=document.getElementById("kjenisuser").value;
	var e = document.getElementById("inputGroupSelect02");
	var kjenisuser = e.options[e.selectedIndex].value;
	
	
	
	
	
	var table = $('#table').DataTable({
	
					"dom": '<"top"Bf>rt<"bottom"lp><"clear">',
                    "processing": true, //Feature control the processing indicator.
                   
                    "order": [], //Initial no order.
                    // Load data for the table's content from an Ajax source
                    "ajax": {
                        "url": base_url+'public/dashboard/penggunalist',
                        "type": "POST",
						"data":function ( d ) {
							d.k_jenis_user= $("#inputGroupSelect02").children("option:selected").val()
							
						}
						,dataSrc:""
                    },
                    //Set column definition initialisation properties.
                    "columns": [
                        {"data": "username",width:100},
                        {"data": "nama",width:200},
						{"data": "k_jenis_user",width:100},
                        {"data": "jenis_user",width:150},
						{"data": "kelas",width:150 },
						{"data": "jenis_asal_sekolah",width:50},
						
						{ "render": function ( data, type, row ){
							 var html  = "<a href=\"javascript:void(0);\" class=\"edit_record btn btn-info btn-xs btn-sm\" data-username=\""+row["username"]+"\" data-nama=\""+row["nama"]+"\" data-kjenisuser=\""+row["k_jenis_user"]+"\" data-jenisuser=\""+row["k_jenis_user"]+"\"  data-kelas=\""+row["kelas"]+"\" data-jnsasalsekolah=\""+row["jenis_asal_sekolah"]+"\">EDIT</a> "
							 if (window.document.getElementById("kjenisuser").value=="1")
							 {
								html += "<a href=\"javascript:void(0);\" class=\"hapus_record btn btn-danger btn-xs btn-sm\" data-username=\""+row["username"]+"\" >DELETE</a>" 
							 }
								html += " <a href=\"javascript:void(0);\" class=\"cpas_record btn btn-primary btn-xs btn-sm\" data-username=\""+row["username"]+"\" >Ganti PASS</a>"
								return html

							
						},width:200}
						
                    ],
					"columnDefs": [
					{
					    "targets": [ 2 ],
						"visible": false,
						"searchable": false
					}],
					"initComplete": function() {
						$("#table").show();
						},
					"buttons": [ 'copy', 'csv', 'excel', 'pdf', 'print']
  

                });
	table.buttons().container()
        .appendTo( '#table_wrapper .col-auto:eq(0)' );	

	if (kjenisuser=="2"){
		
		table.columns(4).visible(false);
		table.columns(5).visible(false);
		
	}
		

	$('#table').on('click','.edit_record',function(){
		var username=$(this).data('username');
		var nama=$(this).data('nama');
		var k_jenis_user=$(this).data('kjenisuser');
		var jenis_user=$(this).data('jenisuser');
		var kelas=$(this).data('kelas');
		var jnsasalsekolah=$(this).data('jnsasalsekolah');
		$("#modalkelas").hide();
		$('#labelmodalkelas').hide();
		$("#modalselectjenissma").hide();
		$('#labelmodalasalsma').hide();
		if (jenis_user=="3")
		{
			$("#modalkelas").show();
			$('#labelmodalkelas').show();
			$("#modalselectjenissma").show();
		    $('#labelmodalasalsma').show();
			
		}
		
		window.document.getElementById("judulmodal").innerHTML  ="Edit Pengguna";
		window.document.getElementById("modalusername").value  =username;
		window.document.getElementById("modalusername").disabled = true;
		window.document.getElementById("modalnama").value  =nama;
		window.document.getElementById('modalselect').value=k_jenis_user;
		window.document.getElementById("modalselectjenissma").value=jnsasalsekolah;
		
		window.document.getElementById('modalpasswordlabel').hidden=true;
		document.getElementById("modalpassword").hidden=true;
		document.getElementById("modalpassword").value="";
		window.document.getElementById("modalkelas").value  =kelas;
		$('#modalcenter').modal('show');
	})	;
	
	$("#savemodal").click( function() {
	    var username=window.document.getElementById("modalusername").value;
		var nama=window.document.getElementById("modalnama").value;
		var e = document.getElementById("modalselect");
		var k_jenis_user = e.options[e.selectedIndex].value;
		var vpassword=window.document.getElementById("modalpassword").value;
		var kelas=window.document.getElementById("modalkelas").value;
		var f = document.getElementById("modalselectjenissma");
		var jnsasalsekolah=f.options[f.selectedIndex].value;
		
		
		if (k_jenis_user =="1" || k_jenis_user =="2") 
		{
			kelas="";
			jnsasalsekolah="";
			
		}
		
		$.ajax({
				url: base_url+"public/dashboard/savepengguna",  
				type: "POST",
				data: {
                  "username": username,
				  "nama": nama,
                  "k_jenis_user": k_jenis_user,
				  "password":vpassword,
				  "kelas":kelas,
				  "jnsasalsekolah":jnsasalsekolah
				},
				
				success:function(response){

                if (response == "success") {

                  Swal.fire({
                    type: 'success',
                    title: 'SUKSES',
                    text: 'Pengguna Berhasil DISIMPAN!',
                    timer: 500,
                    showCancelButton: false,
                    showConfirmButton: false
                  })
                  .then (function() {
                     $('#table').DataTable().ajax.reload();
					 Swal.close();
                  });

                } else {

                  Swal.fire({
                    type: 'error',
                    title: 'Aww Gagal',
                    text: 'Silahkan Cek Lagi Data yang Dimasukkan!'
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
		
		
		window.document.getElementById("judulmodal").innerHTML  ="";
		window.document.getElementById("modalusername").value  ="";
		window.document.getElementById("modalnama").value  ="";
		window.document.getElementById('modalselect').value="x";
		window.document.getElementById('modalpasswordlabel').hidden=false;
		document.getElementById("modalpassword").hidden=false;
		window.document.getElementById("modalusername").disabled = false;
		$('#modalcenter').modal('hide');
	
	});
	
	$("#discardmodal").click( function() {
		window.document.getElementById("judulmodal").innerHTML  ="";
		window.document.getElementById("modalusername").value  ="";
		window.document.getElementById("modalusername").disabled = false;
		window.document.getElementById("modalnama").value  ="";
		window.document.getElementById('modalselect').value="x";
		window.document.getElementById('modalpasswordlabel').hidden=false;
		document.getElementById("modalpassword").hidden=false;
		$('#modalcenter').modal('hide');
		document.getElementById("modalpassword").value="";
		
	});
	
	$("#inputGroupSelect02").change( function() {
		
		 $('#table').DataTable().ajax.reload();
		 
		 
	});
	$("#newuser").click(function(){
		window.document.getElementById("judulmodal").innerHTML  ="Tambah Pengguna Baru";
		window.document.getElementById("modalusername").value  ="";
		window.document.getElementById("modalusername").disabled = false;
		window.document.getElementById("modalnama").value  ="";
		window.document.getElementById('modalselect').value="x";
		window.document.getElementById('modalpasswordlabel').hidden=false;
		document.getElementById("modalpassword").hidden=false;
		document.getElementById("modalpassword").value="";
		$("#modalkelas").hide();
		$('#labelmodalkelas').hide();
		$("#modalselectjenissma").hide();
		$('#labelmodalasalsma').hide();
		window.document.getElementById("modalkelas").value  ="";
		$('#modalcenter').modal('show');
		
		
	}
	);
	
	
	$("#modalselect").change( function() {
		
		if ($("#modalselect").children("option:selected").val()=="3")
		{
			
		$("#modalkelas").show();
		$('#labelmodalkelas').show();
		$("#modalselectjenissma").show();
		$('#labelmodalasalsma').show();
		}
	else{
		$("#modalkelas").hide();
		$('#labelmodalkelas').hide();
		$("#modalselectjenissma").hide();
		$('#labelmodalasalsma').hide();
		
	}
		 
		 
	});
	
	
	$('#table').on('click','.hapus_record',function(){
		var username=$(this).data('username');
		Swal.fire({
        title: "Apakah Anda Yakin?",
        text: "Data pengguna yang dihapus tidak akan bisa dikembalikan",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Hapus!",
        closeOnConfirm: false
    }).then((result)=> {
       if (result.value){
        $.ajax({
            url: base_url+"public/dashboard/delpengguna",
            type: "POST",
            data: {
                "username": username
            },
            dataType: "html",
            success: function (response) {
				
				if (response == "success") {
					Swal.fire({
                    type: 'success',
                    title: 'SUKSES',
                    text: 'Pengguna Berhasil DIHAPUS!',
                    timer: 500,
                    showCancelButton: false,
                    showConfirmButton: false
                  })
                  .then (function() {
                     $('#table').DataTable().ajax.reload();
					 Swal.close();
                  });
				}
				else{
					Swal.fire({
                    type: 'error',
                    title: 'Aww Gagal',
                    text: 'Silahkan Cek Lagi Data yang Dimasukkan!'
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
	
	$('#table').on('click','.cpas_record',function(){
		var username=$(this).data('username');
		window.document.getElementById("modalcpasswordusername").value  =username;
		window.document.getElementById("modalcpasswordusername").disabled=true;
		window.document.getElementById("modalcpassword").value  ="";
		window.document.getElementById("modalcpassword2").value  ="";
		window.document.getElementById("judulmodalpassword").innerHTML  ="Ganti Password Pengguna";
		$('#modalcenterpassword').modal('show');
	});
	
	$("#savemodalpassword").click( function() {
		var username =window.document.getElementById("modalcpasswordusername").value;
		var pass1=window.document.getElementById("modalcpassword").value;
		var pass2=window.document.getElementById("modalcpassword2").value;
		
		
		
		if (pass1 != pass2 ){
			Swal.fire({
              type: 'warning',
              title: 'Oops...',
              text: 'Password Tidak Sama !'
            });
		}
		else
		{
			$.ajax({
				url: base_url+"public/dashboard/updpasswordpengguna",  
				type: "POST",
				data: {
                  "username": username,
				  "password": pass1
				},
				success:function(response){

                if (response == "success") {

                  Swal.fire({
                    type: 'success',
                    title: 'SUKSES',
                    text: 'Password Berhasil DISIMPAN!',
                    timer: 500,
                    showCancelButton: false,
                    showConfirmButton: false
                  })
                  .then (function() {
                    $('#modalcenterpassword').modal('hide');
					 Swal.close();
                  });

                } else {

                  Swal.fire({
                    type: 'error',
                    title: 'Aww Gagal',
                    text: 'Silahkan Cek Lagi Data yang Dimasukkan!'
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