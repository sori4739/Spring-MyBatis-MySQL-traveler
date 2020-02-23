<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
	var IMP = window.IMP; // 생략가능
	IMP.init('imp79258070');
</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="hidden" value="${economyCharge}" id="economyCharge">
</body>
<script>
	var economyCharge = document.getElementById('economyCharge').value;
	IMP.request_pay({
		pg : 'html5_inicis', //ActiveX 결제창은 inicis를 사용
		pay_method : 'vbank', //card(신용카드), trans(실시간계좌이체), vbank(가상계좌), phone(휴대폰소액결제)
		merchant_uid : 'merchant_' + new Date().getTime(), //상점에서 관리하시는 고유 주문번호를 전달
		name : '항공권 구매',
		amount : economyCharge,
		buyer_email : '',
		buyer_name : '',
		buyer_tel : '', //누락되면 이니시스 결제창에서 오류
		buyer_addr : '',
		buyer_postcode : ''
	}, function(rsp) {
		if (rsp.success) {
			var msg = '결제가 완료되었습니다.';
			alert(msg);
			location.href = "airpay?result=success";
		} else {
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
			alert(msg);
			location.href = "airpay?result=fail";

		}
	});
</script>
</html>