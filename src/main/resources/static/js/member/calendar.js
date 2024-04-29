console.log("calendar.js");




/*추가할때 fetch*/
function create(){
	fetch('/calendar/create',{
		method:'POST',
		headers:{'content-Type':'application/json;charset:utf-8'},
		body:JSON.stringify({
			member_id:memberId.value,
			title:title.value,
			start_date:startDate.value,
			end_date:endDate.value,
			content:content.value,
			target_object:targetOb.value
		})
		.then(res => console.log(res))
	});
}

/* 페이지 불러오기 */
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
	
/*
	let title = document.getElementById('title');
	let startDate = document.getElementById('start_date');
	let endDate = document.getElementById('end_date');
	let content = document.getElementById('content');
	let targetOb = document.getElementById('target_object');
	let memberId = document.getElementById('member_id');
 */

	let arr = [];
    var calendar = new FullCalendar.Calendar(calendarEl, {
  	  expandRows: true,		 /* 크기조절 */
      initialDate: '2024-04-01',		/* 초기시간설정 => 처음보여줄 달력 */
      locale : 'ko',
      editable: true,
      selectable: true,
      businessHours: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events:async function(info, successCallback, failureCallback){  
	  	fetch('/calendar/getSchedule',{
		method: "GET",
		headers: {
			"Content-Type": "application/json"
		}
		})
		.then(res => res.json())
		.then((data) =>{
			data.forEach((e)=>{
				let title = e.title;
				let start = e.start;
				let end = e.end;
				arr.push({
					title:title,
					start:start,
					end:end
				})
			})
		})
		successCallback(arr);
		}
		
	  
    });

	
    calendar.render();
  });

  
  
  
  
  
  
  
  
  