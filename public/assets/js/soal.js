$(document).ready(function() {
  	if (location.host == 'localhost') {
	var base_url = window.location.origin+"/live_oltest/";
	}
	else{
		var base_url = window.location.origin+"/";
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
  
  
	var editor2 = ace.edit("editor2");
      editor2.setFontSize(12);
      editor2.setTheme("ace/theme/eclipse");
      editor2.session.setMode("ace/mode/java");
      ace.require("ace/ext/language_tools");
	  editor2.setShowPrintMargin(false);
      //Wrap automatically, set to off
      editor2.setOption("wrap", "free");
      editor2.setOptions({
        enableBasicAutocompletion: true,
        enableSnippets: true,
        enableLiveAutocompletion: true
      });  
	  
	editor.session.on('change', function(delta) {
     editor2.setValue(editor.getValue());
	});  
	
	var table = $('#table').DataTable({
		"dom": '<"top"Bf>rt<"bottom"lp><"clear">',
                    "processing": true, //Feature control the processing indicator.
                   
                    "order": [], //Initial no order.
                    // Load data for the table's content from an Ajax source
                    "ajax": {
                        "url": base_url+'public/ujian/getpertanyaan',
                        "type": "POST",
						"data":function ( d ) {
							d.idujian= $("#dropdownnamaujian").children("option:selected").val()
							
						}
						
						,dataSrc:""
                    },
					 "columns": [
                        {"data": "nama_ujian",width:100},
                        {"data": "pertanyaan",width:200},
						{"data": "template_jawab",width:200},
						{"data": "ekspektasi_jawaban",width:100},
                       
						{ "render": function ( data, type, row ){
							var html  ="<a href=\"javascript:void(0);\" class=\"show_record btn btn-info btn-xs btn-sm\" data-ekspektasijawaban=\""+row["ekspektasi_jawaban"]+"\" data-idujian=\""+row["id_ujian"]+"\" data-idpertanyaan=\""+row["id_pertanyaan"]+"\" data-pertanyaan=\""+row["pertanyaan"]+"\" data-templatejawaban=\""+row["template_jawab"]+"\" >SHOW</a> "
							html  +="<a href=\"javascript:void(0);\" class=\"edit_record btn btn-info btn-xs btn-sm\" data-ekspektasijawaban=\""+row["ekspektasi_jawaban"]+"\" data-idujian=\""+row["id_ujian"]+"\" data-idpertanyaan=\""+row["id_pertanyaan"]+"\" data-pertanyaan=\""+row["pertanyaan"]+"\" data-templatejawaban=\""+row["template_jawab"]+"\">EDIT</a> "
							  html  += "<a href=\"javascript:void(0);\" class=\"hapus_record btn btn-danger btn-xs btn-sm\" data-idujian=\""+row["id_ujian"]+"\" data-idpertanyaan=\""+row["id_pertanyaan"]+"\">DELETE</a>" 
								
								return html

							
						},width:100}
						],
						 columnDefs: [ {
						targets: 1,
						render: $.fn.dataTable.render.ellipsis( 100, true )
						},{
						targets: 2,
						render: $.fn.dataTable.render.ellipsis( 40 )	
							
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
		editor.setValue("");
		editor2.setValue("");
		window.document.getElementById("modalidujian").value=$("#dropdownnamaujian").
		children("option:selected").val();
		window.document.getElementById("savemodal").style.display = "block";
		window.document.getElementById("pertanyaan").value="";
		window.document.getElementById("cobajawabanoutput").value="";
		window.document.getElementById("ekspektasijawaban").value="";
		
		var autoisi="public class Main {\n\tpublic static void main(String[] args) {\n\t//baris atas jangan dihapus\n\n\n\n\t//baris bawah jangan dihapus\n\t}\n}";
		editor.setValue(autoisi);
		$('#modalcenter').modal('show');
		
		}
		
	}
	);
	
	
	
	
	$("#savemodal").click( function() {
		
		
		$.ajax({
            url: base_url+"public/ujian/savepertanyaan",
            type: "POST",
            data: {
				"idujian":window.document.getElementById("modalidujian").value,
				"idpertanyaan":window.document.getElementById("modalidpertanyaan").value,
				"pertanyaan":window.document.getElementById("pertanyaan").value,
				"templatejawaban":editor.getValue(),
				"ekspektasijawaban":window.document.getElementById("ekspektasijawaban").value
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
	
	
	$("#dropdownnamaujian").change( function() {
		
		 $('#table').DataTable().ajax.reload();
		 
		 
		 
	});
	
	
	$('#table').on('click','.show_record',function(){
		var idujian=$(this).data('idujian');
		var idpertanyaan=$(this).data('idpertanyaan');
		var pertanyaan=$(this).data('pertanyaan');
		var templatejawaban=$(this).data('templatejawaban');
		var ekspektasijawaban=$(this).data('ekspektasijawaban');
		window.document.getElementById("modalidujian").value=idujian;
		window.document.getElementById("modalidpertanyaan").value=idpertanyaan;
		window.document.getElementById("ekspektasijawaban").value=ekspektasijawaban;
		
		window.document.getElementById("judulmodal").innerHTML  ="Pertanyaan Ujian";
		editor.setValue(templatejawaban);
		editor2.setValue(templatejawaban);
		window.document.getElementById("pertanyaan").value=pertanyaan;
		window.document.getElementById("savemodal").style.display = "none";
		
		window.document.getElementById("cobajawabanoutput").value="";
		$('#modalcenter').modal('show');
		
		
	});
	
	
	$('#table').on('click','.edit_record',function(){
		var idujian=$(this).data('idujian');
		var idpertanyaan=$(this).data('idpertanyaan');
		var pertanyaan=$(this).data('pertanyaan');
		var templatejawaban=$(this).data('templatejawaban');
		var ekspektasijawaban=$(this).data('ekspektasijawaban');

		window.document.getElementById("modalidujian").value=idujian;
		window.document.getElementById("modalidpertanyaan").value=idpertanyaan;
		window.document.getElementById("ekspektasijawaban").value=ekspektasijawaban;
		
		window.document.getElementById("judulmodal").innerHTML  ="Pertanyaan Ujian";
		editor.setValue(templatejawaban);
		editor2.setValue(templatejawaban);
		window.document.getElementById("pertanyaan").value=pertanyaan;
		window.document.getElementById("savemodal").style.display = "block";
		window.document.getElementById("cobajawabanoutput").value="";
		
		$('#modalcenter').modal('show');
		
		
	});
	
	$('#table').on('click','.hapus_record',function(){
		var idujian=$(this).data('idujian');
		var idpertanyaan=$(this).data('idpertanyaan');
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
            url: base_url+"public/ujian/hapuspertanyaan",
            type: "POST",
            data: {
                "idujian": idujian,
				"idpertanyaan":idpertanyaan
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
	
	$("#cobajawab").click( function() {
		
		
		$.ajax({
            url: base_url+"public/ujian/cobapertanyaan",
            type: "POST",
            data: {
				"kode":editor2.getValue(),
				"input":window.document.getElementById("cobajawabaninput").value
				
            },
            dataType: "html",
            success: function (response) {
				
				window.document.getElementById("cobajawabanoutput").value=response;
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