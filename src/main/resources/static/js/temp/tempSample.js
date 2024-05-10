let title = document.getElementById('title');
let startDate = document.getElementById('start_date');
let endDate = document.getElementById('end_date');  
let arr = []; 


fetch('/department/calendar',{
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
            }
            arr.push(dataObj);
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'dayGridMonth',
      events:arr
    });
    calendar.render();


        })
  });