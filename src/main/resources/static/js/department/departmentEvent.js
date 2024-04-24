let departmentBtn = document.getElementsByClassName("departmentBtn");
let modaldis = document.getElementById("modalScrollable");
let modalResult = document.getElementById("modalResult");
let result = document.getElementById("result");
for(let btn of departmentBtn){     
    btn.addEventListener("click",(e)=>{
        let did = e.target.getAttribute("data-department_id");
        let pid = e.target.getAttribute("data-department_super_id"); 
        console.log(did);
        console.log(pid);
        $.ajax({
            url : "/department/member",
            data : { department_id:did}, 
            dataType : "html",
            type : "get",
            success : function(res){
            $("#modalResult").html(res); 
            $("#modaldis").attr("display","block");
            }
            });

                    
    });
                 
}