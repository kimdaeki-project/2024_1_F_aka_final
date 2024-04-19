console.log("register js")
let userid = document.getElementById("userId");
let errId = document.getElementById("errId");

let username = document.getElementById("username");
let errUsername = document.getElementById("errUsername");

let email = document.getElementById("email");

let phone = document.getElementById("phone");
let phoneErr = document.getElementById("phoneErr");

let password = document.getElementById("password");
let passwordErr = document.getElementById("passwordErr");

let passwordCheck = document.getElementById("passwordCheck");
let passwordChErr = document.getElementById("passwordChErr");

let registerBtn = document.getElementById("registerBtn");
let termsConditions = document.getElementById("terms-conditions"); 

userid.addEventListener("focusout", ()=>{
	if(userid.value.length > 6 && userid.value.length < 12){
		errId.innerHTML = `<span style="color: green;">사용할수있는 아이디입니다.</span>`;
	}else{
		errId.innerHTML	= `<span style="color: red;">아이디는 6자이상 12자이하입니다.</span>`;
	}
	
	let userIdReg = /^(?![0-9])(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]{6,12}$/;
	
	if(!userIdReg.test(userid.value)){
		errId.innerHTML	= `<span style="color: red;">숫자와 영어를 섞어사용해주세요</span>`;
	}
});

/*username.addEventListener("focusout",()=>{
	let usernameReg = /^\s*$/;
	errUsername.innerHTML = `<span style="color: red;">값을 입력해주세요.</span>`;
	if(!usernameReg.test(username)){
		errUsername.innerHTML = `<span style="color: green;">사용가능합니다.</span>`;
	}
});*/

email.addEventListener("focus",()=>{
	
});


document.getElementById('domainSelect').addEventListener('change', ()=> {
    let domainSelect = document.getElementById('domainSelect');
    let emailInput = document.getElementById('email');

    if (domainSelect.value === '0') {
        emailInput.placeholder = "Enter your email";
        emailInput.value = "";
        emailInput.readOnly = false;
    } else {
        emailInput.placeholder = "Enter your email";
        emailInput.value = domainSelect.options[domainSelect.selectedIndex].text;
    }
});


password.addEventListener("blur",()=>{
		
        // 정규식을 생성합니다.
        let passwordRegex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{8,12}$/;

        // 비밀번호가 정규식과 일치하는지 검사합니다.
        if (!passwordRegex.test(password.value)) {
            // 비밀번호가 정규식과 일치하지 않는 경우, 에러 메시지를 표시합니다.
            passwordErr.innerHTML = `<span style="color:red;">비밀번호는 8자 이상 12자 이하이며, 영문, 숫자, 특수문자를 포함해야 합니다.</span>`;
        } else {
            // 비밀번호가 정규식과 일치하는 경우, 에러 메시지를 지웁니다.
            passwordErr.innerHTML = "";
        }
});

passwordCheck.addEventListener("blur",()=>{
	
	if(password.value != passwordCheck.value){
		passwordChErr.innerHTML = `<span style="color:red;">비밀번호가 일치하지않습니다.</span>`;
	}else{
		passwordChErr.innerHTML = "";
	}
});

phone.addEventListener("blur", ()=>{
	let ps = phone.value;
	console.log(ps.indexOf('-'));
	if(ps.indexOf('-') > 1){
		phoneErr.innerHTML = `<span style="color:red;">ㅤ-ㅤ빼고 입력해주세요.</span>`;	
	}else{
		phoneErr.innerHTML = "";
	}
});



/* null, empty, 빈값들 체크메서드*/
const isEmpty = (input) => {
	if(typeof input === "undefined" ||
		input === null || 
		input === "" ||
		input.length === 0 ||
		(typeof input === "object "&& !Object.keys(input).length)){
			return true;
		}
	else return false;
}

/* input값이 null이면 submit하지 않도록 막는 method */
registerBtn.addEventListener("click",(event)=>{
	/*userid,username,email,phone,password,passwordCheck,termsConditions*/
	let msg = "";

	if(isEmpty(userid.value)){
		msg += "아이디";
	}
	if(isEmpty(username.value)){
		msg += ",사용자이름";
	}
	if(isEmpty(phone.value)){
		msg += ",전화번호";
	}
	if(isEmpty(password.value)){
		msg += ",비밀번호";
	}
	if(!termsConditions.checked){
		msg += ",체크박스";
	}
	if(msg.charAt(0) == ','){
		msg = msg.replace(",","");		
	}
	console.log(isEmpty(msg))	
	if(!isEmpty(msg)){
		alert(msg+"를 확인해주세요");
		event.preventDefault(); // 클릭 동작 취소
	}	
})

