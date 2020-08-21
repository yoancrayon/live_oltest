$(document).ready(function() {
	var table = $('#table').DataTable({
		"dom": '<"top"Bf>rt<"bottom"lp><"clear">',
                    "processing": true, //Feature control the processing indicator.
                   
                    "order": [], //Initial no order.
                    // Load data for the table's content from an Ajax source
                    "ajax": {
                        "url": 'http://localhost/live_oltest/public/ujian/getpertanyaan',
                        "type": "POST",
						"data":function ( d ) {
							d.idujian= $("#dropdownnamaujian").children("option:selected").val()
							
						}
						
						,dataSrc:""
                    },
					 "columns": [
                        {"data": "nama_ujian",width:100},
                        {"data": "pertanyaan",width:200},
						{"data": "template_jawaban",width:200},
                       
						{ "render": function ( data, type, row ){
							var html  ="<a href=\"javascript:void(0);\" class=\"show_record btn btn-info btn-xs btn-sm\" data-idujian=\""+row["id_ujian"]+"\" data-idpertanyaan=\""+row["id_pertanyaan"]+"\" >SHOW</a> "
							html  +="<a href=\"javascript:void(0);\" class=\"edit_record btn btn-info btn-xs btn-sm\" data-idujian=\""+row["id_ujian"]+"\" data-idpertanyaan=\""+row["id_pertanyaan"]+"\" >EDIT</a> "
							  html  += "<a href=\"javascript:void(0);\" class=\"hapus_record btn btn-danger btn-xs btn-sm\" data-idujian=\""+row["id_ujian"]+"\" data-idpertanyaan=\""+row["id_pertanyaan"]+"\">DELETE</a>" 
								
								return html

							
						},width:100}
						],
						columnDefs: [ {
						targets: 1,
						render: $.fn.dataTable.render.ellipsis( 17, true )
						},{
						targets: 2,
						render: $.fn.dataTable.render.ellipsis( 10 )	
							
						} ],
						
						"initComplete": function() {
						$("#table").show();
						},
						"buttons": [ 'copy', 'csv', 'excel', 'pdf', 'print']
						
		
		
	});
	table.buttons().container()
        .appendTo( '#table_wrapper .col-auto:eq(0)' );	
	
	
	
	$('#newsoal').click(function(){
		
		if ($("#dropdownnamaujian").children("option:selected").val()=="x")
		{
			Swal.fire({
                    type: 'error',
                    title: 'Opps!',
                    text: 'Nama Ujian tidak Boleh Seluruh!'
                  });
			
		}
		else{
		
		window.document.getElementById("judulmodal").innerHTML  ="Tambah Pertanyaan Ujian Baru";
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
            url: "http://localhost/live_oltest/public/ujian/inserpesertaujian",
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
		
		$.ajax({
            url: "http://localhost/live_oltest/public/ujian/delerpesertaujian",
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
		
		
		
		});
		
		
	});
	
	
	
});