

function reviewInsert(){
   // const dataTransfer = new DataTransfer();
    let reviewButton=document.querySelector('#review-submit');
    reviewButton.onclick = () =>{

        const formData= reviewData();

        $.ajax({
            type:"POST",
            url:contextPath+"/insert.re",
            contentType:false,
            // ajax 방식에서 파일을 넘길 때 반드시 false로 처리 -> multipart/form-data로 처리가 됨  
            processData:false,
            // dataType: "json",
            data:formData,
            success:function(result){
                alert("리뷰를 작성했습니다.")
                //리뷰기입하면 리뷰입력영역을 다 비어준다.
                document.querySelector("#review-content").value='';
                document.querySelector("#img-count").innerHTML=0;

                let restedFile=document.querySelector("#fileInput");
              
                // for(let i=0; i<restedFile.length; i++){
                //     dataTransfer.items.remove(restedFile[i])
                //   }

               dataTransfer.clearData();
                restedFile.value='';
              //  dataTransfer.clearData();
               // document.selection.clear();
                console.log("길이:",restedFile.files.length)
                document.querySelector("#img-background").style.backgroundImage
                =`url(resources/img/myPage/+.png)`;
              


                //리뷰 비동기로 다시 그려주기
                reviewSelect(drawReivew);

            },
            error:function(){
                console.log('fail')
            }

        })
    }
}

//리뷰 (작성후)조회 비동기
function reviewSelect(callback){

    $.ajax({
        type:"GET",
        url:contextPath+"/list.re",
        data:{locationNo:spaceNo},
        success:function(response){
            callback(response.reviews);
            drawPaging(response.page)
        },
        error:function(){
            console.log("리뷰 조회 실패")
        }

    })


}

//리뷰 삭제 비동기
//onclick="reviewDelete({userNo:2,locationNo:'${r.locationNo}',reviewNo:'${r.reviewNo}'}
function reviewDelete(num){
        console.log("리뷰 번호"+num);
        $.ajax({
            type:"POST",
            url:contextPath+"/delete.re",
            data:{
                reviewNo:num,
                userNo:userNo,
                locationNo:spaceNo

            },
            success:function(response){
            // callback(response);
                console.log(response)
                console.log("삭제 성공")
                reviewSelect(drawReivew);
            },
            error:function(errors){
                console.log("리뷰삭제 실패")
            }

        })

 }



//페이징 처리 비동기 함수 (숫자)

function reviewPaging(currentPage){

    $.ajax({
        type:"GET",
        url:contextPath+"/list.re",
        data:{locationNo:spaceNo,
             currentPage:currentPage
        },
        success:function(response){
            drawReivew(response.reviews)
            //페이지네이션 그리기
            drawPaging(response.page)
        },
        error:function(){
            console.log("페이징 처리 실패")
        }

    })

}

//화살표


// function reviewArrayPaging(currentPage){
//       console.log("누르기전"+currentPage)
//     $.ajax({
//         type:"GET",
//         url:contextPath+"/paging.re",
//         data:{locationNo:spaceNo,
//              currentPage:currentPage
//         },
//         success:function(response){
//             console.log("누른후:"+response)
//            // drawPaging(response)
//             currentPage=parseInt(response)+1
//             reviewPaging(currentPage);
//         },
//         error:function(){
//             console.log("페이징 실패")
//         }

//     })

// }