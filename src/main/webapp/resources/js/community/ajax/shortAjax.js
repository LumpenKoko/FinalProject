

function pagIngShorts(currentPage){

    $.ajax({
        url:contextPath+"/shorts",
        data:{
            pageNo:currentPage
        },
        success:function(response){
            drawShorts(response.shorts)
            drawPage(response.page)
        },
        error:function(){
            console.log("에러")
        }



    })

}