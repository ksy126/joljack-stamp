<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%  
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
	<jsp:include page="../common/header.jsp"/>
<body style="max-width:600px;">

<header class="w3-container w3-card-4 w3-top" style="text-align: center; background-color: #1e2225; color: #fff;">
  <h2><strong>카페 동네</strong></h2>
</header>

<div class="w3-container" style="margin-top:100px">

<div class="w3-container w3-card-4 w3-light-grey w3-text-blue w3-margin">
	<h2 class="w3-center">회원 가입</h2>
	 
	<div class="w3-row w3-section">
	  <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-user"></i></div>
	    <div class="w3-rest">
	      <input class="w3-input w3-border" id="user_id" type="text" placeholder="아이디">
	    </div>
	</div>
	
	<div class="w3-row w3-section">
	  <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-lock"></i></div>
	    <div class="w3-rest">
	      <input class="w3-input w3-border" id="user_pwd" type="password" placeholder="비밀번호">
	    </div>
	</div>
	
	<div class="w3-row w3-section">
	  <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-pencil"></i></div>
	    <div class="w3-rest">
	      <input class="w3-input w3-border" id="user_name" type="text" placeholder="이름">
	    </div>
	</div>
	
	<div class="w3-row" align="center" style="margin-top: 2em; margin-bottom: 3em;">
		<div class="w3-col s6">
			<button class="w3-btn" onclick="join()"><i>가입</i></button>
		</div>
		<div class="w3-col s6">
			<button class="w3-btn" onclick=""><i>취소</i></button>
		</div>
	</div>

</div>
</div>
	<jsp:include page="../common/footer.jsp"/>
</body>

<script type="text/javascript">
function join(){
	var user_id = $("#user_id").val();
	var user_pwd = $("#user_pwd").val();
	var user_name = $("#user_name").val();
	
	if(user_id == null || user_id == ""){
		alert("아이디를 입력 하세요.")
		$("#user_id").focus();
	} else if(user_pwd == null || user_pwd == ""){
		alert("비밀번호를 입력 하세요.")
		$("#user_pwd").focus();
	} else if(user_name == null || user_name == ""){
		alert("이름을 입력 하세요.")
		$("#user_name").focus();
	} else {
		var params = "user_id="+user_id+"&user_pwd="+user_pwd+"&user_name="+user_name;
		$.ajax({
	        type        : "POST"  
	      , async       : false 
	      , url         : "/cmd/join.do"
	      , data        : params
	      , dataType    : "json" 
	      , timeout     : 30000
	      , cache       : false     
	      , contentType : "application/x-www-form-urlencoded;charset=UTF-8"
	      , error       : function(request, status, error) {
				alert("작업 도중 오류가 발생하였습니다. 자세한 사항은 고객센터에 문의하십시오.");       
	      }
	      , success     : function(data) {
	    	    alert("회원가입이 완료 되었습니다.");
	    	    location.href="<%=cp%>/cmd/login.do";
	      }
    	});
	}
}
</script>

</html>


