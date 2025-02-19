$(document).ready(function() {
	
	if (location.host == 'localhost') {
	var base_url = window.location.origin+"/live_oltest/";
	}
	else{
		var base_url = window.location.origin+"/";
	}
	
	

	
	var table = $('#table').DataTable({
		"dom": '<"top"Bf>rt<"bottom"lp><"clear">',
                    "processing": true, //Feature control the processing indicator.
                   
                    "order": [], //Initial no order.
                    // Load data for the table's content from an Ajax source
                    "ajax": {
                        "url": base_url+'public/ujian/getpeserta',
                        "type": "POST",
						"data":function ( d ) {
							d.idujian= $("#dropdownnamaujian").children("option:selected").val()
							
						}
						
						,dataSrc:""
                    },
					 "columns": [
                        {"data": "nama_ujian",width:100},
                        {"data": "username_peserta",width:150},
						{"data": "nama",width:150},
						{"data": "kelas",width:150},
                        {"data": "total_nilai",width:30},
						{"data": "waktu_ujian",width:30},
						{ "render": function ( data, type, row ){
							 var html  = "<a href=\"javascript:void(0);\" class=\"hapus_record btn btn-danger btn-xs btn-sm\" data-idujian=\""+row["id_ujian"]+"\" data-usernamepeserta=\""+row["username_peserta"]+"\">DELETE</a>" 
							 html+=" <a href=\"javascript:void(0);\" class=\"reset_record btn btn-info btn-xs btn-sm\" data-idujian=\""+row["id_ujian"]+"\" data-usernamepeserta=\""+row["username_peserta"]+"\">Reset Ujian</a>" 
								
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
	
	
	
	var modaltable = $('#modaltable').DataTable({
		"processing": true, //Feature control the processing indicator.
        "order": [], //Initial no order.
		"ajax": {
                        "url": base_url+'public/ujian/getpesertanoikut',
                        "type": "POST",
						"data":function ( d ) {
							d.idujian= $("#dropdownnamaujian").children("option:selected").val()
							
						}
						
						,dataSrc:""
                    },
		"columns": [
                        {"data": "username",width:10},
                        {"data": "username",width:150},
						{"data": "nama",width:150},
                        {"data": "jenis_user",width:100},
						{"data": "kelas",width:100},
						
						
						],
		'columnDefs': [
         {
            'targets': 0,
            'checkboxes': {
               'selectRow': true
            }
			}
		],
		'select': {
         'style': 'multi'
		},
		'order': [[1, 'asc']],
		"initComplete": function() {
					$("#table").show();
					}
		
		
	});
	
	
	$("#dropdownnamaujian").change( function() {
		
		 $('#table').DataTable().ajax.reload();
		 $('#modaltable').DataTable().ajax.reload();
		 
		 
	});
	
	$('#newpeserta').click(function(){
		
		if ($("#dropdownnamaujian").children("option:selected").val()=="x")
		{
			Swal.fire({
                    type: 'error',
                    title: 'Opps!',
                    text: 'Nama Ujian tidak Boleh Seluruh!'
                  });
			
		}
		else{
		window.document.getElementById("judulmodal").innerHTML  ="Tambah Peserta Ujian Baru";
		$('#modaltable').DataTable().ajax.reload();
		$('#modalcenter').modal('show');
		}
		
	}
	);
	
	$("#savemodal").click( function() {
		var rows_selected = modaltable.column(0).checkboxes.selected();
		var groupusername="";
		$.each(rows_selected, function(index, rowId){
         
		 groupusername=groupusername+","+rowId;
		});
		
		$.ajax({
            url: base_url+"public/ujian/inserpesertaujian",
            type: "POST",
            data: {
				"idujian":$("#dropdownnamaujian").children("option:selected").val(),
                "groupusername": groupusername.substring(1)
            },
            dataType: "html",
            success: function (response) {
				
				if (response == "success") {
					Swal.fire({
                    type: 'success',
                    title: 'SUKSES',
                    text: 'Peserta Ujian Berhasil Ditambahkan!',
                    timer: 500,
                    showCancelButton: false,
                    showConfirmButton: false
                  })
                  .then (function() {
                     $('#table').DataTable().ajax.reload();
					 $('#modalcenter').modal('hide');
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
	
	
	$('#table').on('click','.reset_record',function(){
		var idujian=$(this).data('idujian');
		var usernamepeserta=$(this).data('usernamepeserta');
		
		Swal.fire({
        title: "Apakah Anda Yakin?",
        text: "Jawaban Peserta Ujian Akan Dihapus",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Reset!",
        closeOnConfirm: false
		}).then((result)=>{
		
		if (result.value){
		
		$.ajax({
            url: base_url+"public/ujian/resetpesertaujian",
            type: "POST",
            data: {
                "idujian": idujian,
				"usernamepeserta":usernamepeserta
            },
            dataType: "html",
            success: function (response) {
				
				if (response == "success") {
					Swal.fire({
                    type: 'success',
                    title: 'SUKSES',
                    text: 'Jawaban Berhasil DIHAPUS!',
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
	
	$('#table').on('click','.hapus_record',function(){
		var idujian=$(this).data('idujian');
		var usernamepeserta=$(this).data('usernamepeserta');
		Swal.fire({
        title: "Apakah Anda Yakin?",
        text: "Peserta Akan dihapus",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Hapus!",
        closeOnConfirm: false
		}).then((result)=>{
		
		if (result.value){
		
		$.ajax({
            url: base_url+"public/ujian/delerpesertaujian",
            type: "POST",
            data: {
                "idujian": idujian,
				"usernamepeserta":usernamepeserta
            },
            dataType: "html",
            success: function (response) {
				
				if (response == "success") {
					Swal.fire({
                    type: 'success',
                    title: 'SUKSES',
                    text: 'Peserta Berhasil DIHAPUS!',
                    timer: 500,
                    showCancelButton: false,
                    showConfirmButton: false
                  })
                  .then (function() {
                     $('#table').DataTable().ajax.reload();
					 $('#modaltable').DataTable().ajax.reload();
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
	
	
	
});