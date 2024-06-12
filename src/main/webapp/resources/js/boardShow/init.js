
function init(){



}



function replyInsert(id){
 
   let replyContent= document.querySelector("#reply-content"+id);

   if(replyContent.style.display==="none"){
      replyContent.style.display="flex";
   }
   else{
      replyContent.style.display="none";
   }

}