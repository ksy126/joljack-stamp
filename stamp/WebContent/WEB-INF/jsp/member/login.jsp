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

	<div align="center" style="margin-bottom: 2em;">
		<img src="<%=cp%>/img/coffeeSeeds.png">
	</div>
	<form class="w3-container">	
		<label class="w3-label">아이디</label>
		<input class="w3-input" type="text" id="user_id">		
		<label class="w3-label">비밀번호</label>
		<input class="w3-input" type="password" id="user_pwd">	
	</form>
	
	<div class="w3-row" align="center" style="margin-top: 2em;">
		<div class="w3-col s6">
			<button class="w3-btn" onclick="login_check()"><i>로그인</i></button>
		</div>
		<div class="w3-col s6">
			<button class="w3-btn" onclick="move_join()"><i>회원가입</i></button>
		</div>
	</div>
</div>

</body>

<script type="text/javascript">
function move_join() {
	location.href="<%=cp%>/cmd/move_join.do";
}

function login_check(){
	var user_id = $("#user_id").val();
	var user_pwd = $("#user_pwd").val();
	
	if(user_id == null || user_id == ""){
		alert("아이디를 입력 하세요.")
		$("#user_id").focus();
	} else if(user_pwd == null || user_pwd == ""){
		alert("비밀번호를 입력 하세요.")
		$("#user_pwd").focus();
	} else {
		var params = "user_id="+user_id+"&user_pwd="+user_pwd;
		$.ajax({
	        type        : "POST"  
	      , async       : false 
	      , url         : "/cmd/userLogin.do"
	      , data        : params
	      , dataType    : "json" 
	      , timeout     : 30000
	      , cache       : false     
	      , contentType : "application/x-www-form-urlencoded;charset=UTF-8"
	      , error       : function(request, status, error) {
				alert("작업 도중 오류가 발생하였습니다. 자세한 사항은 고객센터에 문의하십시오.");       
	      }
	      , success     : function(data) {
	    	  if(data.check == "no"){
	    		  alert("아이디 또는 비밀번호가 일치하지 않습니다.");
	    	  } else {
	    		  alert("환영합니다");
				  location.href="<%=cp%>/cmd/main.do";
	    	  }			    	  
	      }
    	});
	}
}
</script>

</html>


