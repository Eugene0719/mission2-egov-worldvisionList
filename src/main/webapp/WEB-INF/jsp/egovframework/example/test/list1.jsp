<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="author" content="">
  <title>전체 회원 목록</title>
  <!-- CSS -->
  <link rel="stylesheet" href="resources/bootstrap/v3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="resources/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="resources/custom/css/bootstrap-select.min.css" />
  <link rel="stylesheet" href="resources/datepicker/v1.6.4/css/bootstrap-datepicker3.min.css" />
  <link rel="stylesheet" href="resources/datatables/datatables.min.css">
  <link rel="stylesheet" href="resources/custom/css/font.css">
  <link rel="stylesheet" href="resources/custom/css/common.css">
  <link rel="stylesheet" href="resources/custom/css/contents.css">
  <link rel="stylesheet" href="resources/custom/css/sidebar.css">
  <link rel="stylesheet" href="resources/custom/css/table.css">
  <link rel="stylesheet" href="resources/custom/css/green.css">
  <link rel="stylesheet" href="resources/custom/css/swiper.css">
  <!-- Script -->
  <script src="resources/custom/js/jquery.min.js"></script>
  <script src="resources/bootstrap/v3.4.1/js/bootstrap.min.js"></script>
  <script src="resources/datepicker/v1.6.4/js/bootstrap-datepicker.min.js"></script>
  <script src="resources/custom/js/bootstrap-select.js"></script>
  <script src="resources/datatables/datatables.min.js"></script>
  <script src="resources/swiper/4.5.1/swiper.min.js"></script>
  <!-- <script src="/resources/custom/js/menu.js"></script> -->
  <script type="text/javascript" src="resources/custom/js/common.js"></script>
  
<!-- <script src="https://code.jquery.com/jquery-3.3.1.js"></script> 
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script> -->
<script src="https://cdn.datatables.net/buttons/1.6.1/js/dataTables.buttons.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/plug-ins/1.10.20/filtering/type-based/html.js"></script>




</head>
<script type="text/javascript">
$(document).ready(function() {
	
	  fill_datatable();
	  
	  function fill_datatable(volunteerStep='1', translation=''){
	  oTable = $("#data-table-1").dataTableInit({
           ajax : {
            url : "/test/ajax/ListAjax.do",
            data : function(param, settings) {
            } 
        }, 
        columns : [
		            {"title": "No", "data":"rownum","width":"5%","render":"","name":"false"},
		            {"title": "유형구분", "data":"type","width":"8%","render":"","name":"false"},
		            {"title": "봉사단계", "data":"volunteerStep","width":"8%","render":volunteerStep1,"name":"false"},
		            {"title": "이름", "data":"name","width":"8%","render":fnGetLinkForDetail,"name":"false"},
		            {"title": "생년월일", "data":"birth","width":"8%","render":"","name":"false"},
		            {"title": "아이디", "data":"engName","width":"8%","render":"","name":"false"},
		            {"title": "이메일", "data":"email","width":"8%","render":"","name":"false"},
		            {"title": "번역구분", "data":"translation","width":"8%","render":translation1,"name":"false"},
		            {"title": "담당직원", "data":"emp","width":"8%","render":emp,"name":"false"},
		            {"title": "가입일", "data":"regdate","width":"8%","render":"","name":"false"} 
		    ],
		    columnDefs : [ {
		        className : "dt-body-center",targets : 0}, {
		        className : "dt-body-center",targets : 1}, {
		        className : "dt-body-center",targets : 2}, {
		        className : "dt-body-center",targets : 3}, {
		       	className : "dt-body-center",targets : 4}, {
		   		className : "dt-body-center",targets : 5}, {
				className : "dt-body-center",targets : 6}, {
				className : "dt-body-center",targets : 7}, {
				className : "dt-body-center",targets : 8}, { 
		        className : "dt-body-center",targets : 9}, 
		    ],
		         //dom: '<"top"l><"pull-right"f>rt<"pull-right btn"B>', 
		         /* dom: "Bfrtip,lrtip",
		         buttons : [
					{
						extend : 'excel',
						title : "",
						text: "버튼명",
						exportOprions: {
							modifier: { page: "current" },
						}
						filename : $(".page-title").text() + "_" + (new Date().format("yyyyMMdd"))
					}
			    ]  */
		    });
	    };
    });  
    
    function volunteerStep1(val) {
        if(val == "1"){
        	return "새싹";
        }else if(val == "2"){
        	return "열매";
        }else{
        	return "-";     
        }
    }
    function translation1(val) {
        if(val == "1"){
        	return "모두";
        }else if(val == "2"){
        	return "아동서신";
        }else if(val == "3"){
        	return "후원자서신";
        }else{
        	return "-";     
        }
    }
    function emp(val) {
        if(val == "1"){
        	return "김직원";
        }else if(val == "2"){
        	return "박직원";
        }else if(val == "3"){
        	return "최직원";
        }else{
        	return "-";     
        }
    }
    function fnGetLinkForDetail(val, type, row) {
        var stVal = "";
        if (val){
            stVal = "<span style=\"cursor:pointer;cursor:hand\" onclick=\"fnGoUpdate('V', '" + row.id + "')\">" + val + "</span>";
        }
        return stVal;
    }
    
    function fnSchList() {
        $("#data-table-1").DataTable().ajax.reload();
    }

    function fnGoUpdate(mode,id) {
        var v_url = "/test/Detail.do?mode=" + mode;
        if(mode == "V") {
            v_url += "&id=" + id;
        }
        this.location.href = v_url;
    }
 	
</script>
<body>
      <div class="page-body">
        <h3 class="contents-title">검색창</h3>
        <div class="search-box">
          <div class="row">
            <div class="col-xs-12 col-sm-11">
              <div class="row">
                <div class="col-xs-6 col-sm-2">
                  <div class="form-group">
                    <select class="selectpicker">
                      <option value="0" >전체</option>
                      <option value="1" >번역봉사자</option>
                      <option value="2" >기관방문</option>
                      <option value="3">일반</option>
                      <option value="4">신청 일시중지</option>
                      <option value="5">패널티 일시중지</option>
                      <option value="6">직원 일시중지</option>
                      <option value="7">활동재개테스트</option>
                    </select>
                  </div>
                </div>
                <div class="col-xs-6 col-sm-2">
                  <div class="form-group">
                    <select class="selectpicker" id="volunteerStep" name="volunteerStep">
                      <option value="0" >전체</option>
                      <option value="1">새싹</option>
                      <option value="2">열매</option>
                    </select>
                  </div>
                </div>
                <div class="col-xs-12 col-sm-2">
                  <div class="form-group">
                    <select class="selectpicker" id="translation" name="translation">
                      <option value="0" >모두</option>
                      <option value="1">아동서신</option>
                      <option value="2">후원자서신</option>
                    </select>
                  </div>
                </div>
                <div class="col-xs-10 col-sm-2" style="float:right">
                  <div class="form-group"  >
                    <label class="sr-only" for="">내용</label>
              		<input type="text" class="form-control" id="serchContents" name="serchContents" placeholder="내용을 입력하세요">
                  </div>
                </div>
                <div class="col-xs-6 col-sm-2" style="float:right">
                  <div class="form-group">
                    <select class="selectpicker">
                      <option value="serchName">이름</option>
                      <option value="serchId">아이디 / 이메일</option>
                      <option value="serchPhone">휴대전화</option>
                      <option value="serchEmp">담당직원</option>
                    </select>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-xs-12 col-sm-1">
              <!-- <button type="button" class="btn btn-block btn-search" onclick="fnSchList()"><i class="fa fa-search"></i> 검색</button> -->
              <button type="button" class="btn btn-block btn-search" name="filter" id="filter"><i class="fa fa-search"></i> 검색</button>
            </div>
          </div>
        </div><!-- //.search-box -->

        <hr>

        <h3 class="contents-title">목록</h3>
        <table class="table table-striped table-hover table-list td-center" id="data-table-1"> 
        </table>
        <hr>
	<div align="right">
		<button type="button" class="btn btn-save" onclick="location.href='/test/register'"><i class="fa fa-pencil-square-o"></i> 등록</button>
	</div>
      </div>

<script type="text/javascript">
  $(document).ready(function(){
	  var result = '${msg}';
	  if(result == 'SUCCESS'){
	  	alert("처리가 완료되었습니다.");
	  }
    
    $('#filter').click(function(){
        var volunteerStep = $('#volunteerStep').val();
        var translation = $('#translation').val();

        if(volunteerStep != '' &&  translation != '')
        {
            $('#data-table-1').DataTable().destroy();
            fill_datatable(volunteerStep, translation);
        }
        else
        {
            alert('Select Both filter option');
        }
    });
    
  });
</script>
</body>
</html>