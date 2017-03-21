<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%  
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
	<jsp:include page="../common/header.jsp"/>

<body style="max-width:600px;">

	<header class="w3-container w3-card-4 w3-top" style="text-align: center; background-color: #1e2225; color: #fff;">
	  <h2><strong>카페 동네 관리자</strong></h2>
	</header>
	
	<div class="w3-container" style="margin-top:90px;">
		<ul class="w3-ul w3-card-4">
		  <li class="w3-padding-16">
		    <img src="<%=cp%>/img/user.png" class="w3-left w3-circle w3-margin-right" style="width:50px">
		    <span class="w3-large">Mike</span><br>
		    <span>Web Designer</span>
		  </li>
		</ul>
	</div>
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>