jQuery(function ($) { // more elegant way of doing this?
    $('#annotation_text').annotator().annotator('addPlugin', 'Tags');
    
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