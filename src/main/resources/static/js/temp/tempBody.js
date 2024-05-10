let myCt = document.getElementById('myChart');
              let arrlabels = [];
              let arrdata = [];
              fetch("/payment/total",{
          		method: "GET",
          		headers: {
          			"Content-Type": "application/json"
          		}
          		})
          		.then(res => res.json())
          		.then(dataArray => {
          			dataArray.forEach((data) =>{
                  arrlabels.push(data.month);
          				arrdata.push(data.totalSales);
          			})
                let myChart = new Chart(myCt, {
                  type: 'line',
                  data: {
                    labels: arrlabels,
                    datasets: [
                      {
                        label: '월 매출',
                        data: arrdata
                      }
                    ]
                  },
                });
              });
             