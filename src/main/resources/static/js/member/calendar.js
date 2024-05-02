console.log("calendar.js");


function fixTime(){
	
	let startDate = document.getElementById('start_date');
	let endDate = document.getElementById('end_date');
	if(startDate.value){
		let startDay = startDate.value.split('T')[0];
		let startTime = startDate.value.split('T')[1];
		
		startDate.value = startDay+'T'+startTime.split(':')[0]+':00';
	}
	if(endDate.value){
		let endDay	= endDate.value.split('T')[0];
		let endTime	= endDate.value.split('T')[1];
		
		endDate.value = endDay+'T'+endTime.split(':')[0]+':00';		
	}
	
}

document.getElementById('start_date').addEventListener('change', function() {
  fixTime();
});
document.getElementById('end_date').addEventListener('change', function() {
  fixTime();
});

function move(){
	if(confirm("추가완료")){
		location.href="../";	
	}
	location.href="../";
}

/*추가할때 fetch*/
function create(e){
	fetch('/calendar/create',{
		method:'POST',
		headers:{
			"Content-Type": "application/json; charset=utf-8"
		},
		body:JSON.stringify({
			member_id:memberId.value,
			title:title.value,
			start_date:startDate.value,
			end_date:endDate.value,
			content:content.value,
			target_object:targetOb.value
		})
	})
		.then(res => {
			console.log("왜 안돼?");
			if(res.ok){
				alert('일정추가');
				location.href="../";
			}
	}).catch(error => {
		console.log(error+"왜");
	})
}

/* 페이지 불러오기 */
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
	fixTime();
/*
	let title = document.getElementById('title');
	let startDate = document.getElementById('start_date');
	let endDate = document.getElementById('end_date');
	let content = document.getElementById('content');
	let targetOb = document.getElementById('target_object');
	let memberId = document.getElementById('member_id');
 */

	let arr = [];
	//let target = document.getElementById('target_object');
    
    fetch('/calendar/getSchedule',{
		method: "GET",
		headers: {
			"Content-Type": "application/json"
		}
		})
		.then(res => res.json())
		.then(dataArray => {
			dataArray.forEach(data =>{
				const dataObj = {
					title : data.title,
					start : data.start_date,
					end : data.end_date,
					url:'https://naver.com'	/* url 설정 Detail page*/
					
				}
				arr.push(dataObj);
			})
			var calendar = new FullCalendar.Calendar(calendarEl, {
			  googleCalendarApiKey:'AIzaSyCzFcwzDWPTcM8eLqcBQ7nlSmig8VMDwGw',
		  	  expandRows: true,		  //크기조절 
		      initialDate: '2024-05-01 00:00:00',		 //초기시간설정 => 처음보여줄 달력 
		      locale : 'ko',
		      editable: true,
		      selectable: true,
		      businessHours: true,
		      dayMaxEvents: true, // allow "more" link when too many events
		      eventSources:[
			     {
				    googleCalendarId: '5b75938aada2d3092b44447721c74a5887f74bffb5a36367bf9ac6f23209eba3@group.calendar.google.com'
				 },
				 {
					 googleCalendarId:'ko.south_korea#holiday@group.v.calendar.google.com',
					 color:'#FF9900'
				 }
			  ],
		      events:arr
		    
    		});
    		calendar.render();
		})
  });

  
  
  
  
  
  