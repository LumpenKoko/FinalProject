

//댓글,대댓글 작성 ajax
function replyInsertAjax(data){
 
    $.ajax({
        type:'POST',
        url:contextPath+'/detailViewReply.in',
        data:data,
        success:function(response){
            if(response==='ok'){
                alert("작성되었습니다.")

                if(data.replyNo!==-1){
                    document.querySelector("#replyReplyText"+data.replyNo).value="";
                }
              
                document.querySelector("#replyText").value="";
            }
            else{
                alert("작성실패")
            }

            replyShowAjax(data,drawReply);
        },
        error:function(){
            alert("서버오류")
        }
    })

}
  
//댓글 목록 ajax
function replyShowAjax(data,callback){

    $.ajax({
        type:'GET',
        url:contextPath+'/detailViewReply.view',
        data:data,
        success:function(response){
            callback(response.replys)
            drawingPage(response.page)
        },
        error:function(){
            alert("서버오류")
        }
    })
}

//댓글 삭제 ajax

function replyDeleteAjax(data){

    $.ajax({
        type:'GET',
        url:contextPath+'/deleteViewReply.view',
        data:data,
        success:function(response){
            alert(response)
            replyShowAjax(data,drawReply);
        },
        error:function(){
            alert("서버오류")
        }
    })

}