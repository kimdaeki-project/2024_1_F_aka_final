let temp = document.getElementById("temp");
let region = document.getElementById("region");
let statusResult = document.getElementById("status");
fetch("/weather/wc",{
  method:"GET",
}).then(res=>{return res.json()})
.then(res=>{
    temp.innerHTML = res.temp;
    region.innerHTML = res.region;
    if(res.status==0){
        statusResult.innerHTML = "<i class='bx bx-sun'></i>"
    }else if(res.status==1||2||5||6){
        statusResult.innerHTML = "<i class='bx bx-cloud-rain'></i>"
    }else if(res.status==3||7){
        statusResult.innerHTML = "<i class='bx bx-cloud-snow'></i>"
    }
})