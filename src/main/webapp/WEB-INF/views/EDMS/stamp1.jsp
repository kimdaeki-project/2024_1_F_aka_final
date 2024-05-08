<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="d-flex justify-content-center" style=" height: 90vh; display: grid; place-items: center;">
    <div class="col-md-6 col-lg-4 mb-3 ">
        <form id="stampForm">
            <div class="card h-100">
                <img class="card-img-top" src="" id="preview" >
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">
                        도장사진을 넣어 주세요
                    </p>
                    <input type="file" multiple accept="image/*" name="img" onchange="readURL(this);"/>  
                    <button type="button" id="addStamp" class="btn btn-primary"> 도장등록</button>
                </div>
            </div>
    </form>
</div>
</div>
<script>
	const addStamp = document.getElementById("addStamp");


	function readURL(input) {
        
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                document.getElementById('preview').src = e.target.result;
            };
            reader.readAsDataURL(input.files[0]);
        } else {
            document.getElementById('preview').src = "";
        }
    }
    
    
	addStamp.addEventListener('click', function(){
		let stampForm = document.getElementById("stampForm");
		if(confirm('등록하시겠습니까??')){
		let formData = new FormData(stampForm);
		fetch('crateStamp',{
			  method: "POST",						
	            body: formData				
	            }).then(response => response.json())
	            .then(data=>{
	                console.log(data.path)
	                if(data.result>0){
	                    alert(data.msg);
	                    window.location.href=data.path;
	                    
	                }else{
	                    
	                    alert("실패하였습니다.")
	                }
	                
	            })					
			
		}
		})
    

    


</script>