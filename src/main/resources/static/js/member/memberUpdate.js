/*console.log("member update");

let btn = document.getElementById("pwUpdateBtn");
let errCode = document.getElementById("errCode");
let email = document.getElementById("email");

btn.addEventListener("click",()=>{
	alert("btn click");
	
	location.reload(true);
});


email.addEventListener("focusout",()=>{
	errCode.innerHTML = `<span id="errCode" style="color:red">nono</span>`;
	 가입자중에 입력받은 이메일/이름 을 가진 회원이있는지 
	fetch("/member/findPw",{
		method:"POST",
		headers:{
			"Content-Type":"application/json"
		},
		body:JSON.stringify({
			
		})
		
	})
	.then((res) => console.log(res));
});

*/