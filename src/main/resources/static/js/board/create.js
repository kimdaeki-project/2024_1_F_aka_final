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
  
  const fileAdd = document.getElementById("fileAdd");
  const fileResult = document.getElementById("fileResult");
  let count = 0;
  fileAdd.addEventListener('click',()=>{ 
    count++;
    if(count==5){
      alert("첨부파일은 5개까지 가능합니다");
      fileAdd.style.display="none";
    }
    let formFileinput = document.createElement("input");
    let sum; 
    sum = document.createAttribute("type");
    sum.value = "file";
    formFileinput.setAttributeNode(sum);
    sum = document.createAttribute("class");
    sum.value = "form-control";
    formFileinput.setAttributeNode(sum);
    sum = document.createAttribute("name");
    sum.value = "boardFile";
    formFileinput.setAttributeNode(sum);
    sum = document.createAttribute("id");
    sum.value = "basic-default-name";
    formFileinput.setAttributeNode(sum);
    fileResult.appendChild(formFileinput);
  });