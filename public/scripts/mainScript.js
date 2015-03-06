jQuery(function ($) { // more elegant way of doing this?
	



	window.onload = init;
    //$('#annotation_text').annotator().annotator('addPlugin', 'Tags');
    
    /* -- store does not work (no local store and I probably wont install one)
    $('#annotation_text').annotator('addPlugin', 'Store', {
	  urls: {
	    // These are the default URLs.
	    create:  '/createAnnotation',
	    update:  '/updateAnnotation:id',
	    destroy: '/deleteAnnotation:id'
	    //search:  '/search'
	  }
	}); */


	function init() {
		if (window.Event) {
			document.captureEvents(Event.MOUSEMOVE);
		}
		document.onmousemove = getCursorXY;	    
	}
	function getCursorXY(e) {
		xpos = (window.Event) ? 
			e.pageX : event.clientX +
				(document.documentElement.scrollLeft ? 
					document.documentElement.scrollLeft : document.body.scrollLeft);
		ypos = (window.Event) ?
			e.pageY : event.clientY + 
				(document.documentElement.scrollTop ? 
					document.documentElement.scrollTop : document.body.scrollTop);
		console.log(xpos,ypos);
  		//e1 = document.getElementById('ttit'); e1.style.top = (ypos+10)+"px"; e1.style.left = (xpos+10)+"px";
		//e2 = document.getElementById('ttip'); e2.style.top = (ypos+10+24)+"px"; e2.style.left = (xpos+10)+"px";
    }





	//Document Upload
	$("#uploadDoc").click(function(e){
	    if (confirm("Accepted extensions: .txt") == false) e.preventDefault();
	});

	$("#uploadDoc").change(function(e){
	    uploadDocument(this);
	});//change

	uploadDocument = function(scope){
	    
	    var docFound = false;
	    var files = scope.files;
	    var stop=false;
	    var groupId = $(".uploadDocument").data("group");
	    console.log(groupId);
	        
	    function findDocument(file){
	        console.log("uploadingDocument");
	        file.ext = (file.name.substring(file.name.lastIndexOf('.') + 1)).toLowerCase();
	        file.fname = (file.name.substring(0, file.name.lastIndexOf('.'))).toLowerCase();
	        if(/*file.ext == "doc" || file.ext == "docx" || */file.ext == "txt"){
	            var reader = new FileReader();
	            reader.onload = function(e) {
	                console.log("reader onload");
	                file.fileText = e.target.result;
	                sendDocument(file);
	            };
	            reader.readAsDataURL(file);
	        }else alert("unsupported filetype, please use .txt");
	    }
	    function sendDocument(file){
	    	console.log("sending");
	        $.ajax({
	            type: "POST",
	            data: {file: file.fileText, filetype: file.ext, name: file.fname, group:groupId},
	            url: "docUpload",
	            success: function(data){
	                window.location.href = 'home';
	                console.log("Document upload successful",data);
	                alert("Document upload successful");
	            },
	            error: function(data){
	                alert("upload failed: "+data.message);
	                console.log("upload failed: ",data);
	            }
	        });//ajax
	    }
	    console.log("files", files);
	    for (var i=0;i<files.length;i++){
	        if (files.length > 0) files[i].linked = true;
	        if (stop) break;
	        findDocument(files[i]);
	        console.log("The file is being uploaded");
	    }//for

	}



	function sendDocuments(file){
		console.log("sending");
	    $.ajax({
	        type: "POST",
	        data: {file: file.fileText, filetype: file.ext, name: file.fname, group:groupId},
	        url: "docUpload",
	        success: function(data){
	            window.location.href = 'home';
	            console.log("Document upload successful",data);
	            alert("Document upload successful");
	        },
	        error: function(data){
	            alert("upload failed: "+data.message);
	            console.log("upload failed: ",data);
	        }
	    });//ajax
	}
});