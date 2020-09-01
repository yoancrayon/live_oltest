$(document).ready(function() {
	
	if (location.host == 'localhost') {
	var base_url = window.location.origin+"/live_oltest/";
	}
	else{
		var base_url = window.location.origin;
	}
	
	
		 $("#modalminrating").hide();
		 $("#modalmaxrating").hide();	
		 $("#modalminratinglabel").hide();
		 $("#modalmaxratinglabel").hide();
		 var selectedidsurvey="";
	
	var table = $('#table').DataTable({
		"dom": '<"top"Bf>rt<"bottom"lp><"clear">',
                    "processing": true, //Feature control the processing indicator.
                   
                    "order": [], //Initial no order.
                    // Load data for the table's content from an Ajax source
                    "ajax": {
                        "url": base_url+'public/ujian/listpertanyaanquisioner',
                        "type": "POST",
						"data":function ( d ) {
							d.idujian= $("#dropdownnamaujian").children("option:selected").val()
							
						}
						
						,dataSrc:""
                    },
					 "columns": [
                        {"data": "title",width:200},
                        {"data": "type",width:150},
                        {"data": "minrating",width:30},
						{"data": "maxrating",width:30},
						{ "render": function ( data, type, row ){
							 var html  = "<a href=\"javascript:void(0);\" class=\"edit_record btn btn-success btn-xs btn-sm\" data-idujian=\""+row["id_ujian"]+"\" data-idsurvey=\""+row["id_survey"]+"\"  data-title=\""+row["title"]+"\" data-type=\""+row["type"]+"\" data-minrating=\""+row["minrating"]+"\" data-maxrating=\""+row["maxrating"]+"\"  >EDIT</a> "
							 html  += "<a href=\"javascript:void(0);\" class=\"hapus_record btn btn-danger btn-xs btn-sm\" data-idujian=\""+row["id_ujian"]+"\" data-idsurvey=\""+row["id_survey"]+"\">DELETE</a>" 
							 if (row["type"]=="radiogroup" || row["type"]=="checkbox")
							 html+=" <a href=\"javascript:void(0);\" class=\"input_jawab_record btn btn-info btn-xs btn-sm\" data-idujian=\""+row["id_ujian"]+"\" data-idsurvey=\""+row["id_survey"]+"\">SET JAWABAN</a>" 
								
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
		"dom": '<"top">rt<"bottom"lp><"clear">',
		"processing": true, //Feature control the processing indicator.
        "order": [], //Initial no order.
		"ajax": {
                        "url": base_url+'public/ujian/listpilihanquisioner',
                        "type": "POST",
						"data":function ( d ) {
							d.idujian= $("#dropdownnamaujian").children("option:selected").val(),
							d.idsurvey= selectedidsurvey
							
							
						}
						
						,dataSrc:""
                    },
		"columns": [
                        {"data": "text",width:100},
                        { "render": function ( data, type, row ){
							 var html  = "<a href=\"javascript:void(0);\" class=\"hapus_record btn btn-danger btn-xs btn-sm\" data-idujian=\""+row["id_ujian"]+"\" data-idsurvey=\""+row["id_survey"]+"\" data-value=\""+row["values"]+"\" >DELETE</a>" 
							 
								
								return html

							
						},width:100}
						],
		
		
		
		"initComplete": function() {
					$("#table").show();
					}
		
		
	});
	
	
	$("#dropdownnamaujian").change( function() {
		
		 $('#table').DataTable().ajax.reload();
		 $('#modaltable').DataTable().ajax.reload();
		 
		 
	});
	
	$("#modaldropdowntype").change( function() {
		
		 if ($(modaldropdowntype).children("option:selected").val()=="rating")
		 {	
	 
	    window.document.getElementById("modalminrating").value="";
		window.document.getElementById("modalmaxrating").value="";
		$("#modalminrating").show();
		 $("#modalmaxrating").show();	
		 $("#modalminratinglabel").show();
		 $("#modalmaxratinglabel").show();	
		
		}
		else{
		 window.document.getElementById("modalminrating").value="";
		window.document.getElementById("modalmaxrating").value="";
		 $("#modalminrating").hide();
		 $("#modalmaxrating").hide();	
		 $("#modalminratinglabel").hide();
		 $("#modalmaxratinglabel").hide();
		}
		 
		 
	});
	
	
	
	
	$('#newquisioner').click(function(){
		
		if ($("#dropdownnamaujian").children("option:selected").val()=="x")
		{
			Swal.fire({
                    type: 'error',
                    title: 'Opps!',
                    text: 'Nama Ujian tidak Boleh Seluruh!'
                  });
			
		}
		else{
		window.document.getElementById("judulmodal").innerHTML  ="Tambah Pertanyaan Quisioner Baru";
		window.document.getElementById("modalminrating").value="";
		window.document.getElementById("modalmaxrating").value="";
		window.document.getElementById("modalpertanyaan").value="";
		window.document.getElementById("modalidsurvey").value="";
		window.document.getElementById("modalidujian").value=$("#dropdownnamaujian").children("option:selected").val();
		
		$('#modalcenter').modal('show');
		}
		
	}
	);
	
	$("#savemodal").click( function() {
		var idujian=window.document.getElementById("modalidujian").value;
		var idsurvey=window.document.getElementById("modalidsurvey").value;
		var type=$("#modaldropdowntype").children("option:selected").val();
		var title=window.document.getElementById("modalpertanyaan").value;
		var minrating=window.document.getElementById("modalminrating").value;
		var maxrating=window.document.getElementById("modalmaxrating").value;
		
		
		$.ajax({
            url: base_url+"public/ujian/simpanquisioner",
            type: "POST",
            data: {
				"idujian":idujian,
				"idsurvey":idsurvey,
				"type":type,
				"title":title,
				"minrating":minrating,
				"maxrating":maxrating
            },
            dataType: "html",
            success: function (response) {
				
				if (response == "success") {
					Swal.fire({
                    type: 'success',
                    title: 'SUKSES',
                    text: 'Pertanyaan Quisioner Berhasil Ditambahkan!',
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
	
	$("#modaltambahpilihan").click( function() {
		var idujian=$("#dropdownnamaujian").children("option:selected").val();
		var idsurvey=selectedidsurvey;
		var vtext=window.document.getElementById("modalpilihantambah").value;
		
		$.ajax({
            url: base_url+"public/ujian/simpanpilihanquisoner",
            type: "POST",
            data: {
				"idujian":idujian,
				"idsurvey":idsurvey,
				"pilihan":vtext
				
            },
            dataType: "html",
            success: function (response) {
				
				if (response == "success") {
					Swal.fire({
                    type: 'success',
                    title: 'SUKSES',
                    text: 'Pilihan Quisioner Berhasil Ditambahkan!',
                    timer: 500,
                    showCancelButton: false,
                    showConfirmButton: false
                  })
                  .then (function() {
                     $('#modaltable').DataTable().ajax.reload();
					 window.document.getElementById("modalpilihantambah").value="";
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
	
	
	$('#modaltable').on('click','.hapus_record',function(){
		var idujian=$(this).data('idujian');
		var idsurvey=$(this).data('idsurvey');
		var value=$(this).data('value');
		Swal.fire({
        title: "Apakah Anda Yakin?",
        text: "Pilihan Quisioner Akan dihapus",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Hapus!",
        closeOnConfirm: false
		}).then((result)=>{
		
		if (result.value){
		
		$.ajax({
            url: base_url+"public/ujian/hapuspilihanquisoner",
            type: "POST",
            data: {
                "idujian": idujian,
				"idsurvey":idsurvey,
				"value":value
            },
            dataType: "html",
            success: function (response) {
				
				if (response == "success") {
					Swal.fire({
                    type: 'success',
                    title: 'SUKSES',
                    text: 'Pilihan Berhasil DIHAPUS!',
                    timer: 500,
                    showCancelButton: false,
                    showConfirmButton: false
                  })
                  .then (function() {
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
	
	
	$('#table').on('click','.input_jawab_record',function(){
		selectedidsurvey=$(this).data('idsurvey');
		window.document.getElementById("modalpilihantambah").value="";
		$('#modaltable').DataTable().ajax.reload();
		$('#modalcenterpilihan').modal('show');
		
	});
	
	
	$('#table').on('click','.edit_record',function(){
		window.document.getElementById("judulmodal").innerHTML  ="Edit Pertanyaan Quisioner";
		window.document.getElementById("modalidujian").value=$(this).data('idujian');
		window.document.getElementById("modalidsurvey").value=$(this).data('idsurvey');
	  //$(#modaldropdowntype).find('option[value="' + $(this).data('type') + '"]').attr("selected", "selected");
	  $("#modaldropdowntype").val($(this).data('type'));
		window.document.getElementById("modalpertanyaan").value=$(this).data('title');
		window.document.getElementById("modalminrating").value=$(this).data('minrating');
		window.document.getElementById("modalmaxrating").value=$(this).data('maxrating');
		$('#modalcenter').modal('show');
	});
	
	
	
	$('#table').on('click','.hapus_record',function(){
		var idujian=$(this).data('idujian');
		var idsurvey=$(this).data('idsurvey');
		Swal.fire({
        title: "Apakah Anda Yakin?",
        text: "Pertanyaan Quisioner Akan dihapus",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Hapus!",
        closeOnConfirm: false
		}).then((result)=>{
		
		if (result.value){
		
		$.ajax({
            url: base_url+"public/ujian/hapusquisoner",
            type: "POST",
            data: {
                "idujian": idujian,
				"idsurvey":idsurvey
            },
            dataType: "html",
            success: function (response) {
				
				if (response == "success") {
					Swal.fire({
                    type: 'success',
                    title: 'SUKSES',
                    text: 'Quisioner Berhasil DIHAPUS!',
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
	
	
	
});