

function drawShorts(shorts){
   let shortContentDiv=document.querySelector("#short-content");
   let shortContent=""
   for(let s of shorts){
      shortContent+=`<a href="${contextPath}/shortsView.bo?shortNo=${s.shortsNo}">
            <div class="short-img-div">
                <div class="short-img">
                    <img src="${(s.attachment==null)?"resources/img/default/cat1.jpg":s.attachment.filePath+s.attachment.changeName}">
                    <div class="img-detail">
                        <div style="font-weight: bold; font-size:20px;">${s.userNo}
                        </div><br>
                        <div>${s.enrollDate}</div>
                        <div>${s.shortsContent}</div>
                    </div>
                </div>
            </div>
        </a>`
   }
   shortContentDiv.innerHTML=shortContent;
}

function drawPage(communityPi){
    let pageDiv=document.querySelector("#page-div");
    let previousButton="";
    let pageNums="";
    let nextButton="";

    if(communityPi.currentPage==1){
        previousButton=`
            <div id="previous-button" class="prv-button">
                <li class="page-disabled"><a class="page-button">◀</a></li>
            </div>
         `
    }
    else{
        previousButton=`
            <div id="previous-button" class="prv-button">
                <li><a class="page-button"
                    onclick="pagIngShorts('${communityPi.currentPage-1}')">◀</a>
                </li>
            </div>
        `
    }


    for(let p=communityPi.startPage; p<=communityPi.endPage; p++){
        pageNums+=`
            <li class="page-item"><a class="page-link" onclick="pagIngShorts('${p}')">${p}</a></li>
        `
    }

    if(communityPi.currentPage == communityPi.maxPage){
        nextButton=`
         <div id="next-button" class="next-button"><li><a class="page-button">▶</a></li></div>
        `
    }

    else{
        nextButton=`
         <li><a class="page-button"
             onclick="pagIngShorts('${communityPi.currentPage+1}')">▶</a>
          </li>
        `
    }

    pageDiv.innerHTML=previousButton+pageNums+nextButton;


}