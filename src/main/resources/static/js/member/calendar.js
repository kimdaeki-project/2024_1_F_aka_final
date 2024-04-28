console.log("calendar.js");

let title = document.getElementById('title');
let startDate = document.getElementById('start_date');
let endDate = document.getElementById('end_date');
let content = document.getElementById('content');
let targetOb = document.getElementById('target_object');
let memberId = document.getElementById('member_id');

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


    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');

        var calendar = new FullCalendar.Calendar(calendarEl, {
      	  expandRows: true,		 /* 크기조절 */
          initialDate: '2024-04-01',		/* 초기시간설정 => 처음보여줄 달력 */
          editable: true,
          selectable: true,
          businessHours: true,
          dayMaxEvents: true, // allow "more" link when too many events
          events: [							/* 날짜만 적어주면 하루종일 */
            {								
				title: 'All Day Event',
				start: '2024-04-01'
            },
            {
				title: 'Long Event',
				start: '2024-04-07',
				end: '2024-04-10'
            },
            {
				title: 'Date tile',
				start: '2024-04-07T20:00:00'
            }

          ]
        });

        calendar.render();
      });