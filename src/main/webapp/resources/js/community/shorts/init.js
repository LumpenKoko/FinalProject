let userNo;

function init(userNo){
    userNo=userNo;
    onvideoThumnail();
    onVideo();
}


function onvideoThumnail(){
  const inputVideo=document.querySelector("#Thunmailfile");

  inputVideo.addEventListener("change",function(){
    const backgroundImg=document.querySelector("#Thumnail-background");
    let reader=new FileReader();
    let files=this.files;

    console.log("type:",files);

    if(files!=null&& files[0]!=null){

       
        reader.onload = (e) =>{
        backgroundImg.style.backgroundImage
        =`url(${e.target.result})`
       }
    }
    
    reader.readAsDataURL(files[0])

   })


}

function onVideo(){
  const videoFile=document.querySelector("#videoInput");
  const video=document.querySelector("#video");

  videoFile.addEventListener("change",function(){
    const file = videoFile.files[0];
    const videourl = URL.createObjectURL(file);
    video.setAttribute("src", videourl);
    video.play();
   })

}