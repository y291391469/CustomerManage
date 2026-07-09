<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
					</td>
				</tr>
				<tr>
					<td class="title">住所1</td>
					<td>
					</td>
				</tr>
				<tr>
					<td class="title">住所2</td>
					<td>
					</td>
				</tr>
				<tr>
					<td class="title">TEL</td>
					<td>
					</td>
				</tr>
				<tr>
					<td class="title">FAX</td>
					<td>
					</td>
				</tr>
				<tr>
					<td class="title">Email</td>
					<td>
					</td>
				</tr>
			</table>
			<p>
			</p>
		</form>
	</div>
</body>
<script type="text/javascript">
	function funcConfirm() {

		// TODO バリデーションチェック･alertダイアログ処理


			errMsg = "名前が入力されていません";
			errMsg = "郵便番号が入力されていません";
			errMsg = "住所が入力されていません";
			errMsg = "メールが入力されていません";
		}


	}
</script>
</html>
