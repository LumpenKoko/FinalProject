function clickGood(){

    let goodButton=document.querySelector("#goodCount");
    goodButton.addEventListener("click",function(){
        updateGoodCountAjax(boardNo);
    })
}