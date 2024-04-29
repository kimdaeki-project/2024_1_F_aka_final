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


let title, startDate, endDate;

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
					startDate : data.start_date,
					endDate : data.end_date,
				}
				arr.push(dataObj);
				console.log(dataObj);
				
				console.log(title, startDate, endDate);
			})
		})
	console.log(arr);
    var calendar = new FullCalendar.Calendar(calendarEl, {
  	  expandRows: true,		 /* 크기조절 */
      initialDate: '2024-04-01',		/* 초기시간설정 => 처음보여줄 달력 */
      locale : 'ko',
      editable: true,
      selectable: true,
      businessHours: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events: [
			
			{
				title:'가나다',
				start: '2024-04-07',
				end: '2024-04-10'
			}
      ]
    });
	
    calendar.render();
  });

  
  
  
  
  
  
  
  
  