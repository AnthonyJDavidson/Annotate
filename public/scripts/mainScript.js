
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
    	if(annotation_ids != ""){
	    	$(this).after('<div class="aToolTip" style="top:'+(ypos+10)+'px;left:'+(xpos+10)+'px"></div>');
	    	for (var i = 0; i < annotation_ids.length -1;i++) {
	    		if(annotation_ids[0]!=""){
	    			var ann_ann = $('.annotationL#'+annotation_ids[i]+' .annotation_annotation').text();
	        		var tags = $('.annotationL#'+annotation_ids[i]+' .annotation_Tag').text();
	    			$('.aToolTip').append('<div class="aToolTip_a"><div class="aToolTip_ann">'+ann_ann+'</div><span class="aToolTip_tags">'+tags+'</span></div>');
	    		}
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
        //which lines
        var ann_lines =$('#'+annLists[i].id).data("line");
        //call function to highlight
        highlightDocument(ann_ann,ann_paragraph,annLists[i].id,ann_words,ann_lines);



    }
}

function highlightDocument(ann,paragraph,a_id,words,lines){
    //basically copy paste of saveAnn success functionality
    var lines_Back = lines;
    var linesArray = lines_Back.split(',');
    var words_Back = words;
    var wordsArray = words_Back.split(':');
    var count = 0;
    while(count<wordsArray.length){
        var curWords = wordsArray[count].split(',');
        for (var i = 0; i < curWords.length - 1; i++) {
            $('#annotation_text #'+paragraph+' .'+linesArray[count]+' .word'+curWords[i]).addClass("annotation");
            var curData = $('#annotation_text #'+paragraph+' .'+linesArray[count]+' .word'+curWords[i]).data("annotation");
            $('#annotation_text #'+paragraph+' .'+linesArray[count]+' .word'+curWords[i]).data("annotation",curData+a_id+',');
        }
        count++;
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
        file.fname = file.name.substring(0, file.name.lastIndexOf('.'));
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
            var paragraphId = textElemAnchorNode.parentElement.parentElement.parentElement.id;
            var firstLine = textElemAnchorNode.parentElement.parentElement.className;
            var firstLineNum = parseInt(firstLine.substring(4));
            var firstLineNumOfWords = textElemAnchorNode.parentElement.parentElement.dataset["linewordcount"];
            var lastLine = textElemFocusNode.parentElement.parentElement.className;
            var lastLineNum = parseInt(lastLine.substring(4));
            var overLappingOfLinesLengthArray = [];
            for (var i = firstLineNum; i != lastLineNum; i++) {
                overLappingOfLinesLengthArray[i] = $('#annotation_text #'+paragraphId+' .line'+i).data("linewordcount");
            };

            
            var firstWord = "";
            if(textElemAnchorNode.parentElement.classList[0] == "wordSpace"){
                firstWord =  textElemAnchorNode.parentElement.nextSibling.classList[0];
            }else firstWord = textElemAnchorNode.parentElement.classList[0];
            var lastWord = "";
            if(textElemFocusNode.parentElement.classList[0] == "wordSpace"){
                lastWord =  textElemFocusNode.parentElement.previousSibling.classList[0];
            }else lastWord = textElemFocusNode.parentElement.classList[0];


            //keep track of all annotated words
            var linesCovered = firstLine+',';
            var fWordNum = parseInt(firstWord.substring(4));
            var lWordNum = parseInt(lastWord.substring(4));
            if(overLappingOfLinesLengthArray.length > 0){
                var wordsCovered = "";
                //remaining words on line 1
                for (var i = fWordNum; i < overLappingOfLinesLengthArray[firstLineNum]; i++) {
                    wordsCovered = wordsCovered+i+',';
                }
                wordsCovered = wordsCovered+':';//new line
                //get rest of middle lines
                var count = firstLineNum + 1;
                while(overLappingOfLinesLengthArray[count]){
                    for (var i = 0; i < overLappingOfLinesLengthArray[count]; i++) {
                        wordsCovered = wordsCovered+i+',';
                    }
                    wordsCovered = wordsCovered+':';//new Line
                    linesCovered = linesCovered+'line'+count+',';
                    count++;
                }
                //get last line
                for (var i = 0; i <= lWordNum; i++) {
                    wordsCovered = wordsCovered+i+',';   
                }
                linesCovered = linesCovered+lastLine+',';
                console.log(wordsCovered);
                //get
            }else{
                var count = fWordNum;
                var wordsCovered = "";
                while(count <= lWordNum){
                    wordsCovered = wordsCovered+count+',';
                    count++;
                }
            }
            
            var docName = $("#annotation_text").data("file");
            docName = docName.substring(0,docName.indexOf(".txt"));
            annotationText= $('#annotation_text #annotationInput').val();
            annotationTag= $('#annotation_text #annotationTag').val();
            if(!annotationText) return 0;
            if(annotationTag == "") annotationTag = "None";
            var wordsByNum= wordsCovered.split(/\W+/);//split by word character
            var annotatedText = highlightedText;
            $.ajax({
                type: "POST",
                data: {
                    docName: docName, 
                    annotatedText: annotatedText, 
                    annotationText:annotationText, 
                    annotationTag: annotationTag,
                    paragraphId: paragraphId,
                    lineId: linesCovered,
                    wordsCovered: wordsCovered}, 
                    url: "saveAnnotation",
                    success: function(data){
                        console.log("Annotation successful",data);
                        //get words to hihglight
                        var lines_Back = data.newAnn["new_l_id"];
                        var linesArray = lines_Back.split(',');
                        var words_Back = data.newAnn["new_words"];
                        var wordsArray = words_Back.split(':');
                        var count = 0;
                        while(count<wordsArray.length){
                            var curWords = wordsArray[count].split(',');
                            for (var i = 0; i < curWords.length - 1; i++) {
                                $('#annotation_text #'+paragraphId+' .'+linesArray[count]+' .word'+curWords[i]).addClass("annotation");
                                var curData = $('#annotation_text #'+paragraphId+' .'+linesArray[count]+' .word'+curWords[i]).data("annotation");
                                $('#annotation_text #'+paragraphId+' .'+linesArray[count]+' .word'+curWords[i]).data("annotation",curData+'ann'+data.newAnn["new_a_id"]+',');
                            }
                            count++;
                        }

                        //create annotation in list -- tags added in a few lines
                        $('.annotationList').append('<div class="annotationL" id="ann'+data.newAnn["new_a_id"]+'" data-paragraph="'+data.newAnn["new_p_id"]+'" data-line="'+lines_Back+'" data-words="'+words_Back+'"><span data-user="'+data.newAnn["new_u_id"]+'" class="annotation_user">'+$('#nameofUser').text()+'</span><br /><span>Annotation: </span><span class="annotation_annotation">'+data.newAnn["new_ann"]+'</span><br /><span>Related To: </span><span class="annotation_annotatedText">'+data.newAnn["new_a_text"]+'</span><br /><span>Tags: </span><div id="tags'+data.newAnn["new_a_id"]+'"></div><button type="button" class="editAnn">Edit</button><button type="button" class="deleteAnn">Delete</button></div>');
                        //update filter list
                        var tagsList = annotationTag.split(/\W+/);
                        var curTags = new Array();
                        var indexTags = 0;
                        $('#left_Col #tagsFilter li').each(function(){
                        	curTags[indexTags] = $(this).text();
                        	indexTags++;
                        });
                        
                        for (var i = 0 ; i < tagsList.length; i++) {
                        	if(curTags.indexOf(tagsList[i]) == -1){
                        		 $('#left_Col #tagsFilter').append('<li><input type="checkbox" name="show_tag" value="'+tagsList[i]+'" checked="true">'+tagsList[i]+'</li>');
                        	}
                        	//add tag to annotation in list
                            console.log();
                        	$('.annotationList #ann'+data.newAnn["new_a_id"]+' #tags'+data.newAnn["new_a_id"]).append('<span class="annotation_Tag">'+tagsList[i]+'</span>');
                     	}

                        
                        refreshAnnotationJquery();
                        $('#annotation_text #annotationInput').val("");
        				$('#annotation_text #annotationTag').val("");
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


    $('.annotationL .deleteAnn').click(function(){
    	//find ann id (ann_id will be in the form annNUM and we want NUM only)
    	var annID_all = $(this)[0].parentElement.id; 
    	var annID_id = annID_all.substring(annID_all.length, 3);
        var el = $(this);
    	//delete ann (ajax)
    	$.ajax({
            type: "POST",
            data: {annID: annID_id},
            url: "deleteAnn",
            success: function(data){
            	//"unhighlight" words for each data-word
		    	//"data-123".replace('data-','');
		    	var par = el[0].parentElement.dataset["paragraph"];
		    	var annWords = el[0].parentElement.dataset["words"];
		    	annWords = annWords.split(',');
		    	for(var i = 0; i<annWords.length;i++){
		    		element = $('#annotation_text #'+par+' .word'+annWords[i]);
		    		elementSpace = $('#annotation_text #'+par+' .word'+annWords[i]+':nth-child(2)');
		    		oldData = element.data("annotation");//word not space
		    		if(oldData){
		    			newData = oldData.replace(annID_all+',','');
		    			element.data("annotation",newData);
		    			elementSpace.data("annotation",newData);
		    			if(element.data("annotation") == ""){
		    				element.removeClass("annotation");
		    				elementSpace.removeClass("annotation");
		    			}else{
		    				//TODO
		    				//remove some background colour
		    			}
		    		}
		    	}
                el[0].parentElement.remove();
                console.log("Annotation Deleted",data);
            },
            error: function(data){
                alert(data.message);
                console.log("delete failed: ",data);
            }
        });//ajax	

    });

    $('.annotationL .editAnn').click(function(){});

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