$(document).ready(function() {
		if (location.host == 'localhost') {
	var base_url = window.location.origin+"/live_oltest/";
	}
	else{
		var base_url = window.location.origin;
	}
	
	var idujian=localStorage.getItem('idujian');
	idujian=idujian.replace('"',"");
	idujian=idujian.replace('"',"");
	
var table = $('#table').DataTable({
		"dom": '<"top"Bf>rt<"bottom"lp><"clear">',
                    "processing": true, //Feature control the processing indicator.
                   
                    "order": [], //Initial no order.
                    // Load data for the table's content from an Ajax source
                    "ajax": {
                        "url": base_url+'public/test/getsummaryujian',
                        "type": "POST",
						"data":function ( d ) {
							d.idujian=idujian
							
						}
						
						,dataSrc:""
                    },
					 "columns": [
                        {"data": "pertanyaan",width:200},
                        {"data": "jawaban",width:200},
						{"data": "output_jawaban",width:200},
						{"data": "status_jawaban",width:50},
						{"data": "waktu_pengerjaan",width:50},
						{"data": "CONTENT_ANALIS_JAWAB",width:50}
						
                       
						
						],
						 columnDefs: [ {
						targets: 0,
						render: $.fn.dataTable.render.ellipsis( 50, true )
						},{
						targets: 1,
						render: $.fn.dataTable.render.ellipsis( 50,true )	
							
						},{
						targets: 2,
						render: $.fn.dataTable.render.ellipsis( 50,true )	
							
						} ], 
						
						"initComplete": function() {
						$("#table").show();
						},
						"buttons": [ 'copy', 'csv', 'excel', 'pdf', 'print']
						
		
		
	});
	table.buttons().container()
        .appendTo( '#table_wrapper .col-auto:eq(0)' );	
	
	$("#kembali").click(function(){
		localStorage.clear();
		location.replace(base_url+"public/dashboard");
	});

})
