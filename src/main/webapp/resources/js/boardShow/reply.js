
//답글작성버튼 클릭시 답글 영역 보이게 한다.
function replyShowInsert(id){
 
    let replyContent= document.querySelector("#reply-content"+id);
 
    if(replyContent.style.display==="none"){
       replyContent.style.display="flex";
    }
    else{
       replyContent.style.display="none";
    }
 
 }


 //댓글 입력
 function replyInsert(){
         let replyButton=document.querySelector("#replyButton");
         replyButton.onclick = function(){
         let replyContent = document.querySelector("#replyText")
         console.log(replyContent.value)
         replyInsertAjax({replyNo:-1,
                    content:replyContent.value,
                    boardNo:boardNo});
         }



 }

//답글 입력
 function replyReplyInsert(replyNo){
      console.log(replyNo)
      let replyContent = document.querySelector("#replyReplyText"+replyNo)

      console.log(replyContent.value)
      replyInsertAjax({replyNo:replyNo,
               content:replyContent.value,
               boardNo:boardNo});
}


//댓글 그리기
function drawReply(replys){
 let boardReplyList=document.querySelector("#board-reply-list");
 let content="";




}