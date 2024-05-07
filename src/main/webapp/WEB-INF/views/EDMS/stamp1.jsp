<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="d-flex justify-content-center" style=" height: 90vh; display: grid; place-items: center;">
    <div class="col-md-6 col-lg-4 mb-3 ">
        <form action="crateStamp" method="post" enctype="multipart/form-data">
            <div class="card h-100">
                <img class="card-img-top" src="../assets/img/elements/2.jpg" id="preview" >
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">
                        도장사진을 넣어 주세요
                    </p>
                    <input type="file" multiple accept="image/*" name="img" onchange="readURL(this);"/>  
                    <button type="submit" class="btn btn-primary"> 도장등록</button>
                </div>
            </div>
    </form>
</div>
</div>
<script>
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



</script>