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
        enableSnippets: false,
        enableLiveAutocompletion: false
      });
	  
	  var c=window.document.getElementById("durasiujian").value*60;
	  
	  timedCount();
	  
	  var jsonString = localStorage.getItem("myServerData");

	 var serverdataObject = JSON.parse(jsonString);

     console.log(serverdataObject);
	  
	  window.document.getElementById("soalke").innerHTML="Soal "+serverdataObject[0].no_urut; 
	  window.document.getElementById("pertanyaan").innerHTML=serverdataObject[0].pertanyaan;
	  editor.setValue(serverdataObject[0].template_jawab);
	  
	  var noaktif=1;
	  
	  
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
    //handle click
	//	alert(item.innerHTML); 
		window.document.getElementById("soalke").innerHTML="Soal "+serverdataObject[item.innerHTML-1].no_urut; 
	  window.document.getElementById("pertanyaan").innerHTML=serverdataObject[item.innerHTML-1].pertanyaan;
	  editor.setValue(serverdataObject[item.innerHTML-1].template_jawab);
	   $(".btn").removeClass("btn-success");
	   item.className +=" btn-success"
	   var noaktif=item.innerHTML;
	
	console.log(item.innerHTML);
		})
	}); 
  
});