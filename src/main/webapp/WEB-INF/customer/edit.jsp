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

		<!-- TODO ｢既存データ編集･削除｣画面 -->
		<h2>既存データの編集</h2>
		<form name="form1" action="CustomerServlet" method="post" onsubmit="return funcConfirm()">
			<table>
				<tr>
					<td class="title">氏名</td>
					<td>
						<input type="text" name="name" maxlength="20" value="<%= customer.getName() %> ">
					</td>
				</tr>
				<tr>
					<td class="title">郵便番号</td>
					<td>
						<input type="text" name="zip" maxlength="10" value="<%= customer.getZip() %> ">
					</td>
				</tr>
				<tr>
					<td class="title">住所1</td>
					<td>
						<input type="text" name="address1" maxlength="48" value="<%= customer.getAddress1() %> ">
					</td>
				</tr>
				<tr>
					<td class="title">住所2</td>
					<td>
						<input type="text" name="address2" maxlength="48" value="<%= customer.getAddress2() %> ">
					</td>
				</tr>
				<tr>
					<td class="title">TEL</td>
					<td>
						<input type="text" name="tel" maxlength="20" value="<%= customer.getTel() %> ">
					</td>
				</tr>
				<tr>
					<td class="title">FAX</td>
					<td>
						<input type="text" name="fax" maxlength="20" value="<%= customer.getFax() %> ">
					</td>
				</tr>
				<tr>
					<td class="title">Email</td>
					<td>
						<input type="text" name="email" maxlength="50" value="<%= customer.getEmail() %> ">
					</td>
				</tr>
			</table>

			<p>
				<button name="state" value="edit_confirm">送信</button>
				<input type="button" value="戻る" onclick="history.back()">
			</p>

		</form>

	</div>
</body>
<script type="text/javascript">
	function funcConfirm() {

		// TODO バリデーションチェック･alertダイアログ処理
		function funcConfirm() {

		// TODO バリデーションチェック･alertダイアログ処理
		var name = document.name.txt.value;
		var zip = document.name.txt.value;
		var address1 = document.name.address1.value;
		var address2 = document.name.address2.value;
		var tel = document.tel.txt.value;
		var fax = document.tel.txt.value;
		var email = document.tel.txt.value;

		var errMsg;

		if (name == null) {
			errMsg = "名前が入力されていません";
		} else if (zip == null) {
			errMsg = "郵便番号が入力されていません";
		} else if (address1 == null) {
			errMsg = "住所が入力されていません";
		} else if (email == null) {
			errMsg = "メールが入力されていません";
		}

		alert(errMsg);

	}
</script>
</html>
