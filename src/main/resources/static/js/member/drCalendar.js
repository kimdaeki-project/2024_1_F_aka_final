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

function move(e){
	alert("추가완료");
	location.href="/calendar/dr";	
}
	


let title = document.getElementById('title');
let startDate = document.getElementById('start_date');
let endDate = document.getElementById('end_date');
let content = document.getElementById('content');
let targetOb = document.getElementById('target_object');
let memberId = document.getElementById('member_id');


/*추가할때 fetch*/
function create(){
	fetch('/calendar/create',{
		method:'POST',
		headers:{
			"Content-Type": "application/json charset=utf-8"
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
		.then(res => res)
		.then(res => move(res))
		.catch(error => {
		console.log(error);
	})
}

/* 페이지 불러오기 */
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
	fixTime();

	const b = {title:'1',start:'2020-05-01',end:'2020-05-01'}
	let arr = [b];
	
    fetch('/calendar/drDetail',{
		method: "GET",
		headers: {
			"Content-Type": "application/json"
		}
		})
		.then(res => res.json())
		.then(dataArray => {
			/* db에서 가져온 일정들 dataObj객체에 담아서 arr 리스트에 push */
			if(dataArray.length > 0){
				dataArray.forEach(data => {
				const dataObj = {
					title : data.title,
					start : data.start_date,
					end : data.end_date,
					/*color:'#FF6600',*/
					url:'https://localhost/calendar/'+data.calendar_id	/* url 설정 Detail page*/
					
					}
					arr.push(dataObj);
				})
			}
			
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
					 googleCalendarId:'ko.south_korea#holiday@group.v.calendar.google.com',
					 color:'#FF9900'
				 },
				 arr
				 
			  ],
		      events:{title:'1',start:'2020-05-01',end:'2020-05-01'}
	
		    
    		});
    		calendar.render();
		})

  });


			
  
  
  
  