

function reviewAjax(formData){
    let reviewButton=document.querySelector('#review-submit');
    reviewButton.onclick = () =>{
        $.ajax({
            type:"POST",
            url:contextPath+"/insertReview",
            contentType:false,
            // ajax 방식에서 파일을 넘길 때 반드시 false로 처리 -> multipart/form-data로 처리가 됨  
            processData:false,
            data:formData,
            success:function(result){
                console.log(result);
                document.querySelector("#review-content").value='';
                document.querySelector("#fileInput").value='';
                document.querySelector("#img-background").style.backgroundImage
                =`url(resources/img/myPage/+.png)`;
            
            },
            error:function(){
                console.log('fail')
            }

        })
    }
}


