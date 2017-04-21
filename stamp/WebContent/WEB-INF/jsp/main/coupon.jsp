<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%  
	String cp  = request.getContextPath();
	String member_no="";
	boolean isSession = true;
	
	if (session.getAttribute("member_no") != null) {
	   
		member_no = session.getAttribute("member_no").toString();
	  
	} else {
	    isSession = false;
	    session.removeAttribute("sessionData");
	}
%>
<!DOCTYPE html>
<html>
<jsp:include page="../common/header.jsp" />

<body style="max-width:600px; background-image: url('<%=cp%>/img/back.jpg');">

	<header class="w3-container w3-card-4 w3-top" style="text-align: center; background-color: #1e2225; color: #fff;">
		<h2>
			<strong>카페 동네</strong>
		</h2>
	</header>
	
	<div style="margin-top: 100px">
		<div class="w3-card-4">
			<div class="w3-container" style="background-color: #fff;">
			  <img src="<%=cp%>/img/qrcode/coupon.gif" alt="Avatar" class="w3-left w3-circle" width="30%;">
			  <p>아래 버튼을 클릭하여, QR코드를 직원에게 보여주세요.</p>
			</div>
			<button class="w3-button w3-block w3-dark-grey">사용하기</button>
		</div>
	</div>
	
	

	<jsp:include page="../common/footer.jsp" />
</body>
<script type="text/javascript">
	$(document).ready(function(){

	});

</script>
</html>