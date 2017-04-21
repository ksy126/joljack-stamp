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

	<div class="w3-container" style="margin-top: 100px">
		<p style="color: #fff">
			<strong>9잔을 채우시면, 보너스 커피 한잔을 무료로 드립니다.</strong>
		</p>

		<div class="w3-row" align="center" style="margin-top: 2em; margin-bottom: 2em;">
			<input type="hidden" value="${stampCount}" id="stampCount">
			<input type="hidden" value="<%=member_no %>" id="member_no">
			<input type="hidden" value="${company_no }" id="company_no">
			
			<c:forEach begin="1" end="${stampCount}" step="1">
				<div class="w3-col s4" style="margin-bottom: 35px;">
					<img src="<%=cp%>/img/coffee.png">
				</div>
			</c:forEach>
			<c:forEach begin="1" end="${9 - stampCount}" step="1">
				<div class="w3-col s4" style="margin-bottom: 35px;">
					<img src="<%=cp%>/img/noCoffee.png">
				</div>
			</c:forEach>
		</div>

		<div class="w3-row" align="center">
			<div class="w3-col">
				<button class="w3-btn w3-round-large" onclick="openQrCode()">적립하기</button>
				<button class="w3-btn w3-round-large" onclick="couponPage()">쿠폰 확인</button>
			</div>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp" />
</body>
<script type="text/javascript">
	$(document).ready(function(){
		var stampCount = $("#stampCount").val();
			stampCount = stampCount*1;
			
		if(stampCount == 9) {
			alert("초기화");
			$("#stampCount").val("-1");
			saveStamp();
		}
	});
	
	function couponPage() {
		location.href="/cmd/coupon.do;"
	};

	function openQrCode() {
		alert("QR코드 불러와서 세이부~");
		saveStamp();
	}

	function saveStamp() {
		var stampCount = $("#stampCount").val();
		var member_no = $("#member_no").val();
		var company_no = $("#company_no").val();
		
		stampCount = stampCount*1;
		
		if (stampCount == 9) {
			return false;
		} else {
			stampCount = stampCount + 1;
		}
		
		var params = "stamp_count=" + stampCount + "&member_no=" + member_no + "&company_no=" + company_no;
		$.ajax({
			type : "POST",
			async : false,
			url : "/cmd/saveStamp.do",
			data : params,
			dataType : "json",
			timeout : 30000,
			cache : false,
			contentType : "application/x-www-form-urlencoded;charset=UTF-8",
			error : function(request, status, error) {
				alert("작업 도중 오류가 발생하였습니다. 자세한 사항은 고객센터에 문의하십시오.");
			},
			success : function(data) {
				location.reload();
			}
		});
	}
</script>
</html>