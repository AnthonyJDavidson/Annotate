
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
var filteredArray = [""];
$(".page-content").mCustomScrollbar({
    axis:"y",
    mouseWheel:{ normalizeDelta: false }
});


function refreshAnnotationJquery(){
    $('.annotation').off();
    $('.annotationL .deleteAnn').off();
    $('.annotationL .editAnn').off();
    $('.filter .byTag').off();
    $('.hideMe').off();


    $('.hideMe').change(function(){
        if(!($(this).is(":checked"))) {//unchecked
            //remove all highlights and annotations (front only)
            $('.annotation').each(function(){
                $(this).removeClass("annotation");
                $(this).removeClass("annotation_Mentor");
                $(this).removeClass("annotation_Student");
                $(this).removeClass("annotation_Overlap");
                $(this).addClass("filtered");
                $(this).css("background","none");
                $(this).data("annotation","");
                $(this).data("perm","0");
            });
            //add this tag to filtered array
            filteredArray.push($(this).val());
            loadAnnotations(true,filteredArray);
        }else{ // unchecked
            $('.annotation').each(function(){
                $(this).removeClass("annotation");
                $(this).removeClass("annotation_Mentor");
                $(this).removeClass("annotation_Student");
                $(this).removeClass("annotation_Overlap");
                $(this).css("background","none");
                $(this).data("annotation","");
                $(this).data("perm","0");
            });
            $('.filtered').each(function(){$(this).removeClass("filtered")});
            var indexofFilter = filteredArray.indexOf($(this).val());
            if (indexofFilter > -1) {
                filteredArray.splice(indexofFilter, 1);
            }
            loadAnnotations(true,filteredArray);
            refreshAnnotationJquery();
        }  
    });


    $('.annotation').mouseover(function(){
        event.stopPropagation();

        var annotation_ids = $(this).data("annotation").split(',');
        if(annotation_ids != ""){
            $('.page-content').after('<div class="aToolTip" style="top:'+(ypos+10)+'px;left:'+(xpos+10)+'px"></div>');
            for (var i = 0; i < annotation_ids.length -1;i++) {
                if(annotation_ids[0]!=""){
                    var ann_ann = $('.annotationL#'+annotation_ids[i]+' .annotation_annotation').text();
                    var tags = $('.annotationL#'+annotation_ids[i]+' .annotation_Tag').text();
                    var name = $('.annotationL#'+annotation_ids[i]+' #userNameAnnotation').text();
                    $('.aToolTip').append('<div class="aToolTip_a"><div class="aToolTip_ann">'+ann_ann+'</div><div><span class="aToolTip_tags">'+tags+'</span>  <span class="aToolTip_user">'+name+'</span></div></div>');
                }
            }
        }
    });

    $('.annotation').mouseout(function(){
        event.stopPropagation();
        $('.aToolTip').remove();
    });

    $('.annotationL .editAnn').click(function(){

        var oldAnnotationID = $(this)[0].parentElement.id;
        var oldAnnotation = $(this)[0].parentElement.children[3].innerText;
        var oldTag = $('.annotationL#'+oldAnnotationID+ ' #tags'+oldAnnotationID.substring(3)).text();
        $('.annotationL#'+oldAnnotationID+ ' .editAnn').toggle();
        $('.annotationL#'+oldAnnotationID+ ' .deleteAnn').toggle();
        $('.annotationL#'+oldAnnotationID+ ' .editAnn').before('<button type="button" class="editConfirm">Save</button>');
        $('.annotationL#'+oldAnnotationID+ ' .editAnn').after('<button type="button" class="editCancel">Cancel</button>');
        $('.annotationL#'+oldAnnotationID+ ' .annotation_annotation').after('<textArea rows="1" cols="30" id="tempTextAreaAnn" class="textArea_editAn" contenteditable>'+oldAnnotation+'</textArea>');
        $('.annotationL#'+oldAnnotationID+ ' .annotation_annotation').text("");
        $('.annotationL#'+oldAnnotationID+ ' #tags'+oldAnnotationID.substring(3)).before('<textArea rows="1" cols="15" id="tempTextAreaTag" class="textArea_editAn" contenteditable>'+oldTag+'</textArea>');
        $('.annotationL#'+oldAnnotationID+ ' #tags'+oldAnnotationID.substring(3)+' .annotation_Tag').text("");
        var newAnnotation;
        var newTag;
        $('.annotationL#'+oldAnnotationID+ ' .editConfirm').click(function(){
            newAnnotation = $('.annotationL#'+oldAnnotationID+ ' #tempTextAreaAnn').val();
            newTag = $('.annotationL#'+oldAnnotationID+ ' #tempTextAreaTag').val();
            $('.annotationL#'+oldAnnotationID+ ' .textArea_editAn').remove();
            $('.annotationL#'+oldAnnotationID+ ' .editAnn').toggle();
            $('.annotationL#'+oldAnnotationID+ ' .deleteAnn').toggle();
            $('.annotationL#'+oldAnnotationID+ ' .editConfirm').remove();
            $('.annotationL#'+oldAnnotationID+ ' .editCancel').remove();  
            
            $.ajax({
                type: "POST",
                data: {annChanged: oldAnnotationID.substring(3),newAnnotation:newAnnotation, newTag:newTag},
                url: "editAnnotation",
                success: function(data){
                    if(data.message == "Annotation not Edited"){
                        alert("incorrect user id, dont edit others' annotations");
                        $('.annotationL#'+oldAnnotationID+ ' .annotation_annotation').text(oldAnnotation);
                        $('.annotationL#'+oldAnnotationID+ ' #tags'+oldAnnotationID.substring(3)+' .annotation_Tag').text(oldTag);
                    }else{
                        console.log("Annotation Edited");
                        $('.annotationL#'+oldAnnotationID+ ' .annotation_annotation').text(newAnnotation);
                        $('.annotationL#'+oldAnnotationID+ ' #tags'+oldAnnotationID.substring(3)+' .annotation_Tag').text(newTag);
                    }
                },
                error: function(data){
                    alert("Annotation edit Failed: "+data.message);
                    console(data);
                }
            });//ajax

        });
        $('.annotationL#'+oldAnnotationID+ ' .editCancel').click(function(){
            $('.annotationL#'+oldAnnotationID+ ' .annotation_annotation').text(oldAnnotation);
            $('.annotationL#'+oldAnnotationID+ ' #tags'+oldAnnotationID.substring(3)+' .annotation_Tag').text(oldTag);
            $('.annotationL#'+oldAnnotationID+ ' .textArea_editAn').remove();
            $('.annotationL#'+oldAnnotationID+ ' .editAnn').toggle();
            $('.annotationL#'+oldAnnotationID+ ' .deleteAnn').toggle();
            $('.annotationL#'+oldAnnotationID+ ' .editConfirm').remove();
            $('.annotationL#'+oldAnnotationID+ ' .editCancel').remove();
        });
    });
    $('.annotationL .deleteAnn').click(function(){
        //find ann id (ann_id will be in the form annNUM and we want NUM only)
        console.log("clicked Delete");
        var annID_all = $(this)[0].parentElement.id; 
        var annID_id = annID_all.substring(annID_all.length, 3);
        var el = $(this);
        //delete ann (ajax)
        $.ajax({
            type: "POST",
            data: {annID: annID_id},
            url: "deleteAnn",
            success: function(data){
                if(data.message == "Annotation not deleted"){
                    alert("incorrect User, dont delete others' annotations");
                }else{
                    //Remove all annotations and refresh all
                    $('.annotation').each(function(){

                        $(this).removeClass("annotation");
                        $(this).removeClass("annotation_Mentor");
                        $(this).removeClass("annotation_Student");
                        $(this).removeClass("annotation_Overlap");
                        $(this).addClass("filtered");
                        $(this).css("background","none");
                        $(this).data("annotation","");
                        $(this).data("perm","0");
                    });
                    /* Old way, doies not work for different highlight colours
                        needs update if re-write is done
                        look at saveAnn and loadAnnotations for process

                     //"unhighlight" words for each data-word
                    //"data-123".replace('data-','');
                    var par = el[0].parentElement.dataset["paragraph"];
                    var annWords = el[0].parentElement.dataset["words"];
                    var annLines = el[0].parentElement.dataset["line"];

                    var lines_Back = annLines;
                    var linesArray = lines_Back.split(',');
                    var words_Back = annWords;
                    var wordsArray = words_Back.split(':');
                    var count = 0;
                    while(count<wordsArray.length){
                        var curWords = wordsArray[count].split(',');
                        for (var i = 0; i < curWords.length - 1; i++) {
                            element = $('#annotation_text #'+par+' .'+linesArray[count]+' .word'+curWords[i]);
                            elementSpace = $('#annotation_text #'+par+' .'+linesArray[count]+' .word'+curWords[i]+':nth-child(2)');
                            oldData = element.data("annotation");//word not space
                            if(oldData){
                                newData = oldData.replace(annID_all+',','');
                                element.data("annotation",newData);
                                elementSpace.data("annotation",newData);
                                if(element.data("annotation") == ""){
                                    element.removeClass("annotation");
                                    elementSpace.removeClass("annotation");
                                }else{

                                        var oldOp = element.css("background-color").split(',');
                                        if(oldOp.length == 4){
                                            var olOpNum = parseFloat(oldOp[3].substring(2,4));
                                            olOpNum-=0.2;
                                            var rgba = oldOp[0]+','+oldOp[1]+','+oldOp[2]+','+olOpNum+')';
                                        }else{
                                            var rgba = oldOp[0]+','+oldOp[1]+','+oldOp[2]+',0.8)';
                                        }
                                        element.css("background-color",rgba);
                                        elementSpace.css("background-color",rgba);
                                }
                            }
                        }
                        count++;
                    }*/
                    el[0].parentElement.remove();
                    console.log("Annotation Deleted",data.message);
                    loadAnnotations(true,filteredArray);
                    refreshAnnotationJquery();
                }
            },
            error: function(data){
                alert(data.message);
                console.log("delete failed: ",data);
            }
        });//ajax   

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
        $('.annotationTool #tagSelection').empty();
        $('#left_Col #tagsFilter li').each(function(){
            $('.annotationTool #tagSelection').append('<option class="tagS" value="'+$(this).text()+'">'+$(this).text()+'</option>');
        });
        $('.annotationTool #tagSelection').mouseup(function(){
            event.stopPropagation();
            $('.annotationTool #annotationTag').val($('.annotationTool #tagSelection option:selected').text());
        });
    });
    $('#annotation_text #commentImg').mouseup(function(){
        event.stopPropagation();
        if(textElement.baseNode){
            textElemAnchorNode = textElement.anchorNode;
            textElemFocusNode = textElement.focusNode;
        }
        $(".annotationTool").css("top",parseInt(iconYpos));
        $(".annotationTool").css("left",parseInt(iconXpos));
        $(".annotationTool").css("visibility","visible");
        $('#commentImg').remove();
    });
}

function loadAnnotations(reload,fArray){
    var annLists = $(".annotationL");
    console.log(annLists);
    for (var i = 0; i < annLists.length; i++) {
        console.log(annLists[i].id+ " loaded");
        //permission level for color info
        var ann_perm = $('#'+annLists[i].id+' .annotation_user').data("perm");
        //Annotation
        var ann_ann = $('#'+annLists[i].id+' .annotation_annotation').text();
        //paragraph id
        var ann_paragraph = $('#'+annLists[i].id).data("paragraph");
        //which words to highlight
        var ann_words =$('#'+annLists[i].id).data("words");
        //which lines
        var ann_lines =$('#'+annLists[i].id).data("line");

        if(fArray.length > 1){
            tagOfAnn = $('#'+annLists[i].id+' .annotation_Tag').text();
            if(fArray.indexOf(tagOfAnn) == -1 ){
                //call function to highlight
                if(reload) highlightDocumentAgain(ann_ann,ann_paragraph,annLists[i].id,ann_words,ann_lines,ann_perm);
                else highlightDocument(ann_ann,ann_paragraph,annLists[i].id,ann_words,ann_lines,ann_perm);
            }
        }else{
            if(reload) highlightDocumentAgain(ann_ann,ann_paragraph,annLists[i].id,ann_words,ann_lines,ann_perm);
            else highlightDocument(ann_ann,ann_paragraph,annLists[i].id,ann_words,ann_lines,ann_perm);
        }
    }
}

function highlightDocument(ann,paragraph,a_id,words,lines,perm){
    //basically copy paste of saveAnn success functionality
    var lines_Back = lines;
    var linesArray = lines_Back.split(',');
    var words_Back = words;
    var wordsArray = words_Back.split(':');
    var count = 0;
    while(count<wordsArray.length){
        var curWords = wordsArray[count].split(',');
        for (var i = 0; i < curWords.length - 1; i++) {

            //if annotation already present on word or overlap already catered for
            if($('#annotation_text #'+paragraph+' .'+linesArray[count]+' .word'+curWords[i]).hasClass("annotation") || $('#annotation_text #'+paragraph+' .'+linesArray[count]+' .word'+curWords[i]).hasClass("annotation_Overlap")){
                if($('#annotation_text #'+paragraph+' .'+linesArray[count]+' .word'+curWords[i]).data("perm") == perm){
                    var oldOp = $('#annotation_text #'+paragraph+' .'+linesArray[count]+' .word'+curWords[i]).css("background-color").split(',');
                    if(oldOp.length == 4){ // has alpha < 1
                        var olOpNum = parseFloat(oldOp[3].substring(2,4));
                        olOpNum+=0.2;
                        var rgba = oldOp[0]+','+oldOp[1]+','+oldOp[2]+','+olOpNum+')';
                        $('#annotation_text #'+paragraph+' .'+linesArray[count]+' .word'+curWords[i]).css("background-color",rgba);
                    }
                }else{
                    $('#annotation_text #'+paragraph+' .'+linesArray[count]+' .word'+curWords[i]).addClass("annotation_Overlap");
                    var oldOp = $('#annotation_text #'+paragraph+' .'+linesArray[count]+' .word'+curWords[i]).css("background-color").split(',');
                    if(oldOp.length == 4){ // has alpha < 1
                        var olOpNum = parseFloat(oldOp[3].substring(2,4));
                        olOpNum+=0.2;
                        //rgb corresponds to overlap rgb
                        var rgba = 'rgba(210,65,153,'+olOpNum+')';
                        $('#annotation_text #'+paragraph+' .'+linesArray[count]+' .word'+curWords[i]).css("background-color",rgba);
                    }else{
                        $('#annotation_text #'+paragraph+' .'+linesArray[count]+' .word'+curWords[i]).css("background-color","rgba(210,65,153,0.4)");
                    }
                }
            //new ann, check for who user type
            }else{
                // new start!!!
                $('#annotation_text #'+paragraph+' .'+linesArray[count]+' .word'+curWords[i]).data("perm",perm);
                $('#annotation_text #'+paragraph+' .'+linesArray[count]+' .word'+curWords[i]).addClass("annotation");
                if(perm == 2){
                    $('#annotation_text #'+paragraph+' .'+linesArray[count]+' .word'+curWords[i]).addClass("annotation_Mentor");
                }else{
                    $('#annotation_text #'+paragraph+' .'+linesArray[count]+' .word'+curWords[i]).addClass("annotation_Student");
                }
            }
            var curData = $('#annotation_text #'+paragraph+' .'+linesArray[count]+' .word'+curWords[i]).data("annotation");
            $('#annotation_text #'+paragraph+' .'+linesArray[count]+' .word'+curWords[i]).data("annotation",curData+a_id+',');
        }
        count++;
    }
}

function highlightDocumentAgain(ann,paragraph,a_id,words,lines,perm){
    //basically copy paste of saveAnn success functionality
    var lines_Back = lines;
    var linesArray = lines_Back.split(',');
    var words_Back = words;
    var wordsArray = words_Back.split(':');
    var count = 0;
    while(count<wordsArray.length){
        var curWords = wordsArray[count].split(',');
        for (var i = 0; i < curWords.length - 1; i++) {

            //if annotation already present on word or overlap already catered for
            if($('#annotation_text #'+paragraph+' .'+linesArray[count]+' .word'+curWords[i]).hasClass("annotation") || $('#annotation_text #'+paragraph+' .'+linesArray[count]+' .word'+curWords[i]).hasClass("annotation_Overlap")){
                if($('#annotation_text #'+paragraph+' .'+linesArray[count]+' .word'+curWords[i]).data("perm") == perm){
                    var oldOp = $('#annotation_text #'+paragraph+' .'+linesArray[count]+' .word'+curWords[i]).css("background-color").split(',');
                    if(oldOp.length == 4){ // has alpha < 1
                        var olOpNum = parseFloat(oldOp[3].substring(2,4));
                        olOpNum+=0.2;
                        var rgba = oldOp[0]+','+oldOp[1]+','+oldOp[2]+','+olOpNum+')';
                        $('#annotation_text #'+paragraph+' .'+linesArray[count]+' .word'+curWords[i]).css("background-color",rgba);
                    }
                }else{
                    $('#annotation_text #'+paragraph+' .'+linesArray[count]+' .word'+curWords[i]).addClass("annotation_Overlap");
                    var oldOp = $('#annotation_text #'+paragraph+' .'+linesArray[count]+' .word'+curWords[i]).css("background-color").split(',');
                    if(oldOp.length == 4){ // has alpha < 1
                        var olOpNum = parseFloat(oldOp[3].substring(2,4));
                        olOpNum+=0.2;
                        //rgb corresponds to overlap rgb
                        var rgba = 'rgba(210,65,153,'+olOpNum+')';
                        $('#annotation_text #'+paragraph+' .'+linesArray[count]+' .word'+curWords[i]).css("background-color",rgba);
                    }else{
                        $('#annotation_text #'+paragraph+' .'+linesArray[count]+' .word'+curWords[i]).css("background-color","rgba(210,65,153,0.4)");
                    }
                }
            //new ann, check for who user type
            }else{
                // new start!!!
                $('#annotation_text #'+paragraph+' .'+linesArray[count]+' .word'+curWords[i]).data("perm",perm);
                $('#annotation_text #'+paragraph+' .'+linesArray[count]+' .word'+curWords[i]).addClass("annotation");
                if(perm == 2){
                    $('#annotation_text #'+paragraph+' .'+linesArray[count]+' .word'+curWords[i]).addClass("annotation_Mentor");
                    $('#annotation_text #'+paragraph+' .'+linesArray[count]+' .word'+curWords[i]).css("background-color","rgba(139,64,184,0.4)");

                }else{
                    $('#annotation_text #'+paragraph+' .'+linesArray[count]+' .word'+curWords[i]).addClass("annotation_Student");
                    $('#annotation_text #'+paragraph+' .'+linesArray[count]+' .word'+curWords[i]).css("background-color","rgba(255,254,39,0.4)");
                }
            }
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

     $('#left_Col #hideAnnotations').change(function() {
        if($(this).is(":checked")) {//checked
            //remove all highlights and annotations (front only)
            $('.annotation').each(function(){

                $(this).removeClass("annotation");
                $(this).removeClass("annotation_Mentor");
                $(this).removeClass("annotation_Student");
                $(this).removeClass("annotation_Overlap");
                $(this).addClass("filtered");
                $(this).css("background","none");
                $(this).data("annotation","");
                $(this).data("perm","0");
            });
        }else{ // unchecked
            $('.annotation').each(function(){
                $(this).removeClass("annotation");
                $(this).removeClass("annotation_Mentor");
                $(this).removeClass("annotation_Student");
                $(this).removeClass("annotation_Overlap");
                $(this).css("background","none");
                $(this).data("annotation","");
                $(this).data("perm","0");
            });
            $('.filtered').each(function(){$(this).removeClass("filtered")});
            loadAnnotations(true,filteredArray);
            refreshAnnotationJquery();
        }       
    });

    loadAnnotations(false,filteredArray);
    refreshAnnotationJquery();

    $('.annotationTool').mousedown(function(){
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
            annotationText= $('.annotationTool #annotationInput').val();
            annotationTag= $('.annotationTool #annotationTag').val();
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
                        var perm = $('.header #nameofUser').data("perm");
                        while(count<wordsArray.length){
                            var curWords = wordsArray[count].split(',');
                            for (var i = 0; i < curWords.length - 1; i++) {



                                if($('#annotation_text #'+paragraphId+' .'+linesArray[count]+' .word'+curWords[i]).hasClass("annotation") || $('#annotation_text #'+paragraphId+' .'+linesArray[count]+' .word'+curWords[i]).hasClass("annotation_Overlap")){
                                    if($('#annotation_text #'+paragraphId+' .'+linesArray[count]+' .word'+curWords[i]).data("perm") == perm){
                                        var oldOp = $('#annotation_text #'+paragraphId+' .'+linesArray[count]+' .word'+curWords[i]).css("background-color").split(',');
                                        if(oldOp.length == 4){ // has alpha < 1
                                            var olOpNum = parseFloat(oldOp[3].substring(2,4));
                                            olOpNum+=0.2;
                                            var rgba = oldOp[0]+','+oldOp[1]+','+oldOp[2]+','+olOpNum+')';
                                            $('#annotation_text #'+paragraphId+' .'+linesArray[count]+' .word'+curWords[i]).css("background-color",rgba);

                                        }
                                    }else{
                                        $('#annotation_text #'+paragraphId+' .'+linesArray[count]+' .word'+curWords[i]).addClass("annotation_Overlap");
                                        var oldOp = $('#annotation_text #'+paragraphId+' .'+linesArray[count]+' .word'+curWords[i]).css("background-color").split(',');
                                        if(oldOp.length == 4){ // has alpha < 1
                                            var olOpNum = parseFloat(oldOp[3].substring(2,4));
                                            olOpNum+=0.2;
                                            var rgba = oldOp[0]+','+oldOp[1]+','+oldOp[2]+','+olOpNum+')';
                                            $('#annotation_text #'+paragraphId+' .'+linesArray[count]+' .word'+curWords[i]).css("background-color",rgba);
                                        }else{
                                            $('#annotation_text #'+paragraphId+' .'+linesArray[count]+' .word'+curWords[i]).css("background-color","rgba(210,65,153,0.4)");
                                        }
                                    }
                                }else{
                                    if($('#annotation_text #'+paragraphId+' .'+linesArray[count]+' .word'+curWords[i]).hasClass("filtered")){ // need to refresh backgrounds
                                        if(perm == 1){
                                            $('#annotation_text #'+paragraphId+' .'+linesArray[count]+' .word'+curWords[i]).css("background-color","rgba(255,254,39,0.4)");
                                            $('#annotation_text #'+paragraphId+' .'+linesArray[count]+' .word'+curWords[i]).removeClass("filtered");
                                            $('#annotation_text #'+paragraphId+' .'+linesArray[count]+' .word'+curWords[i]).addClass("annotation_Student");
                                        }else{
                                            $('#annotation_text #'+paragraphId+' .'+linesArray[count]+' .word'+curWords[i]).css("background-color","rgba(139,64,184,0.4)");
                                            $('#annotation_text #'+paragraphId+' .'+linesArray[count]+' .word'+curWords[i]).removeClass("filtered");
                                            $('#annotation_text #'+paragraphId+' .'+linesArray[count]+' .word'+curWords[i]).addClass("annotation_Mentor");
                                        }
                                    }else{
                                        if(perm == 1) $('#annotation_text #'+paragraphId+' .'+linesArray[count]+' .word'+curWords[i]).addClass("annotation_Student");
                                        else $('#annotation_text #'+paragraphId+' .'+linesArray[count]+' .word'+curWords[i]).addClass("annotation_Mentor")
                                        $('#annotation_text #'+paragraphId+' .'+linesArray[count]+' .word'+curWords[i]).data("perm",perm);
                                    }
                                    $('#annotation_text #'+paragraphId+' .'+linesArray[count]+' .word'+curWords[i]).addClass("annotation");   
                                }
                                var curData = $('#annotation_text #'+paragraphId+' .'+linesArray[count]+' .word'+curWords[i]).data("annotation");
                                $('#annotation_text #'+paragraphId+' .'+linesArray[count]+' .word'+curWords[i]).data("annotation",curData+'ann'+data.newAnn["new_a_id"]+',');
                            }
                            count++;
                        }

                        //create annotation in list -- tags added in a few lines
                        $('.annotationList').append('<div class="annotationL" id="ann'+data.newAnn["new_a_id"]+'" data-paragraph="'+data.newAnn["new_p_id"]+'" data-line="'+lines_Back+'" data-words="'+words_Back+'"><span data-perm='+perm+' data-user="'+data.newAnn["new_u_id"]+'" class="annotation_user" id="userNameAnnotation">'+$('#nameofUser').text()+'</span><br /><span>Annotation: </span><span class="annotation_annotation">'+data.newAnn["new_ann"]+'</span><br /><span>Related To: </span><span class="annotation_annotatedText">'+data.newAnn["new_a_text"]+'</span><br /><span>Tag: </span><span id="tags'+data.newAnn["new_a_id"]+'" class="annotation_Tag"></span><br /><button type="button" class="editAnn">Edit</button><button type="button" class="deleteAnn">Delete</button></div>');
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
                                 $('#left_Col #tagsFilter').append('<li><input type="checkbox" class="hideMe" value="'+tagsList[i]+'" checked="true">'+tagsList[i]+'</li>');
                            }
                            //add tag to annotation in list
                            console.log();
                            $('.annotationList #ann'+data.newAnn["new_a_id"]+' #tags'+data.newAnn["new_a_id"]).append('<span>'+tagsList[i]+'</span>');
                        }

                        
                        refreshAnnotationJquery();
                        $('.annotationTool #annotationInput').val("");
                        $('.annotationTool #annotationTag').val("");
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