      //섬머노트
      $('#summerBoard').summernote({
        placeholder: 'Hello stand alone ui',
        tabsize: 2,
        height: 400,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]
      });
  //파일추가 버튼 
  const fileAdd = document.getElementById("fileAdd");
  //파일 추가될위치 div
  const fileResult = document.getElementById("fileResult");
  //출력된 파일 개수
  let fileTotal = fileAdd.dataset.fileSize;
  //파일 최대 저장 갯수
  let count = 5;
  //저장된 파일들 옆 삭제버튼
  let fileDelete = document.getElementsByClassName("fileDelete");
  //버튼 안보이기
  if(fileTotal==count){
      fileAdd.style.display="none";  
    }

    //파일추가
    fileAdd.addEventListener('click',()=>{ 
      //파일 개수 최대 5
      if(fileTotal==count){
        alert("첨부파일은 5개까지 가능합니다");
        fileAdd.style.display="none";
        return;
      }
      //파일 요소 생성
      let formFileinput = document.createElement('input');
      let sum; 
      sum = document.createAttribute("type");
      sum.value = "file";
      formFileinput.setAttributeNode(sum);
      sum = document.createAttribute("class");
      sum.value = "form-control";
      formFileinput.setAttributeNode(sum);
      sum = document.createAttribute("name");
      sum.value = "attach";
      formFileinput.setAttributeNode(sum);
      sum = document.createAttribute("id");
      sum.value = "basic-default-name";
      formFileinput.setAttributeNode(sum);
      fileResult.appendChild(formFileinput);
      fileTotal++;
    });
  
  //파일 삭제
  for(let a of fileDelete){
    let fileNum = a.dataset.fileNum;
    a.addEventListener('click',()=>{
     if(confirm("파일 삭제 하시겠습니까? (복구 불가능합니다)")){
            fileAjax(fileNum);
            a.parentElement.remove();
            fileTotal--;
            fileAdd.style.display="block";
	     }else{
            
          }
        })
      }


  //파일 삭제 비동기 요청
  function fileAjax(Num){
    fetch("/board/fileDelete?boardfile_num="+Num,{
      method:"get"        
    }).then(res=>{return res.text()})
    .then(res=>{
      let result = res.trim();
      if(result==1){
        alert("삭제 성공");
      }else{
        alert("삭제 실패");
      }
    })
  }
  
  
  