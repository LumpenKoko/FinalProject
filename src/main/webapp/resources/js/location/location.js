

//header -img
function moveImg(index,imgPath){
  console.log("click"+imgPath)
  console.log(index)
  let headerImg=document.getElementById("headerImg");
  headerImg.style.background=`url(${imgPath})no-repeat center center/cover`
}

