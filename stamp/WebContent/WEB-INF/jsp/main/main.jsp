<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%  
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
	<jsp:include page="../common/header.jsp"/>

<body style="max-width:600px; background-image: url('<%=cp%>/img/back.png')">

	<header class="w3-container w3-card-4 w3-top" style="text-align: center; background-color: #1e2225; color: #fff;">
	  <h2><strong>카페 동네</strong></h2>
	</header>
	
	<div class="w3-container" style="margin-top:100px">
		<p style="color: #fff"><strong>8잔을 채우시면, 보너스 커피 한잔을 무료로 드립니다.</strong></p>
		<div class="w3-row" align="center">
		  <div class="w3-col s4">
		    <img src="<%=cp%>/img/coffee.png">
		  </div>
		  <div class="w3-col s4">
		    <img src="<%=cp%>/img/noCoffee.png">
		  </div>
		  <div class="w3-col s4">
		    <img src="<%=cp%>/img/noCoffee.png">
		  </div>
		</div>  
		<hr>
		<div class="w3-row" align="center">
		  <div class="w3-col s4">
		    <img src="<%=cp%>/img/noCoffee.png">
		  </div>
		  <div class="w3-col s4">
		    <img src="<%=cp%>/img/noCoffee.png">
		  </div>
		  <div class="w3-col s4">
		    <img src="<%=cp%>/img/noCoffee.png">
		  </div>
		</div> 
		<hr>
		<div class="w3-row" align="center">
		  <div class="w3-col s4">
		    <img src="<%=cp%>/img/noCoffee.png">
		  </div>
		  <div class="w3-col s4">
		    <img src="<%=cp%>/img/noCoffee.png">
		  </div>
		  <div class="w3-col s4">
		    <img src="<%=cp%>/img/noCoffee.png">
		  </div>
		</div> 
		<hr>
		<div class="w3-row" align="center">
		  <div class="w3-col">
		    <button class="w3-btn w3-round-large">적립하기</button>
		  </div>
		</div>
	</div>
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>