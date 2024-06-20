let contextPath=""
let locationNo=""

const urlStrPicked = window.location.href;
const url = new URL(urlStrPicked);

function init(path,masterKind){
    // if(targetId==="NNNNN"){
    //     targetId="toribro12345";
    //     //userId
    // }
    contextPath=path
    const urlParams =url.searchParams
    console.log(urlParams)
    locationNo= (urlParams.get("locationNo")!=null)?urlParams.get("locationNo"):0;
    console.log(locationNo)

    //유저가 일반 유저면 사장님 target가져오고 바로 웹소켓(채팅방 열기)
    if(masterKind==='NNNNN'){
       targetId=document.querySelector("#masterId").value
      // roomNo=document.querySelector("#roomNo").value
       targetNo=document.querySelector("#masterNo").value
       openChatRoom(1,targetId,targetNo)
    }
    //사장님일때도 먼저 소켓을 연결한다. (알림창때문)
    else{

        const socket = new WebSocket(contextPath+"/server");
   

        socket.onopen=function(){
            console.log("웹소켓 연결 성공..");
        }
    
        socket.onclose = function(){
            console.log("웹소켓 연결 끊어짐...");
        }
    
        socket.onerr = function(){
            console.log("웹소켓 연결 실패....")
            alert("웹소켓 연결 실패")
        }
    
        socket.onmessage=function(ev){
           const now =new Date();
            const recevie =JSON.parse(ev.data);
            //유저목록 count 증가 시킨다. 
            //let userNo=document.querySelector("#userKey").value
            if(document.querySelector("#notifyCount"+recevie.userNo)===null){
                let notifyCount=document.createElement("div");
                notifyCount.id="notifyCount"+recevie.userNo
                notifyCount.className="notify"
                notifyCount.innerText=1
                console.log(notifyCount)
                document.querySelector("#notice"+recevie.userNo).appendChild(notifyCount)
            }   
            else{
            document.querySelector("#notifyCount"+recevie.userNo).innerHTML=
            parseInt(document.querySelector("#notifyCount"+recevie.userNo).innerText)+1;
        }
         document.querySelector("#content"+recevie.userNo).innerHTML=recevie.msg;
         document.querySelector("#date"+recevie.userNo).innerHTML=`${now.getFullYear()}-${(now.getMonth()+1)>=10?now.getMonth():'0'+now.getMonth()}-${now.getDate()} ${now.getHours()}:${now.getMinutes()}:${now.getSeconds()}`
      }
    
    }
}

function openChatRoom(roomNo,targetId,targetNo){

   
    let sendButton = document.querySelector("#send-button");
    let msgContainer = document.querySelector("#chatMsg");

    const socket = new WebSocket(contextPath+"/server");
   

    socket.onopen=function(){
        console.log("웹소켓 연결 성공..");
    }

    socket.onclose = function(){
        console.log("웹소켓 연결 끊어짐...");
    }

    socket.onerr = function(){
        console.log("웹소켓 연결 실패....")
        alert("웹소켓 연결 실패")
    }

    socket.onmessage=function(ev){

        const now = new Date();	
        const recevie =JSON.parse(ev.data);
     
        let sendUserNo=parseInt(document.querySelector("#userKey").value);

        if(recevie.userNo===sendUserNo){
         

            msgContainer.innerHTML+=`
                <div class="send-master">
                                <div class="master-profile">
                                    <div class="img-div">
                                        <img src="resources/img/default/default_profile.jpg">
                                    </div>
                                    <div class="master-name title">${(recevie.nick!==undefined)?recevie.nick:"사장님"}</div>
                                </div>
                                <div class="content master-content master-color">
                                        <div> ${recevie.msg} </div>
                                    <div class="time">${now.getFullYear()}-${(now.getMonth()+1)>=10?now.getMonth():'0'+now.getMonth()}-${now.getDate()} ${now.getHours()}:${now.getMinutes()}:${now.getSeconds()}</div>
                                </div>
                        </div>
            `
    }
     else{

         //자신한테 오는 메세지가 아니면 카운트표시만 증가시킨다.
        //유저목록 count 증가 시킨다. 
          //let userNo=document.querySelector("#userKey").value
          if(document.querySelector("#notifyCount"+recevie.userNo)===null){
            let notifyCount=document.createElement("div");
            notifyCount.id="notifyCount"+recevie.userNo
            notifyCount.className="notify"
            notifyCount.innerText=1
            console.log(notifyCount)
            document.querySelector("#notice"+recevie.userNo).appendChild(notifyCount)
        }   
        else{
           document.querySelector("#notifyCount"+recevie.userNo).innerHTML=
           parseInt(document.querySelector("#notifyCount"+recevie.userNo).innerText)+1;
       }
           document.querySelector("#content"+recevie.userNo).innerHTML=recevie.msg;
           document.querySelector("#date"+recevie.userNo).innerHTML=`${now.getFullYear()}-${(now.getMonth()+1)>=10?now.getMonth():'0'+now.getMonth()}-${now.getDate()} ${now.getHours()}:${now.getMinutes()}:${now.getSeconds()}`

     }


    }

    sendButton.onclick=function(){
        let sendMsg=document.querySelector("input[name=msg]");
        const now = new Date();
        const msgData = {
            message:sendMsg.value,
            target:targetId,
            roomNo:roomNo,
            targetNo:targetNo,
            locationNo:locationNo
        }
        console.log(msgData)
        socket.send(JSON.stringify(msgData));
      
        //유저 넘버에따라서 출력하기?
        //특정 유저 메세지만 출력해주기
        // 클릭했을때 키값을 넘기면 된다.  

       
            msgContainer.innerHTML+=`
            <div class="send-user">
                       <div>To:${targetId}</div>
                       <div class="content  user-content user-color">
                           <div>${sendMsg.value}</div>
                        <div class="time">${now.getFullYear()}-${(now.getMonth()+1)>=10?now.getMonth():'0'+now.getMonth()}-${now.getDate()} ${now.getHours()}:${now.getMinutes()}:${now.getSeconds()}</div>
                       </div>
                   </div>
   
             `
             sendMsg.value=""

        }
    }



////////
//채팅방 선택(현재 내가 사장일때)
function chooseChatRoom(roomNo,id){
 //선택시 채팅 목록에 유저 넘버 키값 부여하기?
  document.querySelector("#userKey").value=id;
  let masterNo=document.querySelector("#master-No");

   let userId=document.querySelector("#userId"+id);
   let userNo=document.querySelector("#userNo"+id);
   targetId=userId.value;
   targetNo=userNo.value;

   
   //유저닉네임 채팅목록에 띄워주기
   document.querySelector("#chattingUser").innerText=document.querySelector("#userNickName"+id).innerText;
   // 채팅 목록 불러와서 먼저 띄워주기
    onloadChatList({
        userNo:masterNo.value,
        targetNo:userNo.value
    },drawChatList);

    openChatRoom(roomNo,targetId,targetNo);
    alert("채팅방에 연결되었습니다.")
}


function drawChatList(chatList){

  let chatDiv=document.querySelector("#chatMsg");
  let content="";
   
   for(let chat of chatList ){
     

       if(chat.userNo=== parseInt(document.querySelector("#master-No").value)){
         content+=`
            	<div class="send-user">
						<div class="content  user-content user-color">
								<div>${chat.message}</div>
									<div class="time">${chat.enrollTime}</div>
								</div>
						</div>
                 </div>
         `
       }else{
         content+=`
            <div class="send-master">
				<div class="master-profile">
					<div class="img-div">
						<img src="resources/img/default/default_profile.jpg">
					</div>
					 <div class="master-name title">${chat.userNickName}</div>
				</div>
				<div  class="content master-content master-color">
					    <div>${chat.message}</div>
						<div class="time">${chat.enrollTime}</div>
				</div>
			</div>
         
         `
       }

    }

    chatDiv.innerHTML=content;



}

function onloadChatList(data,callback){
 
    $.ajax({
        url:contextPath+"/view.chat",
        data:data,
        success:function(response){
            console.log(response)
            callback(response)
            if(document.querySelector("#notifyCount"+data.targetNo)){
                document.querySelector("#notifyCount"+data.targetNo).remove();
                document.querySelector("#content"+data.targetNo).innerHTML="";
                document.querySelector("#date"+data.targetNo).innerHTML="";
            }
          
        },
        error:function(){
            alert("에러발생")
        }
    })

  
}