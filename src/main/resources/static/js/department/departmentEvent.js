let departmentBtn = document.getElementsByClassName("departmentBtn");

for(let btn of departmentBtn){     
    btn.addEventListener("click",(e)=>{
        let did = e.target.getAttribute("data-department_id");
        let pid = e.target.getAttribute("data-department_super_id"); 
        console.log(did);
        console.log(pid);
        for(btnn of departmentBtn){
            let didd = e.target.getAttribute("data-department_id");
            let pidd = e.target.getAttribute("data-department_super_id"); 
            if(btn.did==btnn.pidd){
                btnn.style.display="block";
                
            }
        }
        
        fetch("/department/member?department_id="+did,{
            method:"GET"
        }).then(res=>{return res.html()})
        .then(res=>{
            
        })
                    
    });
                 
}