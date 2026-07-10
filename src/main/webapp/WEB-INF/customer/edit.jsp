<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean class="user.UserBean" id="user" scope="session" />
<jsp:useBean class="customer.CustomerBean" id="customer" scope="session" />
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>顧客管理</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
</head>

<body>
	<h1>顧客管理</h1>
	<div class="main">
		<h2>既存データの編集</h2>
		<form name="form1" action="CustomerServlet" method="post" onsubmit="return funcConfirm()">
			<table>
				<tr>
					<td class="title">氏名</td>
					<td>
						<input type="text" name="name" maxlength="20" value="${customer.name }">
					</td>
				</tr>
				<tr>
					<td class="title">郵便番号</td>
					<td>
						<input type="text" name="zip" maxlength="10" value="${customer.zip }">
					</td>
				</tr>
				<tr>
					<td class="title">住所1</td>
					<td>
						<input type="text" name="address1" maxlength="48" value="${customer.address1 }">
					</td>
				</tr>
				<tr>
					<td class="title">住所2</td>
					<td>
						<input type="text" name="address2" maxlength="48" value="${customer.address2 }">
					</td>
				</tr>
				<tr>
					<td class="title">TEL</td>
					<td>
						<input type="text" name="tel" maxlength="20" value="${customer.tel }">
					</td>
				</tr>
				<tr>
					<td class="title">FAX</td>
					<td>
						<input type="text" name="fax" maxlength="20" value="${customer.fax }">
					</td>
				</tr>
				<tr>
					<td class="title">Email</td>
					<td>
						<input type="text" name="email" maxlength="50" value="${customer.email }">
					</td>
				</tr>
			</table>

			<p>
				<button name="state" value="edit_confirm">送信</button>
				<input type="button" value="戻る" onclick="history.back()">
			</p>
		</form>
	</div>
	<script type="text/javascript">
		
		function funcConfirm() {
			if (document.form1.name.value == "") {
				alert("氏名が入力されていません。");
				return false;
			}
			if (document.form1.zip.value == "") {
				alert("郵便番号が入力されていません。");
				return false;
			}
			if (document.form1.address1.value == "") {
				alert("住所が入力されていません。");
				return false;
			}
			if (document.form1.email.value == "") {
				alert("住所が入力されていません。");
				return false;
			}
		}
	</script>
</body>
</html>
