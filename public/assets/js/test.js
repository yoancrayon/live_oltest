$(document).ready(function() {
	if (location.host == 'localhost') {
	var base_url = window.location.origin+"/live_oltest/";
	}
	else{
		var base_url = window.location.origin;
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
	  var noaktif=1;
	  timedCount();
	  
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
	   $(".btn").removeClass("btn-success");
	   item.className +=" btn-success"
	   noaktif=item.innerHTML;
	   
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
		
		
		
	});
	
	
	
	
	function simpanjawaban()
	{
		
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
		
		
		
		
		
		
	}
	
  
});


function disableF5(e) { if ((e.which || e.keyCode) == 116) e.preventDefault(); };
$(document).on("keydown", disableF5);
