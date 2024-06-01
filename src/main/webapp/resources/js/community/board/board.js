function drawBoards(boards){
  let boardContentDiv=document.querySelector("#board-content");
  let boardContent="";

  for(let b of boards){
    boardContent+=`
            <div class="grid-box board-area">

            <div class="board-flex-div">
                <div class="content-box">
                    <div class="profile">
                        <div class="img-div">
                            <img src="resources/img/review/tori.jpg">
                        </div>
                        <div>${b.userNickName}</div>
                        <div>${b.createDate}</div>
                    </div>
                    <div class="content-title">
                        <span class="category" style="font-size:18px;
                                 font-weight:bold;">${b.categoryName}</span>&nbsp;&nbsp;
                        <span class="">${b.boardTitle}</span>
                    </div>
                    <div class="content">
                        ${b.boardContent}

                    </div>
                    <div class="reply-count">
                        <span><a href="#">조회수${b.count}</a></span>&nbsp;&nbsp;
                        <span><a href="#">댓글${b.replyCount}</a></span>
                    </div>
                </div>
                <div class="img-box">
                    <img src="${b.attahment[0].filePath}${b.attahment[0].changeName}">
                </div>
            </div>
        </div>
     `
    }

  boardContentDiv.innerHTML=boardContent;

}

function drawBoardPage(boardPi,category){
    let pageDivs=document.querySelector("#page-board-div");
    let previousButton="";
    let pageNums="";
    let nextButton="";

    console.log("페이징"+boardPi)
    console.log(boardPi.currentPage)
    if(boardPi.currentPage==1){
        previousButton=`
            <div id="previous-board-button" class="prv-button">
                <li class="page-disabled"><a class="page-button">◀</a></li>
            </div>
        `
    }
    else{
        previousButton=`
            <div id="previous-board-button" class="prv-button">
                <li><a class="page-button"
                    onclick="pagIngBoard('${boardPi.currentPage-1}','${category}')">◀</a>
                </li>
            </div>
        `
    }


    for(let p=boardPi.startPage; p<=boardPi.endPage; p++){
        pageNums+=`
            <li class="page-item"><a class="page-link" onclick="pagIngBoard('${p}','${category}')">${p}</a></li>
        `
    }

    if(boardPi.currentPage == boardPi.maxPage){
        nextButton=`
        <div id="next-board-button" class="next-button"><li><a class="page-button">▶</a></li></div>
        `
    }

    else{
        nextButton=`
        <div id="next-board-button" class="next-button">
            <li><a class="page-button"
                    onclick="pagIngBoard('${boardPi.currentPage+1}','${category}')">▶</a>
            </li>
        </div>
        `
    }

   
    console.log(previousButton)
    console.log(pageNums)
    console.log(nextButton)
    pageDivs.innerHTML=previousButton+pageNums+nextButton;



}


function onClickCategory(){
  
    const catgegoryButtons= document.querySelectorAll("#category-box div>button");
    const clicked=function(){categoryAjax(this.dataset.categoryno)}
    catgegoryButtons.forEach((buttons)=>{buttons.addEventListener('click',clicked)})
  }
  