<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

		<!-- TODO ｢新規登録｣画面 -->

		<h2>新規登録</h2>
		<form name="form1" action="CustomerServlet" method="post" onsubmit="return funcConfirm(event)">
			<table>
				<tr>
					<td class="title">氏名</td>
					<td>
						<input type="text" name="name" id="name" maxlength="20" value="${session.customer.name }">
					</td>
				</tr>
				<tr>
					<td class="title">郵便番号</td>
					<td>
						<input type="text" name="zip" id="zip" maxlength="10" value="${session.customer.zip }">
					</td>
				</tr>
				<tr>
					<td class="title">住所1</td>
					<td>
						<input type="text" name="address1" id="address1" maxlength="48" value="${session.customer.address1 }">
					</td>
				</tr>
				<tr>
					<td class="title">住所2</td>
					<td>
						<input type="text" name="address2" id="address2" maxlength="48" value="${session.customer.address2 }">
					</td>
				</tr>
				<tr>
					<td class="title">TEL</td>
					<td>
						<input type="text" name="tel" id="tel" maxlength="20" value="${session.customer.tel }">
					</td>
				</tr>
				<tr>
					<td class="title">FAX</td>
					<td>
						<input type="text" name="fax" id="fax" maxlength="20" value="${session.customer.fax }">
					</td>
				</tr>
				<tr>
					<td class="title">Email</td>
					<td>
						<input type="text" name="eamail" id="email" maxlength="50" value="${session.customer.email }">
					</td>
				</tr>
			</table>
			<p>
				<input type="submit" value="送信"> <input type="button" value="戻る" onclick="history.back()">
			</p>
		</form>
	</div>
</body>
<script type="text/javascript">
	function funcConfirm() {

		// TODO バリデーションチェック･alertダイアログ処理
		const name = document.getElementById('name').value;
		const zip = document.getElementById('zip').value;
		const address1 = document.getElementById('address1').value;
		const email = document.getElementById('email').value;

		const errMsg;

		if (name.trim() === '') {
			errMsg = "名前が入力されていません";
		} else if (zip.trim() === '') {
			errMsg = "郵便番号が入力されていません";
		} else if (address1.trim() === '') {
			errMsg = "住所が入力されていません";
		} else if (email.trim() === '') {
			errMsg = "メールが入力されていません";
		}

		if (errMsg.trim() === '') {
			event.preventDefault();
			return false;
			alert(errMsg);
		}
		return true;

	}
</script>
</html>
