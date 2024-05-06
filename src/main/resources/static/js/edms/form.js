


const addLineBtn = document.getElementById("addLineBtn"); //모달 여는 버튼
const addBtn = document.getElementById("addBtn"); //모달 확인버튼
const myModal = document.getElementById('myModal');
const largeModal = new bootstrap.Modal(document.getElementById('largeModal'));
const myInput = document.getElementById('myInput');
const applyBtn = document.getElementById('applyBtn');
const formelem = document.getElementById('formelem');	
const applyList = document.getElementById('applyList');
const applyOn = document.getElementById('applyOn');
const closeBtn = document.getElementById('closeBtn');
const delBtn = document.getElementById('delBtn');//결제선에서 제거하는 버튼
const tempApplyBtn = document.getElementById('tempApplyBtn');
let today = document.getElementById('today');
let appLine = document.getElementById('appLine');






today.valueAsDate = new Date();

addLineBtn.addEventListener('shown.bs.modal',function(){		
    myInput.focus()				
});

//모달 확인 버튼
addBtn.addEventListener('click',function(){
    
    //결제선 DIV 생성
    addApplyLine(appLine);

})

 function formChange(){
	
	let formType = document.getElementById('formType');
	let formNo = formType.value;
	
	let formImport = document.getElementById('formImport');
	
	if(formNo==1){
		
		formImport.innerHTML="";
		return;
		
	}
	
	fetch('importFrom?formNo='+formNo,{		
		method:"GET"
		})
		.then(data=>data.text())
		.then(data=>{
			console.log(data)
			formImport.innerHTML = "";
			formImport.innerHTML += data;
		})		

	
}



//파일 업로드

// const dataTranster = new DataTransfer()



// let files= [];

// inputFile.onchange=()=>{			
// 	// files.push(inputFile.files); 
// 	// fileUploadList.innerText =+ files[0].name; 
        
// 	Array.from(files)
//     .filter(file => file.lastModified != removeTargetId)
//     .forEach(file => {
//         dataTranster.items.add(file);
//     });

// 	document.querySelector('#file-input').files = dataTranster.files;
// 	console.log( dataTranster.files);
    
// }
    

//전자문서 저장 
applyBtn.addEventListener('click',function(){			
    applyFrom(1,"pro");
})

//전자문서 임시저장
tempApplyBtn.addEventListener('click',function(){

    applyFrom(2,"temp");

})


//폼 저장 함수(1=저장, 2=임시저장)
function applyFrom(check1, check){
    //결재선 배열 생성
    let appAr = document.querySelectorAll('.appForm');
    //결재선 확인
    if(appAr.length<2){
        
        alert("결재선을 추가하세요");
        return 1;
    }
            
    if(confirm('제출하시겠습니까??')){			
        let formData = new FormData(formelem);
        formData.append('type', check1);
        formData.append('check', check);
        //배열생성후 formdata에 값 추가
        for(let ar of appAr){
            let apAr =ar.getAttribute('value');				
            console.log("apAR   "+apAr)
            formData.append('appAr',apAr);			
        }
        for(const key of formData.keys()){

            console.log(key);
        }

        fetch("apply",{
            method: "POST",						
            body: formData				
            }).then(response => response.json())
            .then(data=>{
                console.log(data.path)
                if(data.result==1){
                    alert(data.msg);
                    window.location.href=data.path;
                    
                }else{
                    
                    alert("실패하였습니다.")
                }
                
            })							
        }


}



function check(result){

    console.log(result.edmsTitle)
    console.log(result);
    alert(result.result);

}





// jstree 초기화 함수



    //중요 속성, original, icon, state
    // root node는 parent를 #       
    $.jstree.defaults.core.themes.variant = "large";      

    //일반적으로 요렇게만 사용해도 충분!

    $("#jstree").jstree({
        "plugins": ["search","wholerow","types" ],
        "check_callback": true,  // 요거이 없으면, create_node 안먹음
        'core': {
            'data':{
                "url": '/edms/api/chart',
                'dataType':'json' // ajax로 요청할 URL                
                } 				
            },
        "types":{
            "member" :{
                "icon" : "bx bx-user" 
            },
            "dept" : {
                "icon" : "bx bxs-building"
            }

        }                        
        
    });    

function fSch() {
        console.log("껌색할께영");
        $('#jstree').jstree(true).search($("#schName").val());
    }


    //이벤트
    $('#jstree').on("changed.jstree", function (e, data) {
        console.log(data.selected);
    });

    // Node 열렸을 땡
  		let isAdded = false;     
    // Node 선택했을 땡
    //member임시 저장 변수
        let tem;
        let tempAr=[];

    $('#jstree').on("select_node.jstree", function (e, data) {
        tem=null;
        console.log("select했을땡", data.node.type);
        if(data.node.type=="member"){
            tem = data.node;
        }
        console.log(tem);
    });

    // 결제선 추가 이동버튼
    applyOn.addEventListener("click", function(){
        //결제선 추가
        applyAdd(tem,applyList)
    });


    //결제선 저장 및 오른쪽 이동
    function applyAdd(data, divId){
        
        console.log(tempAr);
        
        for(let t of tempAr){
            if(data.original.id==t.id){
                return;
            }
        }

        if(data==null){
            alert('결재자를 선택해 주세요');
            return;
        }
        if(tempAr.length>4 ){
            alert('결재자는 최대 5인까지 가능합니다.')
            return;
        }
        let json = JSON.stringify(data.original);
        let list = document.createElement('div'); 			
        list.setAttribute('class','draggable');
        list.setAttribute('draggable', 'true');
        let icoDrag= document.createElement('span');
        icoDrag.setAttribute('class', 'ico-drag');
        list.appendChild(icoDrag);
        let elDiv = document.createElement('div');
        elDiv.setAttribute('class', 'appline');
        elDiv.setAttribute('data-person',json);
        elDiv.innerText =  data.original.dept+" "+data.text;
        icoDrag.appendChild(elDiv)
        divId.appendChild(list);
        console.log('메홀ㅇ'+data.original.dept);
        tempAr.push(data.original);
        data=null;

    }
    
    //결재선 추가명단에서 제거할 사람 선택
        let target;
        
        applyList.addEventListener('click',function(e){
            target = e.target;
            console.log(target);
            
        })	
        // 제거버튼
        delBtn.addEventListener('click', e=>{	
            let ancester = target.closest('.draggable');	
            ancester.remove(); //element 제거
            let index = tempAr.indexOf(target.getAttribute('data-person'));
            console.log(index+"  "+target.getAttribute('data-person'));
            tempAr.splice(index,1);
            console.log(tempAr);

            target=null;
            

        })




    //결제선 div생성
    function addApplyLine(divId){
        
        let dataPeple = document.querySelectorAll('.appline');
        console.log(dataPeple)
        if(dataPeple.length<2){

            alert("결제자는 최소 2인 입니다.")
            return;
        }
        
        let dataAr = []; 
        for(let p of dataPeple){
            let dataPerson = JSON.parse(p.getAttribute('data-person'))
            dataAr.push(dataPerson);
            console.log(dataAr)

        }
        
        
        divId.innerHTML="";
        console.log(dataAr)

        for(let data of dataAr){
            console.log(data)
            let divForm=document.createElement('div');
            divForm.setAttribute('class',"col-auto ps-0 pe-0 ");
            let divPsis=document.createElement('div');
            divPsis.setAttribute('class',"applineG ");
            divPsis.innerText = data.POSITION_NAME;
            divForm.appendChild(divPsis);
            let divName=document.createElement('div');
            divName.setAttribute('class',"applineW ");
            divName.innerText = data.USERNAME;
            divForm.appendChild(divName);
            let divDate=document.createElement('div');
            divDate.setAttribute('class',"applineG ");
            divForm.appendChild(divDate);
            let dataInput = document.createElement('input');
            dataInput.setAttribute('type', 'hidden');
            dataInput.setAttribute('class','appForm');
            dataInput.setAttribute('value',data.MEMBER_ID);
            divForm.appendChild(dataInput);
            
            divId.appendChild(divForm);

            
        }
            
        alert("결제선이 추가 되었습니다.");
        console.log(largeModal);
        largeModal.hide();
        
    }



