const urlStrPicked = window.location.href;
const url = new URL(urlStrPicked);
let boardNo;
let contextPath;


function init(path){
    console.log(path)

    contextPath=path
   
    const urlParams =url.searchParams
    boardNo=urlParams.get('bno')

    //답글 입력
    replyInsert();

    //좋아요
    clickGood();
}


