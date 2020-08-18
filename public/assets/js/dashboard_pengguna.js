$(document).ready(function() {
	var base_url = window.location.origin;
	var host = window.location.host;
	var pathArray = window.location.pathname.split( '/' );
	var e = document.getElementById("inputGroupSelect02");
	var kjenisuser = e.options[e.selectedIndex].value;
	
	table = $('#table').DataTable({ 
                    "processing": true, //Feature control the processing indicator.
                    "serverSide": true, //Feature control DataTables' server-side processing mode.
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
                        {"data": "username",width:100},
                        {"data": "nama",width:150},
						{"data": "k_jenis_user",width:100},
                        {"data": "jenis_user",width:100}
                    ],
					"columnDefs": [
					{
					"targets": [ 2 ],
						"visible": false,
						"searchable": false
					}],

                });
});