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
						<input type="text" name="name" id="name" maxlength="20">
					</td>
				</tr>
				<tr>
					<td class="title">郵便番号</td>
					<td>
						<input type="text" name="zip" id="zip" maxlength="10">
					</td>
				</tr>
				<tr>
					<td class="title">住所1</td>
					<td>
						<input type="text" name="address1" id="address1" maxlength="48">
					</td>
				</tr>
				<tr>
					<td class="title">住所2</td>
					<td>
						<input type="text" name="address2" id="address2" maxlength="48">
					</td>
				</tr>
				<tr>
					<td class="title">TEL</td>
					<td>
						<input type="text" name="tel" id="tel" maxlength="20">
					</td>
				</tr>
				<tr>
					<td class="title">FAX</td>
					<td>
						<input type="text" name="fax" id="fax" maxlength="20">
					</td>
				</tr>
				<tr>
					<td class="title">Email</td>
					<td>
						<input type="text" name="email" id="email" maxlength="50">
					</td>
				</tr>
			</table>
			<p>
				<button name="state" value="new_confirm">送信</button>
				<input type="button" value="戻る" onclick="history.back()">
			</p>
		</form>
	</div>
</body>
<script type="text/javascript">
	function funcConfirm(event) {
		'use strict';

		// イベントからフォームを取得（event.target が FORM でない場合は document.forms['form1'] を参照）
		var form = null;
		if (event && event.target && event.target.tagName === 'FORM') {
			form = event.target;
		} else if (document && document.forms && document.forms['form1']) {
			form = document.forms['form1'];
		} else {
			if (event && typeof event.preventDefault === 'function')
				event.preventDefault();
			return false;
		}

		// 共通正規表現
		var reZip = /^\d{3}-?\d{4}$/; // 123-4567 or 1234567
		var reEmail = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
		var reTelFax = /^[0-9\-\s\(\)]+$/;

		// ヘルパー
		function getField(name) {
			return form.elements[name] || null;
		}
		function valueOf(name) {
			var f = getField(name);
			return f && f.value ? String(f.value).trim() : "";
		}

		var errors = [];
		var firstField = null;

		// 氏名: 必須・最大20
		var name = valueOf('name');
		if (name === "") {
			errors.push('氏名が入力されていません');
			firstField = firstField || getField('name');
		} else if (name.length >= 20) {
			errors.push('氏名は20文字以内で入力してください');
			firstField = firstField || getField('name');
		}

		// 郵便番号: 必須・形式
		var zip = valueOf('zip');
		if (zip === "") {
			errors.push('郵便番号が入力されていません');
			firstField = firstField || getField('zip');
		} else if (!reZip.test(zip)) {
			errors.push('郵便番号は「123-4567」または「1234567」の形式で入力してください');
			firstField = firstField || getField('zip');
		}

		// 住所1: 必須・最大48
		var address1 = valueOf('address1');
		if (address1 === "") {
			errors.push('住所1が入力されていません');
			firstField = firstField || getField('address1');
		} else if (address1.length >= 48) {
			errors.push('住所1は48文字以内で入力してください');
			firstField = firstField || getField('address1');
		}

		// 住所2: 任意・最大48
		var address2 = valueOf('address2');
		if (address2.length >= 48) {
			errors.push('住所2は48文字以内で入力してください');
			firstField = firstField || getField('address2');
		}

		// TEL: 任意・形式・最大20
		var tel = valueOf('tel');
		if (tel !== "") {
			if (!reTelFax.test(tel)) {
				errors.push('TELは数字、ハイフン、空白、括弧のみで入力してください');
				firstField = firstField || getField('tel');
			} else if (tel.length >= 20) {
				errors.push('TELは20文字以内で入力してください');
				firstField = firstField || getField('tel');
			}
		}

		// FAX: 任意・形式・最大20
		var fax = valueOf('fax');
		if (fax !== "") {
			if (!reTelFax.test(fax)) {
				errors.push('FAXは数字、ハイフン、空白、括弧のみで入力してください');
				firstField = firstField || getField('fax');
			} else if (fax.length >= 20) {
				errors.push('FAXは20文字以内で入力してください');
				firstField = firstField || getField('fax');
			}
		}

		// Email: 必須・形式・最大50
		var email = valueOf('email');
		if (email === "") {
			errors.push('Emailが入力されていません');
			firstField = firstField || getField('email');
		} else if (email.length >= 50) {
			errors.push('Emailは50文字以内で入力してください');
			firstField = firstField || getField('email');
		} else if (!reEmail.test(email)) {
			errors.push('Emailの形式が正しくありません');
			firstField = firstField || getField('email');
		}

		// エラーがあればまとめて表示し、最初のエラー項目にフォーカスして送信中止
		if (errors.length > 0) {
			alert(errors.join('\n'));
			if (firstField && typeof firstField.focus === 'function')
				firstField.focus();
			if (event && typeof event.preventDefault === 'function')
				event.preventDefault();
			return false;
		}

		// 送信前にフォーム内の値をトリムしておく
		[ 'name', 'zip', 'address1', 'address2', 'tel', 'fax', 'email' ]
				.forEach(function(n) {
					var f = getField(n);
					if (f && typeof f.value === 'string')
						f.value = f.value.trim();
				});

		// 問題なければ送信を許可
		return true;
	}
</script>
</html>
