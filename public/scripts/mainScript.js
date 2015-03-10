
var textElement;
var textElem;
var highlightedText ="";
var annotating = false;
window.onload = init;
var xpos = 0; var ypos = 0;
var text ="";
var textElemSet = false;
var iconYpos =0;
var iconXpos =0;


function refreshAnnotationJquery(){
	$('.annotation').mouseenter(function(){
        var annId = $(this).data("annotation");
        var ann_ann = $('.annotationL#'+annId+' .annotation_annotation').text();
        var tags = $('.annotationL#'+annId+' .annotation_Tag').text();
        console.log(annId,ann_ann,tags);
        $(this).after('<div class="aToolTip" style="top:'+(ypos+10)+'px;left:'+(xpos+10)+'px"><div class="aToolTip_ann">'+ann_ann+'</div><span class="aToolTip_tags">'+tags+'</span></div>');


    });
    $('.annotation').mouseout(function(){
    	$('.aToolTip').remove();
    });
}

function refreshCommentImgJquery(){
	$('#annotation_text #commentImg').mouseenter(function(){
        event.stopPropagation();
        $(this).css("background","#FFF500");
    });
    $('#annotation_text #commentImg').mouseleave(function(){
        event.stopPropagation();
        $(this).css("background","white");
    });

    $('#annotation_text #commentImg').mousedown(function(){
        event.stopPropagation();
        $(this).css("background","#4C55A8");
    });
    $('#annotation_text #commentImg').mouseup(function(){
        event.stopPropagation();
        if(textElement.baseNode)textElem = textElement.baseNode;
        $("#annotation_text .annotationTool").css("top",iconYpos);
        $("#annotation_text .annotationTool").css("left",iconXpos);
        $("#annotation_text .annotationTool").css("visibility","visible");
        $('#commentImg').remove();
    });
}
function highlightDocument(text,ann,paragraph,a_id){
    var oldPText = $('#'+paragraph)[0].outerHTML;
    var ind = oldPText.indexOf(text);
    var htmlHead = oldPText.substring(0,ind);
    var annotateSpan = '<span class="annotation" data-annotation='+a_id+'>'+text+'</span>';
    var htmlTail = oldPText.substring(ind + text.length,oldPText.length);
    var newHTML = htmlHead+annotateSpan+htmlTail;
    $('#annotation_text #'+paragraph).addClass("removeMe");
    $('#annotation_text #'+paragraph).before(newHTML);
    $('.removeMe').remove();
}
function loadAnnotations(){
    var annLists = $(".annotationL");
    console.log(annLists);
    for (var i = 0; i < annLists.length; i++) {
        console.log(annLists[i].id+ " loaded");
        var ann_text = $('#'+annLists[i].id+' .annotation_annotatedText').text();
        var ann_ann = $('#'+annLists[i].id+' .annotation_annotation').text();
        var ann_paragraph = $('#'+annLists[i].id).data("paragraph");
        highlightDocument(ann_text,ann_ann,ann_paragraph,annLists[i].id);
    }
     $('.removeMe').remove();
}

createToolTips = function(){
    var annList = $(".annotationL");
}

function init() {
    if (window.Event) {
        document.captureEvents(Event.MOUSEMOVE);
    }
    document.onmousemove = getCursorXY;     


    window.onload = function() {
      createToolTips();
    };
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

function getSelectionText() {
    if (window.getSelection) {
        // console.log(window.getSelection());
        text = window.getSelection().toString();
    } else if (document.selection && document.selection.type != "Control") {
        text = document.selection.createRange().text;
    }
    return text;
}


$(document).ready(function (){

    loadAnnotations();
    refreshAnnotationJquery();

    $('#annotation_text .annotationTool').mousedown(function(){
        event.stopPropagation();
    });

    $('.annotationTool .saveAnn').click(function(){
        event.stopPropagation();
        console.log("Saving Annotation");
        annotating = false;
        if(highlightedText != ""){
            //create new <p> with a span in the middle as the annotation
            //  first annotation of paragraph
            var paragraphId = textElem.parentElement.id;
            var pIdNum = paragraphId.substring(9,paragraphId.length);
            var pNextIdNum = parseInt(pIdNum) + 1;

            var annotatedText = highlightedText;
            var oldPText = textElem.parentNode.outerHTML;
            var ind = oldPText.indexOf(annotatedText);
            var htmlHead = oldPText.substring(0,ind);
            var annotateSpan = '<span class="annotation">'+annotatedText+'</span>';
            var htmlTail = oldPText.substring(ind + annotatedText.length,oldPText.length);
            var newHTML = htmlHead+annotateSpan+htmlTail;
            var docName = $("#annotation_text").data("file");
            docName = docName.substring(0,docName.indexOf(".txt"));
            console.log(docName); 
            annotationText= $('#annotation_text #annotationInput').val();
            annotationTag= $('#annotation_text #annotationTag').val();
            if(!annotationText) return 0;
            if(annotationTag == "") annotationTag = "None";

            console.log(annotationTag);
            $.ajax({
                type: "POST",
                data: {
                    docName: docName, 
                    annotatedText: annotatedText, 
                    annotationText:annotationText, 
                    annotationTag: annotationTag,
                    paragraphId: paragraphId},
                    url: "saveAnnotation",
                    success: function(data){

                        console.log("Annotation successful",data);
                        $('#annotation_text #'+paragraphId).remove();
                        var annotateSpan = '<span class="annotation" data-annotation="ann'+data.newAnn["new_a_id"]+'">'+annotatedText+'</span>';
						var newHTML = htmlHead+annotateSpan+htmlTail;
                        if ($('#annotation_text #paragraph'+pNextIdNum).length){
                            $('#annotation_text #paragraph'+pNextIdNum).before(newHTML);
                        }else{
                            pNextIdNum -= 2;
                            $('#annotation_text #paragraph'+pNextIdNum).after(newHTML);
                        }

                        $('.annotationList').append('<div class="annotationL" id="ann'+data.newAnn["new_a_id"]+'" data-paragraph="'+data.newAnn["new_p_id"]+'"><span data-user="'+data.newAnn["new_u_id"]+'" class="annotation_user">'+$('#nameofUser').text()+'</span><br /><span>Annotation: </span><span class="annotation_annotation">'+data.newAnn["new_ann"]+'</span><br /><span>Related To: </span><span class="annotation_annotatedText">'+data.newAnn["new_a_text"]+'</span><br /><span>Tags: </span><span id="tags'+data.newAnn["new_a_id"]+'" class="annotation_Tag">'+data.newAnn["new_tags"]+'</span><br /></div>');
                    	refreshAnnotationJquery();
                    },
                    error: function(data){
                        alert("Annotation Failed: "+data.message);
                        console.log("upload failed: ",data);
                    }
            });//ajax
        }
        $(".annotationTool").css("visibility","hidden");
        highlightedText ="";
    });

    $('.annotationTool .cancelAnn').click(function(){
        console.log("cancelAnn");
        $(".annotationTool").css("visibility","hidden");
        highlightedText = "";
    });

    $('#annotation_text').mouseup(function (){
        text = getSelectionText();
        if(text != "" && annotating == false){
            highlightedText = text;
            textElement = window.getSelection();
            annotating = true;
            iconYpos = (ypos+10)+"px";
            iconXpos = (xpos+10)+"px";
            $('#annotation_text').prepend('<img id="commentImg" src="images/comment.png" height="20" width="20" alt="comment">');
            
            refreshCommentImgJquery();
            $("#annotation_text #commentImg").css("top",iconYpos);
            $("#annotation_text #commentImg").css("left",iconXpos);
            $("#annotation_text #commentImg").css("visibility","visible");
        }else{
            $('#commentImg').remove();
            //$("#annotation_text .annotationT").css("visibility","hidden");
            annotating = false;
        }

    });

    //Document Upload
    $("#uploadDoc").click(function(e){
        if (confirm("Accepted extensions: .txt") == false) e.preventDefault();
    });

    $("#uploadDoc").change(function(e){
        uploadDocument(this);
    });//change


});