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

<form class="w3-container w3-card-4 w3-light-grey w3-text-blue w3-margin">
	<h2 class="w3-center">회원 가입</h2>
	 
	<div class="w3-row w3-section">
	  <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-user"></i></div>
	    <div class="w3-rest">
	      <input class="w3-input w3-border" name="first" type="text" placeholder="아이디">
	    </div>
	</div>
	
	<div class="w3-row w3-section">
	  <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-lock"></i></div>
	    <div class="w3-rest">
	      <input class="w3-input w3-border" name="last" type="password" placeholder="비밀번호">
	    </div>
	</div>
	
	<div class="w3-row w3-section">
	  <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-pencil"></i></div>
	    <div class="w3-rest">
	      <input class="w3-input w3-border" name="message" type="text" placeholder="이름">
	    </div>
	</div>
	
	<div class="w3-row" align="center" style="margin-top: 2em; margin-bottom: 3em;">
		<div class="w3-col s6">
			<button class="w3-btn" onclick=""><i>가입</i></button>
		</div>
		<div class="w3-col s6">
			<button class="w3-btn" onclick=""><i>취소</i></button>
		</div>
	</div>

</form>
</div>
	<jsp:include page="../common/footer.jsp"/>
</body>

<script type="text/javascript">

</script>

</html>


