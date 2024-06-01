function pagIngBoard(currentPage,category=0){

    $.ajax({
        url:contextPath+"/boards",
        data:{
            boardPageNo:currentPage,
            boardCategoryNo:category
        },
        success:function(response){
            drawBoards(response.boards)
            drawBoardPage(response.page,category)
        },
        error:function(){
            console.log("에러")
        }

    })

}

function categoryAjax(category){
    console.log("category",category)
    $.ajax({
        url:contextPath+"/category",
        data:{
            boardCategoryNo:category
        },
        success:function(response){
            drawBoards(response.boards)
            drawBoardPage(response.page,category)
        },
        error:function(){
            console.log("에러")
        }

    })
}

function boardSearchAjax(){
    
}