$(document).ready(function() {
	var base_url = window.location.origin;
	var host = window.location.host;
	var pathArray = window.location.pathname.split( '/' );
	var e = document.getElementById("inputGroupSelect02");
	var kjenisuser = e.options[e.selectedIndex].value;
	
	var table = $('#table').DataTable({
	
					"dom": '<"top"Bf>rt<"bottom"lp><"clear">',
                    "processing": true, //Feature control the processing indicator.
                   
                    "order": [], //Initial no order.
                    // Load data for the table's content from an Ajax source
                    "ajax": {
                        "url": 'http://localhost/live_oltest/public/dashboard/penggunalist',
                        "type": "POST",
						"data": {
							'k_jenis_user': kjenisuser
							
						}
						,dataSrc:""
                    },
                    //Set column definition initialisation properties.
                    "columns": [
                        {"data": "username",width:30},
                        {"data": "nama",width:150},
						{"data": "k_jenis_user",width:10},
                        {"data": "jenis_user",width:100},
						{ "render": function ( data, type, row ){
							 var html  = "<a href=''>EDIT</a> | "
								html += "<a href=''>DELETE</a>"
								return html

							
						},width:100}
						
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
});