
//답글작성버튼 클릭시 답글 영역 보이게 한다.
function replyShowInsert(id) {

   let replyContent = document.querySelector("#reply-content" + id);

   if (replyContent.style.display === "none") {
      replyContent.style.display = "flex";
   }
   else {
      replyContent.style.display = "none";
   }

}


//댓글 입력
function replyInsert(pageNo=1) {
   let replyButton = document.querySelector("#replyButton");
   replyButton.onclick = function () {
      let replyContent = document.querySelector("#replyText")
      console.log(replyContent.value)
      replyInsertAjax({
         replyNo: -1,
         content: replyContent.value,
         boardNo: boardNo,
         pageNo:pageNo
      });
   }



}

//답글 입력
function replyReplyInsert(replyNo,pageNo=1) {
   console.log(replyNo)
   let replyContent = document.querySelector("#replyReplyText" + replyNo)

   console.log(replyContent.value)
   replyInsertAjax({
      replyNo: replyNo,
      content: replyContent.value,
      boardNo: boardNo,
      pageNo:pageNo
   });
}


//댓글 그리기
function drawReply(replys) {
   let boardReplyList = document.querySelector("#board-reply-list");


   let replycontent = "";
   let replyReplyContent = "";


 
   

   for (let r of replys) {

      for (let rr of r.replyReply) {
         replyReplyContent += `
                      <div class="board-reply-box re-reply-width">
                                                <div class="board-reply-profile"><img src="${rr.replyUserProfile.filePath}${rr.replyUserProfile.changeName}" alt=""></div>
                                                <div class="board-reply-content">
                                                    <div class="reply-title-box">
                                                        <div>
                                                            <span class="reply-user">${rr.userNickName}</span>
                                                            <span class="reply-date">${rr.createDate}</span>
                                                        </div>
                                                        <div class="change-box">
                                                            <div class=""><a>수정하기</a></div>
                                                            <div class="" data-toggle="modal" data-target="#delete-content"><a>삭제하기</a></div>
                                                        </div>
                                                    </div>
                                                    <div class="reply-content">${rr.content}</div>
                                                </div>
                                            </div>
   
   
      `
      }

     replycontent += `
             <div class="board-reply-box">
                                        <div class="board-reply-profile">
                                            <img src="${r.replyUserProfile.filePath}${r.replyUserProfile.changeName}"alt="">
                                        </div>
                                        
                                        <div class="board-reply-content">
                                            <div class="reply-title-box">
                                                <div>
                                                    <span class="reply-user">${r.userNickName}</span>
                                                    <span class="reply-date">${r.createDate}</span>
                                                    <button  type="button" onclick="replyShowInsert('${r.replyNo}')">답글 달기</button>
                                                </div>
                                                
                                                <div class="change-button-box">
                                                    <img src="resources/community/threeCircle.png" alt="">
                                                    <div class="change-box">
                                                        <div class=""><a>수정하기</a></div>
                                                        <div class="" data-toggle="modal" data-target="#delete-content"><a>삭제하기</a></div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="reply-content">${r.content}</div>
                                        </div>

                                    </div> 
         `
          + replyReplyContent +

         `

                             
                                    <div id="reply-content${r.replyNo}" style="display:none;" class="re-reply-width board-reply-box">
                                       
                                            <div class="reply-regist-info">
                                                <div>
                                                    <img src="" alt="">
                                                    <span>ㄴ</span>
                                                </div>
                                                <div  class="replybutton-div"><button  type="button"id="replyReplyButton" class="common-button pink-button" onclick="replyReplyInsert('${r.replyNo}')">답글 등록</button></div>
                                            </div>
                                            <div class="input-reply-div">
                                                <div class="replytext-div"><textarea id="replyReplyText${r.replyNo}" class="reply-textarea gray-round-box" placeholder="댓글을 입력하세요."></textarea></div>
                                            </div>
                                     
                                    </div>
   
   
   `
    replyReplyContent=""


   }

   boardReplyList.innerHTML = "";
   boardReplyList.innerHTML=replycontent;

}


//페이징 처리 

function replyPaging(pageNo){

    replyShowAjax({
        boardNo:boardNo,
        pageNo:pageNo
    },drawReply)

}

function drawingPage(replyPi){
    let pageDiv=document.querySelector("#page-div");
    let previousButton="";
    let nextButton=""
    let page=""

   

     if(replyPi.currentPage ==1){
        previousButton=`<div id="previous-button" class="prv-button">
					<li class="page-disabled"><a class="page-button">◀</a></li>
			   </div>`
     }
     else{
        previousButton=`
          <li><a class="page-button"
				onclick="replyPaging('${replyPi.currentPage-1}')">◀</a>
         </li>
        `
     }

     for(let p=replyPi.startPage; p<=replyPi.endPage; p++){
        page+=`
        <li class="page-item">
            <a class="page-link" onclick="replyPaging('${p}')">${p}</a>
	    </li>`
     }

     if(replyPi==replyPi.maxPage){
        nextButton=`
          <div id="next-button" class="next-button">
				<li class="page-disabled"><a class="page-button">▶</a></li>
		</div>        
        `
     }
     else{
        nextButton=`
            <div id="next-button" class="next-button">
				<li><a class="page-button"
				 onclick="replyPaging('${replyPi.currentPage+1}')">▶</a></li>
			</div>
        `
     }

     pageDiv.innerHTML=previousButton+page+nextButton

}
