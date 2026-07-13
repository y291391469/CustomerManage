<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean class="customer.CustomerBean" id="customer" scope="session" />

<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>顧客管理</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/style.css">
</head>
<body>
	<h1>顧客管理</h1>
	<div class="main">

		<!-- TODO ｢新規登録｣画面 -->

		<h2>新規登録</h2>
		<form id="form1" name="form1" action="CustomerServlet" method="post"
			onsubmit="return funcConfirm(event)" novalidate>
			<table>
				<tr>
					<td class="title">氏名</td>
					<td><input type="text" name="name" id="name" maxlength="20"></td>
				</tr>
				<tr>
					<td class="title">郵便番号</td>
					<td><input type="text" name="zip" id="zip" maxlength="10"
						inputmode="numeric"></td>
				</tr>
				<tr>
					<td class="title">住所1</td>
					<td><input type="text" name="address1" id="address1"
						maxlength="98"></td>
				</tr>
				<tr>
					<td class="title">住所2</td>
					<td><input type="text" name="address2" id="address2"
						maxlength="98"></td>
				</tr>
				<tr>
					<td class="title">TEL</td>
					<td><input type="text" name="tel" id="tel" maxlength="20"
						inputmode="tel"></td>
				</tr>
				<tr>
					<td class="title">FAX</td>
					<td><input type="text" name="fax" id="fax" maxlength="20"
						inputmode="tel"></td>
				</tr>
				<tr>
					<td class="title">Email</td>
					<td><input type="text" name="email" id="email" maxlength="50"
						inputmode="email"></td>
				</tr>
			</table>
			<p>
				<button type="submit" name="state" value="new_confirm">送信</button>
				<input type="button" value="戻る" onclick="history.back()">
			</p>
		</form>

	</div>
	<script
		src="${pageContext.request.contextPath}/js/customerValidates.js"></script>


</body>

</html>
