//file
const dataTransfer = new DataTransfer();

function fileUpload(_this){
    let fileArr=_this.files;
    //console.log(file);
    if(fileArr!=null && fileArr.length>0){
     
      console.log("length:"+dataTransfer.files.length)

      if(dataTransfer.files.length==3){
        alert("file max count is 3")
        return false;
      }
      fileList( _this.files);

        dataTransfer.items.add(fileArr[0]);
        _this.files=dataTransfer.files;
        console.log("file-list:", _this.files);

        let reader = new FileReader();
        console.log('reader:',reader)
        reader.onload =(e)=>{
          document.getElementById("img-background").style.backgroundImage
          =`url(${e.target.result})`;
        }
        reader.readAsDataURL(fileArr[fileArr.length-1]);
        document.getElementById("img-count").innerText=_this.files.length;
        console.log("transfer = > ",dataTransfer.files)
        console.log("input Files =>", _this.files)
    }
}

function fileList(files){
    const fileList = document.getElementById('file-list');
    for(let i=0; i<files.length; i++) {
        const item = document.createElement('div');
        const fileName = document.createTextNode(files[i].name);
        const deleteButton = document.createElement('button');

        deleteButton.addEventListener('click', (event) => {
            item.remove();
            event.preventDefault();
            console.log( dataTransfer.items)
            dataTransfer.items.remove(files[i])
            if(dataTransfer.files.length==0){
              document.getElementById("img-background").style.backgroundImage
              =`url(resources/img/myPage/+.png)`;
            }
        
            document.getElementById("img-count").innerText=dataTransfer.files.length;
            // const deleteItem = document.createElement('input');
            // deleteItem.setAttribute("name", "deleteFilesId");
            // deleteItem.setAttribute("value", files[i].id);
            // deleteItem.setAttribute("type", "hidden");
            // fileList.appendChild(deleteItem);
        });

        deleteButton.innerText="X";
        item.appendChild(fileName);
        item.appendChild(deleteButton);
        fileList.appendChild(item);
    }


}

//review data

function reviewData(){
  const formData= new FormData();
  const starCount=document.querySelector('input[name="rating"]:checked');
  const content=document.querySelector("#review-content");
  const fileInput=document.querySelector("#fileInput");
 
    for(let file of fileInput.files){
      formData.append('files',file)
    }
  

  formData.append('userNo',2);
  formData.append('spaceNo',spaceNo)
  formData.append('starCount',starCount.value)
  formData.append('content',content.value)
  
 
  return formData
  
}


