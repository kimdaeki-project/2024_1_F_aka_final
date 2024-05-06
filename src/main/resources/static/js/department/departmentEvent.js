    let modalScrollable = document.getElementById("modalScrollable");
    let modalResult = document.getElementById("modalResult");
    $(function () {
        // jstree 초기화 및 JSON 파일 로드
        $('#tree').jstree({
            core: {
                'data': {
                    'url': '/department/jstreeList',
                    'dataType': 'json' // 데이터 타입이 JSON임을 명시
                  }
                }
              })
            
    });
    
    var parentId = $('#tree').jstree('get_selected',true);
    $("#tree").jstree("close_all");
    $("#tree").jstree("open_all");
    $("#tree").jstree("search");
    
   
    $('#tree').on('select_node.jstree', function (e, data) {
        console.log(data);
        var deparid = data.node.id;
        var deparSuperid = data.node.parent;
        var children = data.node.children;
        console.log(children);
        console.log(deparSuperid);
        if(children.length==0){
          $.ajax({
              url : "/department/member?department_id="+deparid,
              dataType : "html",
              type : "get",
              success : function(res){
  
              $("#modalResult").html(res); 
              $("#modalButton").click();
              }
              });

        }
          
        
       
        
      });
  
    

     
     