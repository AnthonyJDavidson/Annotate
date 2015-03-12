
var textElement;
var textElemAnchorNode;
var textElemFocusNode;
var highlightedText ="";
var annotating = false;
window.onload = init;
var xpos = 0; var ypos = 0;
var text ="";
var textElemSet = false;
var iconYpos =0;
var iconXpos =0;


function refreshAnnotationJquery(){
	$('.annotation').off();
    $('.annotation').mouseover(function(){
    	event.stopPropagation();
    	var annotation_ids = $(this).data("annotation").split(',');

    	$(this).after('<div class="aToolTip" style="top:'+(ypos+10)+'px;left:'+(xpos+10)+'px"></div>');
    	for (var i = 0; i < annotation_ids.length -1;i++) {
    		if(annotation_ids[0]!=""){
    			var ann_ann = $('.annotationL#'+annotation_ids[i]+' .annotation_annotation').text();
        		var tags = $('.annotationL#'+annotation_ids[i]+' .annotation_Tag').text();
    			$('.aToolTip').append('<div class="aToolTip_a"><div class="aToolTip_ann">'+ann_ann+'</div><span class="aToolTip_tags">'+tags+'</span></div>');
    		}
		}
	});

    $('.annotation').mouseout(function(){
    	event.stopPropagation();
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
        $(this).css("background","none");
    });

    $('#annotation_text #commentImg').mousedown(function(){
        event.stopPropagation();
        $(this).css("background","#4C55A8");
    });
    $('#annotation_text #commentImg').mouseup(function(){
        event.stopPropagation();
        if(textElement.baseNode){
        	textElemAnchorNode = textElement.anchorNode;
        	textElemFocusNode = textElement.focusNode;
        }
        $("#annotation_text .annotationTool").css("top",iconYpos);
        $("#annotation_text .annotationTool").css("left",iconXpos);
        $("#annotation_text .annotationTool").css("visibility","visible");
        $('#commentImg').remove();
    });
}

function loadAnnotations(){
    var annLists = $(".annotationL");
    console.log(annLists);
    for (var i = 0; i < annLists.length; i++) {
        console.log(annLists[i].id+ " loaded");
        //Annotated text
        //not needed anymore?
        //var ann_text = $('#'+annLists[i].id+' .annotation_annotatedText').text();
        //Annotation
        var ann_ann = $('#'+annLists[i].id+' .annotation_annotation').text();
        //paragraph id
        var ann_paragraph = $('#'+annLists[i].id).data("paragraph");
        //which words to highlight
        var ann_words =$('#'+annLists[i].id).data("words");
        //call function to highlight
        highlightDocument(ann_ann,ann_paragraph,annLists[i].id,ann_words);
    }
}

function highlightDocument(ann,paragraph,a_id,words){
	var wordSplitArray = words.split(',');
	for (var i = 0; i<words.length -1 ;i++) {
		$('#annotation_text #'+paragraph+' .word'+wordSplitArray[i]).addClass("annotation");
		var curData = $('#annotation_text #'+paragraph+' .word'+wordSplitArray[i]).data("annotation");
		$('#annotation_text #'+paragraph+' .word'+wordSplitArray[i]).data("annotation",curData+a_id+',');

	}
}

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
            var paragraphId = textElemAnchorNode.parentElement.parentElement.id;
            var firstWord = "";
            if(textElemAnchorNode.parentElement.classList[0] == "wordSpan"){
                firstWord =  textElemAnchorNode.parentElement.nextSibling.classList[0];
            }else firstWord = textElemAnchorNode.parentElement.classList[0];
            var lastWord = "";
            if(textElemFocusNode.parentElement.classList[0] == "wordSpan"){
                lastWord =  textElemFocusNode.parentElement.previousSibling.classList[0];
            }else lastWord = textElemFocusNode.parentElement.classList[0];
            //keep track of all annotated words
            var fWordNum = parseInt(firstWord.substring(4));
            var lWordNum = parseInt(lastWord.substring(4));
            var count = fWordNum;
            var wordsCovered = "";
            while(count <= lWordNum){
                wordsCovered = wordsCovered+count+',';
                count++;
            }
            var docName = $("#annotation_text").data("file");
            docName = docName.substring(0,docName.indexOf(".txt"));
            annotationText= $('#annotation_text #annotationInput').val();
            annotationTag= $('#annotation_text #annotationTag').val();
            if(!annotationText) return 0;
            if(annotationTag == "") annotationTag = "None";
            var wordsByNum= wordsCovered.split(/\W+/);//split by word character
            var annotatedText = "";
            for (var i = 0; i <= wordsByNum.length -1; i++){
                annotatedText = annotatedText+$('#annotation_text #'+paragraphId+' .word'+wordsByNum[i]).text();
            }
            $.ajax({
                type: "POST",
                data: {
                    docName: docName, 
                    annotatedText: annotatedText, 
                    annotationText:annotationText, 
                    annotationTag: annotationTag,
                    paragraphId: paragraphId,
                    wordsCovered: wordsCovered}, 
                    url: "saveAnnotation",
                    success: function(data){
                        console.log("Annotation successful",data);
                        //get words to hihglight
                        for (var i = 0; i <= wordsByNum.length -1; i++){
                            $('#annotation_text #'+paragraphId+' .word'+wordsByNum[i]).addClass("annotation");
                            var curData = $('#annotation_text #'+paragraphId+' .word'+wordsByNum[i]).data("annotation");
                            $('#annotation_text #'+paragraphId+' .word'+wordsByNum[i]).data("annotation",curData+'ann'+data.newAnn["new_a_id"]+',');
                        }
                        //update filter list
                        var tagsList = annotationTag.split(/\W+/);
                        var curTags = new Array();
                        var indexTags = 0
                        $('#left_Col .filters#tagsFilter li').each(function(){
                        	curTags[indexTags] = $(this).text();
                        	indexTags++;
                        });
                        console.log(curTags);
                        for (var i = 0 ; i <= tagsList.length; i++) {
                        	if(curTags.indexOf(tagsList[i]) == -1){
                        		 $('#left_Col .filters#tagsFilter ul').append('<li><input type="checkbox" name="show_tag" value="'+tagsList[i]+'" checked="true">tagsList[i]</li>');
                        	}
                     	}

                        $('.annotationList').append('<div class="annotationL" id="ann'+data.newAnn["new_a_id"]+'" data-paragraph="'+data.newAnn["new_p_id"]+'"><span data-user="'+data.newAnn["new_u_id"]+'" class="annotation_user">'+$('#nameofUser').text()+'</span><br /><span>Annotation: </span><span class="annotation_annotation">'+data.newAnn["new_ann"]+'</span><br /><span>Related To: </span><span class="annotation_annotatedText">'+data.newAnn["new_a_text"]+'</span><br /><span>Tags: </span><span id="tags'+data.newAnn["new_a_id"]+'" class="annotation_Tag">'+data.newAnn["new_tags"]+'</span><br /></div>');
                        refreshAnnotationJquery();
                        $('#annotation_text #annotationInput').val("Annotation");
        				$('#annotation_text #annotationTag').val("Tag1, tag2, etc.");
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
        $('#annotation_text #annotationInput').val("");
        $('#annotation_text #annotationTag').val("");
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