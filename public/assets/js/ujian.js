$(document).ready(function() {
	if (location.host == 'localhost') {
	var base_url = window.location.origin+"/live_oltest/";
	}
	else{
		var base_url = window.location.origin;
	}
	var table = $('#table').DataTable({
		"dom": '<"top"Bf>rt<"bottom"lp><"clear">',
                    "processing": true, //Feature control the processing indicator.
                   
                    "order": [], //Initial no order.
                    // Load data for the table's content from an Ajax source
                    "ajax": {
                        "url": base_url+'public/ujian/listujian',
                        "type": "POST"
						
						,dataSrc:""
                    },
					 "columns": [
                        {"data": "nama_ujian",width:200},
                        {"data": "tanggal_mulai",width:100},
						{"data": "tanggal_selesai",width:100},
                        {"data": "durasi",width:30},
						{"data": "jumlah_peserta",width:30},
						{ "render": function ( data, type, row ){
							 var html  = "<a href=\"javascript:void(0);\" class=\"edit_record btn btn-info btn-xs btn-sm\" data-idujian=\""+row["id_ujian"]+"\" data-namaujian=\""+row["nama_ujian"]+"\" data-tglmulai=\""+row["tanggal_mulai"]+"\" data-tglselesai=\""+row["tanggal_selesai"]+"\" data-durasi=\""+row["durasi"]+"\" >EDIT</a> "
								html += "<a href=\"javascript:void(0);\" class=\"hapus_record btn btn-danger btn-xs btn-sm\" data-idujian=\""+row["id_ujian"]+"\" >DELETE</a>" 
								
								return html

							
						},width:200}
						],
						"initComplete": function() {
						$("#table").show();
						},
						"buttons": [ 'copy', 'csv', 'excel', 'pdf', 'print']
						
		
		
	});
	table.buttons().container()
        .appendTo( '#table_wrapper .col-auto:eq(0)' );	
	$("#modaltglmulai").datepicker({
		format: 'yyyy-mm-dd',
		startDate: '+1d'
		
	});
	$("#modaltglselesai").datepicker({
		format: 'yyyy-mm-dd',
		startDate: '+1d'
	});
	
	$('#newujian').click(function(){
		window.document.getElementById("judulmodal").innerHTML  ="Tambah Ujian Baru";
		window.document.getElementById("modalidujian").value  ="";
		window.document.getElementById("modalnamaujian").value  ="";
		window.document.getElementById("modaltglselesai").value  ="";
		window.document.getElementById("modaltglmulai").value  ="";
		window.document.getElementById("modaldurasi").value  ="";
		$('#modalcenter').modal('show');
		
		
	}
	);
	
	$("#savemodal").click( function() {
		var idujian=window.document.getElementById("modalidujian").value;
		var namaujian=window.document.getElementById("modalnamaujian").value;
		var tglselesai =window.document.getElementById("modaltglselesai").value;
		var tglmulai=window.document.getElementById("modaltglmulai").value;
		var durasi=window.document.getElementById("modaldurasi").value;
	
		if (namaujian.length=="") {
			
			Swal.fire({
                    type: 'error',
                    title: 'Opps!',
                    text: 'Nama Belum Diisi!'
                  });
		}	
		else if (tglmulai.length=="") {
			Swal.fire({
                    type: 'error',
                    title: 'Opps!',
                    text: 'Tanggal Mulai Ujian Belum Diisi!'
                  });
			
		}
		else if (tglselesai.length=="") {
			
			Swal.fire({
                    type: 'error',
                    title: 'Opps!',
                    text: 'Tanggal Selesai Ujian Belum Diisi!'
                  });
		}
		else if (tglselesai<tglmulai)
		{
			
			Swal.fire({
                    type: 'error',
                    title: 'Opps!',
                    text: 'Tanggal Selesai Ujian harus lebih dari atau sama dengan Tanggal Mulai Ujian!'
                  });
		}
		else if (durasi.length==""){
			Swal.fire({
                    type: 'error',
                    title: 'Opps!',
                    text: 'Durasi Harus Diisi!'
                  });
				
		}
		else if (durasi<=0) {
			Swal.fire({
                    type: 'error',
                    title: 'Opps!',
                    text: 'Durasi Harus Lebih Dari 0 Menit!'
                  });
			
			
		}
		
		else {
			
			
			$.ajax({
				url: base_url+"public/ujian/saveujian",  
				type: "POST",
				data: {
                  "idujian": idujian,
				  "namaujian": namaujian,
                  "tglmulai": tglmulai,
				  "tglselesai":tglselesai,
				  "durasi":durasi
				},
				
				success:function(response){

                if (response == "success") {

                  Swal.fire({
                    type: 'success',
                    title: 'SUKSES',
                    text: 'Ujian Berhasil DISIMPAN!',
                    timer: 500,
                    showCancelButton: false,
                    showConfirmButton: false
                  })
                  .then (function() {
                     $('#table').DataTable().ajax.reload();
					 Swal.close();
					 $('#modalcenter').modal('hide');
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
	
	$('#table').on('click','.edit_record',function(){
		var idujian=$(this).data('idujian');
		var namaujian=$(this).data('namaujian');
		var tglmulai=$(this).data('tglmulai');
		var tglselesai=$(this).data('tglselesai');
		var durasi=$(this).data('durasi');
		
		window.document.getElementById("judulmodal").innerHTML  ="Edit Ujian";
		window.document.getElementById("modalidujian").value  =idujian;
		window.document.getElementById("modalnamaujian").value  =namaujian;
		window.document.getElementById("modaltglselesai").value  =tglselesai;
		window.document.getElementById("modaltglmulai").value  =tglmulai;
		window.document.getElementById("modaldurasi").value  =durasi;
		$('#modalcenter').modal('show');
	
	})	;
	
	
	$('#table').on('click','.hapus_record',function(){
		var idujian=$(this).data('idujian');
		Swal.fire({
        title: "Apakah Anda Yakin?",
        text: "Ujian dan Peserta yang dihapus tidak akan bisa dikembalikan",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Hapus!",
        closeOnConfirm: false
		}).then((result)=>{
		
		$.ajax({
            url: base_url+"public/ujian/hapusujian",
            type: "POST",
            data: {
                "idujian": idujian
            },
            dataType: "html",
            success: function (response) {
				
				if (response == "success") {
					Swal.fire({
                    type: 'success',
                    title: 'SUKSES',
                    text: 'Ujian dan Peserta Berhasil DIHAPUS!',
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
		
		
		
		});
		
		
	});
	
	
	var tablepeserta = $('#tablepeserta').DataTable({
		"dom": '<"top"Bf>rt<"bottom"lp><"clear">',
                    "processing": true, //Feature control the processing indicator.
                   
                    "order": [], //Initial no order.
                    // Load data for the table's content from an Ajax source
                    "ajax": {
                        "url": base_url+'public/ujian/listujianpeserta',
                        "type": "POST"
						
						,dataSrc:""
                    },
					 "columns": [
                        {"data": "nama_ujian",width:200},
                        {"data": "tanggal_mulai",width:100},
						{"data": "tanggal_selesai",width:100},
                        {"data": "durasi",width:30},
						{"data": "jumlah_peserta",width:30},
						{ "render": function ( data, type, row ){
							 var html  = "<a href=\"javascript:void(0);\" class=\"mulaiujian_record btn btn-info btn-xs btn-sm\" data-idujian=\""+row["id_ujian"]+"\" data-namaujian=\""+row["nama_ujian"]+"\" data-tglmulai=\""+row["tanggal_mulai"]+"\" data-tglselesai=\""+row["tanggal_selesai"]+"\" data-durasi=\""+row["durasi"]+"\" data-isenable=\""+row["is_enable"]+"\"  >Mulai Ujian</a> "
						
								
								return html

							
						},width:200}
						],
						"initComplete": function() {
						$("#table").show();
						},
						"buttons": [ 'copy', 'csv', 'excel', 'pdf', 'print']
						
		
		
	});
	table.buttons().container()
        .appendTo( '#table_wrapper .col-auto:eq(0)' );	
	
	$('#tablepeserta').on('click','.mulaiujian_record',function(){
		var idujian=$(this).data('idujian');
		
		
		$.ajax({
            url: base_url+"public/ujian/persiapanujianpeserta",
            type: "POST",
            data: {
                "idujian": idujian
            },
            dataType: "html",
            success: function (response) {
				
				if (response == "success") {
					Swal.fire({
                    type: 'success',
                    title: 'SUKSES',
                    text: 'Ujian Berhasil Disiapkan\n Anda akan dialihkan ke halaman ujian dalam 3 detik',
                    timer: 3000,
                    showCancelButton: false,
                    showConfirmButton: false
                  })
                  .then (function() {
					 Swal.close();
					 window.location.href = base_url+"public/test";
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
		
		
	});
	
});