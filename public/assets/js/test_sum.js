$(document).ready(function() {
	if (location.host == 'localhost') {
	var base_url = window.location.origin+"/live_oltest/";
	}
	else{
		var base_url = window.location.origin+"/";
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
						{"data": "jumlah_eksekusi",width:50}
						
						
                       
						
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
	
	
	var json="";
	
	$.ajax({
				url: base_url+"public/test/getquisoner",  
				type: "POST",
				data: {
                  "idujian": idujian
				},
				
				success:function(response){
				Survey
				.StylesManager
				.applyTheme("modern");
                window.survey = new Survey.Model(JSON.parse(response));
				survey
				.onComplete
				.add(function (result) {
					//alert(JSON.stringify(result.data));
                
					$.ajax({
					url: base_url+"public/test/simpanjawabanquisioner",  
					type: "POST",
					data: {
					"idujian": idujian,
					"data":JSON.stringify(result.data)
					},
				    success:function(response){
						
				 console.log(response);
						
					},
					error:function(response){

                
                  console.log(response);

					}
				
					});
					
					
				
				});

				$("#surveyElement").Survey({model: survey});
                console.log(response);

              },
			  error:function(response){

                
                  console.log(response);

              }
				
		});
	
	
	
	/* survey.onComplete.add(function (sender, options) {
    //Show message about "Saving..." the results
    options.showDataSaving();//you may pass a text parameter to show your own text
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "YourServiceForStoringSurveyResultsURL");
    xhr.setRequestHeader("Content-Type", "application/json; charset=utf-8");
    xhr.onload = xhr.onerror = function () {
        if (xhr.status == 200) {
            options.showDataSavingSuccess(); // you may pass a text parameter to show your own text
            // Or you may clear all messages:
            // options.showDataSavingClear();
        } else {
            //Error
            options.showDataSavingError(); // you may pass a text parameter to show your own text
        }
    };
    xhr.send(JSON.stringify(sender.data));
	}); */
	
	
	
	
	

})
