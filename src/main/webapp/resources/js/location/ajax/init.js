
let contextPath;
let userNo;
let spaceNo=2;

let statusResult='';
//비동기처리 초기화 함수
function init(path,userNum){
    // heartClick();
  
    //path와 유저,공간번호 초기화
   contextPath=path;
   userNo=userNum;



   ///찜

   //페이지 로딩될때 이공간에대한 전체 찜개수 먼저 불러온다.
   pickedCount({locationNo:spaceNo},(count)=>{
     setPickedCount(count);
   });

   //페이지 로딩될때 유저의 찜한 상태를 가져온다.
   pickedState({locationNo:spaceNo,userNo:userNo},(status)=>{
     statusResult= getUserPickedState(status);//상태 초기화
     //하트 클릭시 유저가 찜하거나 찜해제한다. (상태 검사부터) 
     
   })

   clickHeart({locationNo:spaceNo,userNo:userNo},pickedCount);


}