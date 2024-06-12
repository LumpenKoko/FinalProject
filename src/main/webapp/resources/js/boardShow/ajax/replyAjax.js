

//댓글,대댓글 작성 ajax
function replyInsertAjax(data){
 
    $.ajax({
        type:'POST',
        url:contextPath+'/detailViewReply.in',
        data:data,
        success:function(response){
            if(response==='ok'){
                alert("작성되었습니다.")
            }
            else{
                alert("작성실패")
            }

            replyShowAjax(1,drawReply);
        },
        error:function(){
            alert("서버오류")
        }
    })

}
  
//댓글 목록 ajax
function replyShowAjax(pageNo,callback){

    $.ajax({
        type:'GET',
        url:contextPath+'/detailViewReply.view',
        data:{boardNo:boardNo,
              pageNo:pageNo},
        success:function(response){
            callback(response.replys)
        },
        error:function(){
            alert("서버오류")
        }
    })
}