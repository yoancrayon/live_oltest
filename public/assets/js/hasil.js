$(document).ready(function() {
	if (location.host == 'localhost') {
	var base_url = window.location.origin+"/live_oltest/";
	}
	else{
		var base_url = window.location.origin;
	}
	
	var kjenisuser=localStorage.getItem("kjenisuser");
	kjenisuser=kjenisuser.replace('"',"");
	kjenisuser=kjenisuser.replace('"',"");
	localStorage.clear();
	
	
	if (kjenisuser=="3") {
		
		$("#flushnilai").hide();
	}
	
	ace.config.set("basePath", base_url+"public/assets/js/ace");
	ace.require("ace/ext/language_tools");
	var editor = ace.edit("editor");
      editor.setFontSize(12);
      editor.setTheme("ace/theme/eclipse");
      editor.session.setMode("ace/mode/java");
      ace.require("ace/ext/language_tools");
	  editor.setShowPrintMargin(false);
      //Wrap automatically, set to off
      editor.setOption("wrap", "free");
      editor.setOptions({
        enableBasicAutocompletion: true,
        enableSnippets: true,
        enableLiveAutocompletion: true
      });
	  editor.container.style.pointerEvents="none";
	  editor.container.style.opacity=0.8; // or use svg filter to make it gray
	  editor.renderer.setStyle("disabled", true);
	 editor.blur();
	
	
	$("#dropdownnamaujian").change( function() {
		var idujian=$(this).children("option:selected").val();
		var opthtml="";
		if (kjenisuser!="3") {
		$.ajax({
				url: base_url+"public/ujian/getpeserta",  
				type: "POST",
				data: {
                  "idujian": idujian
				},
				dataType: "json",
				success:function(response){
				document.getElementById("dropdownpeserta").innerHTML = "";	
				opthtml += '<option value="x">Seluruh Peserta</option>';
				for (var i = 0; i < response.length; i++){
				
				opthtml += '<option value="'+response[i].username_peserta+'">'+response[i].nama+'</option>';
				}
				
				 $('#dropdownpeserta').append(opthtml);
					
				},
				error:function(response){
                  console.log(response);
              }
				
		});
		}
		table.ajax.reload();
		
 
	});
	
	$("#dropdownpeserta").change( function() {
		table.ajax.reload();
	});
	

	var table = $('#table').DataTable({
		"dom": '<"top"Bf>rt<"bottom"lp><"clear">',
                    "processing": true, //Feature control the processing indicator.
                   
                    "order": [], //Initial no order.
                    // Load data for the table's content from an Ajax source
                    "ajax": {
                        "url": base_url+'public/ujian/gethasilujian',
                        "type": "POST",
						"data":function ( d ) {
							d.idujian= $("#dropdownnamaujian").children("option:selected").val(),
							d.username= $("#dropdownpeserta").children("option:selected").val()
							
							
						}
						
						,dataSrc:""
                    },
					 "columns": [
                        {"data": "nama_ujian",width:100},
						{"data": "nama",width:100},
                        {"data": "pertanyaan",width:100},
						{"data": "jawaban",width:100},
						{"data": "output_jawaban",width:100},
						{"data": "status_jawaban",width:100},
						{"data": "waktu_pengerjaan",width:100},
						{"data": "jumlah_eksekusi",width:50},
						{"data": "CONTENT_ANALIS_JAWAB",width:50},
						{"data": "nilai_jawab",width:50},
                       
						{ "render": function ( data, type, row ){
							var html  ="<a href=\"javascript:void(0);\" class=\"show_record btn btn-info btn-xs btn-sm\"  data-idujian=\""+row["id_ujian"]+"\" data-idpertanyaan=\""+row["id_Pertanyaan"]+"\"  data-username=\""+row["username"]+"\"  >SHOW</a> "
							
								
								return html

							
						},width:50}
						],
						 columnDefs: [ {
						targets: 2,
						render: $.fn.dataTable.render.ellipsis( 50, true )
						},{
						targets: 3,
						render: $.fn.dataTable.render.ellipsis( 50,true )	
							
						},{
						targets: 4,
						render: $.fn.dataTable.render.ellipsis( 50,true )	
							
						} ], 
						
						"initComplete": function() {
						$("#table").show();
						},
						"buttons": [ 'copy', 'csv', 'excel', 'pdf', 'print']
						
		
		
	});
	
	$('#table').on('click','.show_record',function(){
		var idujian=$(this).data('idujian');
		var idpertanyaan=$(this).data('idpertanyaan');
		var username=$(this).data('username');

		window.document.getElementById("inputidujian").value=idujian;
		window.document.getElementById("inputidpertanyaan").value=idpertanyaan;
		window.document.getElementById("inputusername").value=username;
		
		
		
		
		$.ajax({
				url: base_url+"public/ujian/gethasilujianspecific",  
				type: "POST",
				data: {
                  "idujian": idujian,
				  "idpertanyaan":idpertanyaan,
				  "usename":username
				},
				dataType: "json",
				success:function(response){
				
				
				window.document.getElementById("pertanyaan").value=response[0].pertanyaan;
				window.document.getElementById("jawabanoutput").value=response[0].output_jawaban;
				editor.setValue(response[0].jawaban);
				window.document.getElementById("nilai").value=response[0].nilai_jawab;
				},
				error:function(response){
                  console.log(response);
              }
				
		});
		
		
		$('#modalcenter').modal('show');
		
		
	});
	
	$("#flushnilai").click(function(){
		if ($("#dropdownnamaujian").children("option:selected").val()=="x")
		{
			Swal.fire({
                    type: 'error',
                    title: 'Opps!',
                    text: 'Nama Ujian tidak Boleh Seluruh!'
                  });
			
		}
		else{
			var idujian=$("#dropdownnamaujian").children("option:selected").val();
			
			
			$.ajax({
            url: base_url+"public/ujian/flushnilai",
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
                    text: 'FLUSH NILAI BERHASIL, DATA YANG BUTUH PERHATIAN DOSEN TIDAK DI FLUSH!',
                    timer: 5000,
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
    
	$("#simpannilai").click(function(){
		var idujian=window.document.getElementById("inputidujian").value;
		var idpertanyaan=window.document.getElementById("inputidpertanyaan").value;
		var username=window.document.getElementById("inputusername").value;
		var nilai=window.document.getElementById("nilai").value;
		
		$.ajax({
            url: base_url+"public/ujian/updatenilai",
            type: "POST",
            data: {
                "idujian": idujian,
				"idpertanyaan":idpertanyaan,
				"username":username,
				"nilai":nilai
            },
            dataType: "html",
            success: function (response) {
				
				if (response == "success") {
					Swal.fire({
                    type: 'success',
                    title: 'SUKSES',
                    text: 'Nilai Berhasil Disimpan!!',
                    timer: 800,
                    showCancelButton: false,
                    showConfirmButton: false
                  })
                  .then (function() {
                     $('#table').DataTable().ajax.reload();
					
					 Swal.close();
					  $('#modalcenter').modal('hide');
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

