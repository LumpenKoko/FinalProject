let contextPath=""


function init(path,masterKind){
    // if(targetId==="NNNNN"){
    //     targetId="toribro12345";
    //     //userId
    // }
    contextPath=path


    //유저가 일반 유저면 사장님 target가져오고 바로 웹소켓(채팅방 열기)
    if(masterKind==='NNNNN'){
       targetId=document.querySelector("#masterId").value
      // roomNo=document.querySelector("#roomNo").value
       targetNo=document.querySelector("#masterNo").value
       console.log("masterId",targetId, targetNo)
       openChatRoom(1,targetId,targetNo)
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
        console.log(ev)
        const recevie =JSON.parse(ev.data);
        console.log(recevie);

        console.log("check:",recevie.userNo)
        console.log("check1",document.querySelector("#userKey").value)
        if(recevie.userNo===parseInt(document.querySelector("#userKey").value)){
         

            msgContainer.innerHTML+=`
                <div class="send-master">
                                <div class="master-profile">
                                    <div class="img-div">
                                        <img src="resources/img/tori.jpg">
                                    </div>
                                    <div class="master-name title">${recevie.nick}</div>
                                </div>
                                <div class="content master-content master-color">
                                        <div> ${recevie.msg} </div>
                                    <div class="time">${now.getHours()}:${now.getMinutes()}</div>
                                </div>
                        </div>
            `
        }
    }

    sendButton.onclick=function(){
        let sendMsg=document.querySelector("input[name=msg]");
        const now = new Date();	
        const msgData = {
            message:sendMsg.value,
            target:targetId,
            roomNo:roomNo,
            targetNo:targetNo
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
                        <div class="time">${now.getHours()}:${now.getMinutes()}</div>
                       </div>
                   </div>
   
             `
             sendMsg.value=""

    



    }




}

//채팅방 선택(현재 내가 사장일때)
function chooseChatRoom(roomNo,id){
 //선택시 채팅 목록에 유저 넘어 키값 부여하기?
 document.querySelector("#userKey").value=id;


  alert("채팅방에 연결되었습니다.")
   console.log(id)
   let masterId=document.querySelector("#master-id");

   let userId=document.querySelector("#userId"+id);
   let userNo=document.querySelector("#userNo"+id);
   targetId=userId.value;
   targetNo=userNo.value;


    //채팅 목록 불러와서 먼저 띄워주기
    onloadChatList({
        userNo:masterId.value,
        targetNo:userNo
    },drawChatList);


  

    openChatRoom(roomNo,targetId,targetNo);
}


function drawChatList(chatList){

  let chatDiv=document.querySelector("#chatMsg");
  let content="";

   for(let chat of chatList ){

       if(chat.userNo ===document.querySelector("#master-id").value){
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
						<img src="resources/img/tori.jpg">
					</div>
					 <div class="master-name title">사장님</div>
				</div>
				<div  class="content master-content master-color">
						<div>${chat.userNickName}</div>
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
            callback(response)
        },
        error:function(){
            alert("에러발생")
        }


    })
}



