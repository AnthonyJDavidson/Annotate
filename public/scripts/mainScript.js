
var annotating = false;
window.onload = init;
var xpos = 0; var ypos = 0;
var text ="";
function getSelectionText() {
    if (window.getSelection) {
    	// console.log(window.getSelection());
        text = window.getSelection().toString();
    } else if (document.selection && document.selection.type != "Control") {
        text = document.selection.createRange().text;
    }
    return text;
}

function saveAnnotation(){
	console.log("Saving Annotation");
	annotating = false;
	$(".annotationTool").remove();
	if(window.getSelection().toString() != ""){
		//create new <p> with a span in the middle as the annotation
		var textElem = window.getSelection();
		var prevElemTag;
		var nextElemTag;
		if(textElem.baseNode.previousSibling){
			prevElemTag = textElem.baseNode.previousSibling.tagName;
		}else if(textElem.baseNode.nextSibling){
			nextElemTag = textElem.baseNode.nextSibling.tagName;
		}
	 	//  first annotation of paragraph
		var paragraphId = textElem.baseNode.parentElement.id;
		var pNextIdNum = parseInt(paragraphId.slice(-1)) + 1;

		//Old way, still might be relevant later
		//var textExtentOffset = textElem.extentOffset;
		//var textBaseOffset = textElem.baseOffset;

		var annotateText = textElem.toString();
		var oldPText = textElem.baseNode.parentNode.outerHTML;
		var ind = oldPText.indexOf(annotateText);
		var htmlHead = oldPText.substring(0,ind);
		annotateSpan = '<span class="annotation">'+annotateText+'</span>';
		var htmlTail = oldPText.substring(ind + annotateText.length,oldPText.length -1);
		var newHTML = htmlHead+annotateSpan+htmlTail;
		$('#annotation_text #'+paragraphId).remove();
		if ($('#annotation_text #paragraph'+pNextIdNum).length){
			$('#annotation_text #paragraph'+pNextIdNum).before(newHTML);
	    }else{
	    	pNextIdNum -= 2;
	    	$('#annotation_text #paragraph'+pNextIdNum).after(newHTML);
	    }
		
	}
	
}

function cancelAnnotation(){
	console.log("cancelAnn");
	annotating = false;
	$(".annotationTool").remove();
}

$(document).ready(function (){
	
 	$('#annotation_text').mouseup(function (){
   		text = getSelectionText();
   		if(text != "" && annotating == false){
   			annotating = true;
   			var iconYpos = (ypos+10)+"px";
   			var iconXpos = (xpos+10)+"px";
	   		$("#annotation_text").append('<div class="annotationTool" style="top:'+iconYpos+';left:'+iconXpos+';"><textarea id="annotationInput" rows="4" cols="30" >BLANK</textarea><br /><textarea id="annotationTag" rows="1" cols="30" >Tags</textarea><br /><button onclick="cancelAnnotation()" type="button" id="button" class="cancelAnn">Cancel</button><button onclick="saveAnnotation()" type="button" class="saveAnn">Save</button></div>');
   		}
   })
});

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