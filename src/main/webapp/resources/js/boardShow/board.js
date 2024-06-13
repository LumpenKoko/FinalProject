function clickGood(){

    let goodButton=document.querySelector("#good");
    goodButton.addEventListener("click",function(){
        updateGoodCountAjax(boardNo);
    })
}