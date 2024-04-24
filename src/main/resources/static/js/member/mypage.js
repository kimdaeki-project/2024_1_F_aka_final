console.log("mypage js");

let check = document.getElementById('check');
let checkout = document.getElementById('checkout');

check.addEventListener("click",()=>{
	check.classList.add('visually-hidden');
	checkout.classList.remove('visually-hidden');
});