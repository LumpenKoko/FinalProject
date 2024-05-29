

function onReplyOnClick(reviewNo){
  
   let replyContent=document.querySelector("#master-reply-div"+reviewNo)
   if(replyContent.style.display==='block'){
         replyContent.style.display='none'
   }else{
        replyContent.style.display='block'
   }
   

}