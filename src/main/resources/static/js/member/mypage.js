console.log("mypage js");

let check = document.getElementById('check');
let checkout = document.getElementById('checkout');

let updateMypage = document.getElementById('updateMypage');

/* 출퇴버튼 이벤트 */
check.addEventListener("click",()=>{
	check.classList.add('visually-hidden');
	checkout.classList.remove('visually-hidden');
});

let phone = document.getElementById("phone");
let email = document.getElementById("email");
let userId = document.getElementById("user_id");
let memberId = document.getElementById("member_id");

function update(){
	console.log("수정");
	console.log(updateMypage.value);
	let form = new FormData(updateMypage);
	form.append('phone',phone.value);
	form.append('email',email.value);
	console.log(form)
	console.log(phone.value, email.value);
	
	fetch("/member/mypage",{
		method:'POST',
	    headers:{'content-Type':'application/json', 'charset':'utf-8'},
        body:JSON.stringify({
			member_id:memberId.value,
			user_id:userId.value,
			email:email.value,
			phone:phone.value
		})
	})
	.then(res => res)
	.then(res => res);
}