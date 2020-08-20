$(document).ready(function() {
	var table = $('#table').DataTable({
		"dom": '<"top"Bf>rt<"bottom"lp><"clear">',
                    "processing": true, //Feature control the processing indicator.
                   
                    "order": [], //Initial no order.
                    // Load data for the table's content from an Ajax source
                    "ajax": {
                        "url": 'http://localhost/live_oltest/public/ujian/listujian',
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
							 var html  = "<a href=\"javascript:void(0);\" class=\"edit_record btn btn-info btn-xs btn-sm\" data-idujian=\""+row["id_ujian"]+"\" >EDIT</a> "
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
		format: 'yyyy-mm-dd'
		
	});
	$("#modaltglselesai").datepicker({
		
		format: 'yyyy-mm-dd'
	});
	
	$('#newujian').click(function(){
		
		
		
		$('#modalcenter').modal('show');
		
		
	}
	);
	
	
});