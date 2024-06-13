

function updateGoodCountAjax(boardNo){
     
    $.ajax({
        url:contextPath+'/updategoodcount.bo',
        type:"GET",
        data:{
            boardNo:boardNo
        },
        success:function(response){
            alert(response.message)
            document.querySelector("#goodCount").innerHTML=parseInt(response.goodCount);
        },
        error:function(){
            alert("공감실패")
        }
    })



}