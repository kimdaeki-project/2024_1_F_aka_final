console.log("mypage js");

let check = document.getElementById('check');
let checkout = document.getElementById('checkout');

let updateMypage = document.getElementById('updateMypage');

/* 출퇴버튼 이벤트 */
check.addEventListener("click",()=>{
	if(confirm("출근하시겠습니까?")){
		check.classList.add('visually-hidden');
		checkout.classList.remove('visually-hidden');
		createCheck();	
	}
	
	
});

function createCheck(){
	fetch("/member/mypage/schedule",{
		method:"POST",
		headers:{
			"Content-Type": "application/json charset=utf-8"
		},
		body:JSON.stringify({
			schedule_id:schduleId.value,
			member_id:memberId.value,
			start_date:startDate.value,
			end_date:endDate.value,
			date:date.value
		})
	})
	.then(res => res.json())
	e.preventDefault();
	check.classList.add('visually-hidden');
	checkout.classList.remove('visually-hidden');
}

let phone = document.getElementById("phone");
let email = document.getElementById("email");
let userId = document.getElementById("user_id");
let memberId = document.getElementById("member_id");
let password = document.getElementById("password");
let passwordCheck = document.getElementById("passwordCheck");

function update(){
	fetch("/member/mypage",{
		method:'POST',
	    headers:{'content-Type':'application/json;charset:utf-8;'},
        body:JSON.stringify({
			member_id:memberId.value,
			user_id:userId.value,
			email:email.value,
			phone:phone.value,
			password:password.value,
			passwordCheck:passwordCheck.value
		})
	})
	.then(res => res)
	.then(res => console.log(res));
	
	document.getElementById('modalClose').click();

	alert("다시 로그인해 주세요.");		
	
	setTimeout(function(){
		location.href="/member/logout";
	},500)
}