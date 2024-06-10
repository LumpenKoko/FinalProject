
function init(contextPath,targetId){
    let sendButton = document.querySelector("#send-button");
    let msgContainer = document.querySelector("#MasterMsg");

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

    sendButton.onclick=function(){
        let sendMsg=document.querySelector("input[name=msg]");
        const now = new Date();	
        const msgData = {
            message:sendMsg.value,
            target:targetId
        }
        console.log(msgData)
        socket.send(JSON.stringify(msgData));
      
        msgContainer.innerHTML+=`
                 <div class="send-user">
							<div class="content  user-content user-color">
								<div>${sendMsg.value}</div>
							 <div class="time">${now.getHours()}:${now.getMinutes()}</div>
							</div>
						</div>
        
        `
       sendMsg.value=""


    }




}

