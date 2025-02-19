$(document).ready(function() {
	if (location.host == 'localhost') {
	var base_url = window.location.origin+"/live_oltest/";
	}
	else{
		var base_url = window.location.origin+"/";
	}
	
	
	$(window).bind("beforeunload",function(event) {
    return "Anda tidak akan dapat mengulangi ujian ini";
	});
	

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
        enableBasicAutocompletion: false,
        enableSnippets: true,
        enableLiveAutocompletion: false
      });
	  editor.onPaste = function() { return ""; }
	  editor.commands.addCommand({
		name: "breakTheEditor", 
		bindKey: "ctrl-c|ctrl-v|ctrl-x|ctrl-shift-v|shift-del|cmd-c|cmd-v|cmd-x", 
		exec: function() {} 
		});
	  !["dragenter", "dragover", "dragend", "dragstart", "dragleave", "drop"
		].forEach(function(eventName) {
		editor.container.addEventListener(eventName, function(e) {
        e.stopPropagation()
		}, true)
		});
		editor.setOption("dragEnabled", false);	
		
	  var c=window.document.getElementById("durasiujian").value*60;
	  
	  
	  
	  var jsonString = localStorage.getItem("myServerData");
      var serverdataObject = JSON.parse(jsonString);

	  window.document.getElementById("soalke").innerHTML="Soal "+serverdataObject[0].no_urut; 
	  window.document.getElementById("pertanyaan").innerHTML=serverdataObject[0].pertanyaan;
	  editor.setValue(serverdataObject[0].template_jawab);
	  serverdataObject[0].initialtime=new Date();
	  serverdataObject[0].counter=0;
	  serverdataObject[0].is_simpan=false;
	  var noaktif=1;
	  timedCount();
	  $("#simpanjawaban").prop( "disabled", true );
    function timedCount()
	{
		var hours = parseInt( c / 3600 ) % 24;
		var minutes = parseInt( c / 60 ) % 60;
		var seconds = c % 60;
		var result = (hours < 10 ? "0" + hours : hours) + ":" + (minutes < 10 ? "0" + minutes : minutes) + ":" + (seconds  < 10 ? "0" + seconds : seconds);            
		$('#timer').html(result);
		
		if(c == 0 )
		{
				
					$('#iTimeShow').html('Quiz Time Completed!');
					waktuhabis();
					return false;
					
		}
		
		
		c = c - 1;
		t = setTimeout(function()
		{
			timedCount()
		},1000);
	}
	  
	 //alert($('.active').html()) 
	
	  
	 document.querySelectorAll('#btnnourut').forEach(item => {
		item.addEventListener('click', event => {
	  serverdataObject[noaktif-1].counter=totalSeconds;
	  window.document.getElementById("soalke").innerHTML="Soal "+serverdataObject[item.innerHTML-1].no_urut; 
	  window.document.getElementById("pertanyaan").innerHTML=serverdataObject[item.innerHTML-1].pertanyaan;
	  editor.setValue(serverdataObject[item.innerHTML-1].template_jawab);
	  
	  if (!serverdataObject[item.innerHTML-1].hasOwnProperty('is_simpan')){
		  serverdataObject[item.innerHTML-1].is_simpan=false;
	  }
	  //tulis jawaban kalau sudah pernah jawab dan hasilnya
	 if (serverdataObject[item.innerHTML-1].hasOwnProperty('jawaban')){
		  //serverdataObject[item.innerHTML-1].is_simpan=false;
		  editor.setValue(serverdataObject[item.innerHTML-1].jawaban);
		  window.document.getElementById("text-output").value=serverdataObject[item.innerHTML-1].outputjawab;
	  }
	  else {
		  window.document.getElementById("text-output").value="";
		  
		  
	  }
		  
		  
		 /*disable enable button*/ 
	   $(".btn").removeClass("btn-success");
	   if(!serverdataObject[item.innerHTML-1].is_simpan) {
	   item.className +=" btn-success"
	   $( "#runcode" ).prop( "disabled", false );
		$("#simpanjawaban").prop( "disabled", true );
		$("#resetcode").prop( "disabled", false );
		$("#minutes").show();
		$("#seconds").show();
		$("#titik").show();
		$("#minutesselesai").hide();
		$("#secondsselesai").hide();
		$("#titikselesai").hide();
		
	   }
	   else{
		console.log(serverdataObject[item.innerHTML-1].is_simpan);
		$( "#runcode" ).prop( "disabled", true );
		$("#simpanjawaban").prop( "disabled", true );
		$("#resetcode").prop( "disabled", true );
		$("#minutes").hide();
		$("#seconds").hide();
		$("#titik").hide();
		document.getElementById("secondsselesai").innerHTML= pad(serverdataObject[item.innerHTML-1].timer % 60);
		document.getElementById("minutesselesai").innerHTML=pad(parseInt(serverdataObject[item.innerHTML-1].timer / 60));
		$("#minutesselesai").show();
		$("#secondsselesai").show();
		$("#titikselesai").show();
		   
	   }
	   


	  noaktif=item.innerHTML;
	  
	  
	  //disable enable tombol akhiri
	   if (serverdataObject.length==noaktif)
	  {$("#akhirujian").show();}
		else
		{$("#akhirujian").hide();}
	   
	   
	   if (!serverdataObject[item.innerHTML-1].hasOwnProperty('initialtime')){
	   
		serverdataObject[item.innerHTML-1].initialtime=new Date();
		serverdataObject[item.innerHTML-1].counter=0;
	   }
	   totalSeconds=serverdataObject[item.innerHTML-1].counter;
		console.log(serverdataObject);
				
		})
	});
	
	
	
	var minutesLabel = document.getElementById("minutes");
	var secondsLabel = document.getElementById("seconds");
	var titikLabel = document.getElementById("titik");
	var totalSeconds = 0;
	setInterval(setTime, 1000);
	
	function setTime() {
	++totalSeconds;
	secondsLabel.innerHTML = pad(totalSeconds % 60);
	minutesLabel.innerHTML = pad(parseInt(totalSeconds / 60));
	}

	function pad(val) {
	var valString = val + "";
	if (valString.length < 2) {
    return "0" + valString;
	} else {
    return valString;
		}
	}
	
	$("#resetcode").click( function() {
	editor.setValue(serverdataObject[noaktif-1].template_jawab);
	});
	
	$("#runcode").click( function() {
		
		
		$.ajax({
            url: base_url+"public/test/runcode",
            type: "POST",
            data: {
				"kode":editor.getValue(),
				"input":window.document.getElementById("inputcode").value
				
            },
            dataType: "html",
            success: function (response) {
				
				window.document.getElementById("text-output").value=response;
                console.log(response);
				simpanjawaban()
				$("#simpanjawaban").prop( "disabled", false );
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
	
	
	$("#simpanjawaban").click( function() {
		
		serverdataObject[noaktif-1].is_simpan=true;
		
		$('button').filter(function() {
		var searchString = noaktif;
		return ($(this).html().substring(0, searchString.length) == searchString);
		}).addClass('btn-danger');
		
		$( "#runcode" ).prop( "disabled", true );
		$("#simpanjawaban").prop( "disabled", true );
		$("#resetcode").prop( "disabled", true );
		
		$("#minutes").hide();
		$("#seconds").hide();
		$("#titik").hide();
		
		document.getElementById("secondsselesai").innerHTML= pad(serverdataObject[noaktif-1].timer % 60);
		document.getElementById("minutesselesai").innerHTML=pad(parseInt(serverdataObject[noaktif-1].timer / 60));
		$("#minutesselesai").show();
		$("#secondsselesai").show();
		$("#titikselesai").show();
		
	});
	
	
	
	
	function simpanjawaban()
	{
		serverdataObject[noaktif-1].jawaban=editor.getValue();
		serverdataObject[noaktif-1].inputjawaban=window.document.getElementById("inputcode").value;
		serverdataObject[noaktif-1].outputjawab=window.document.getElementById("text-output").value;
		serverdataObject[noaktif-1].timer=totalSeconds;
		serverdataObject[noaktif-1].countdown_timer=c;
		var logjawab={};
		logjawab.jawaban=editor.getValue();
		logjawab.inputjawaban=window.document.getElementById("inputcode").value;
		logjawab.outputjawab=window.document.getElementById("text-output").value;
		logjawab.timer=totalSeconds;
		logjawab.countdown_timer=c;
		
		
		  if (!serverdataObject[noaktif-1].hasOwnProperty('logjawab')){
			  var arrlogjawab=[];
			arrlogjawab.push(logjawab);
			  serverdataObject[noaktif-1].logjawab=arrlogjawab;
		  }
		  else 
		  {
			  serverdataObject[noaktif-1].logjawab.push(logjawab);
	  
		  }
		
		//console.log(serverdataObject);
		$.ajax({
            url: base_url+"public/test/simpanjawaban",
            type: "POST",
            data: {
				
				"idpertanyaan":serverdataObject[noaktif-1].id_pertanyaan,
				"jawaban":editor.getValue(),
				"inputjawaban":window.document.getElementById("inputcode").value,
				"outputjawab":window.document.getElementById("text-output").value,
				"initialtime":serverdataObject[noaktif-1].initialtime.getFullYear()+"-"+("0" + (serverdataObject[noaktif-1].initialtime.getMonth() + 1)).slice(-2)+"-"+("0" + serverdataObject[noaktif-1].initialtime.getDate()).slice(-2)+ " " +serverdataObject[noaktif-1].initialtime.getHours()+":"+serverdataObject[noaktif-1].initialtime.getMinutes()+":"+serverdataObject[noaktif-1].initialtime.getSeconds(),
				"intimer":totalSeconds,
				"incountdown_timer":c
				
            },
            dataType: "html",
            success: function (response) {
				
				//window.document.getElementById("text-output").value=response;
                console.log(response);
            },
            error:function(response){

                console.log(response);

              }
        });	
		
		
		console.log(serverdataObject);
		
		
		
	}
	
	$("#akhirujian").click( function() {
		
		
		Swal.fire({
        title: "Apakah Anda Yakin?",
        text: "Apakah anda yakin untuk mengakhiri ujian sekarang?",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Akhiri!",
        closeOnConfirm: false
		}).then((result)=>{
			
			if (result.value){
				
			akhiriujian( );
			}
			
		});
		
		
	});
	
	
	
	function waktuhabis()
	{
		Swal.fire({
                    type: 'success',
                    title: 'Waktu Habis',
                    text: 'Ujian Telah Berakhir',
                    timer: 5000,
                    showCancelButton: false,
                    showConfirmButton: false,
					allowOutsideClick: false
                  })
                  .then (function() {
                     
					 Swal.close();
					 akhiriujian( );
					 
                  });
		
		
		
	}
	
	
	function akhiriujian( )
	{
	
		
		
		
		
		
		$.ajax({
            url: base_url+"public/test/finalize",
            type: "POST",
            data: {"json":JSON.stringify(serverdataObject)
				},
            dataType: "html",
            success: function (response) {
				
				if (response == "success") {
					Swal.fire({
                    type: 'success',
                    title: 'SUKSES',
                    text: 'Anda Akan di-Redirect dalam 3 detik',
                    timer: 3000,
                    showCancelButton: false,
                    showConfirmButton: false,
					allowOutsideClick: false
                  })
                  .then (function() {
					 
					 $(window).off("beforeunload");
					 window.onbeforeunload = null;
					 window.onbeforeunload = undefined;
					 localStorage.removeItem("myServerData");
					 window.location.replace(base_url+"public/test/summaritest");
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
				
               
			   
			   
            },
            error:function(response){

                Swal.fire({
                    type: 'error',
                    title: 'Opps!',
                    text: 'server error!'
                  });

              }
        });	
		
	}
	
  
});


function disableF5(e) { if ((e.which || e.keyCode) == 116) e.preventDefault(); };
$(document).on("keydown", disableF5);



/* $( "div:contains('John')" ).css( "text-decoration", "underline" ); */

 
