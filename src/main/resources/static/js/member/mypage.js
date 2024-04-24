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

function update(){
	console.log("수정");
	
	let form = new FormData(updateMypage);
	
	form.append('phone',phone.value);
	form.append('email',email.value);
	
	fetch("/member/mypage",{
		method:'POST',
	    
        body: form
	})
	.then(res => res.json())
	.then(res => res)
	.catch(error => console.error('Error:', error));
}