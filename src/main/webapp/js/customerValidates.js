// customerValidate.js
// Place this file under WebContent/js/ and include at the end of the JSP body:
// <script src="${pageContext.request.contextPath}/js/customerValidate.js"></script>

(function() {
	'use strict';

	// デバッグ用（読み込み確認）
	if (window.console && typeof console.log === 'function') {
		console.log('customerValidate.js loaded');
		// DevToolのConsoleに表示
	}


	// 定数（再生成しない）
	const RE_ZIP = /^\d{3}-?\d{4}$/;
	// 123-4567 または 1234567 を許可
	const RE_EMAIL = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
	// 空白を含まない @ とドメインを持つ文字列を許容
	const RE_TEL_FAX = /^[0-9\-\s\(\)]+$/;
	// 電話・FAXの許容文字（数字、ハイフン、空白、括弧）をチェック
	const TRIM_FIELDS = ['name', 'zip', 'address1', 'address2', 'tel', 'fax', 'email'];
	// 送信前にトリム（前後の空白削除）するフィールド名の配列


	// 共通バリデーション（フォームオブジェクトを受け取る）
	function validateForm(form) {
		if (!form) return false;

		const getField = name => form.elements[name] || null;
		const valueOf = name => {
			const f = getField(name);
			return f && f.value ? String(f.value).trim() : '';
			// 要素が存在し、かつ f.value が真値（空でない等）なら String(f.value).trim() を返す
			// それ以外は空文字 '' を返す
		};

		const errors = [];
		let firstField = null;

		// 氏名: 必須・最大20
		const name = valueOf('name');
		if (name === '') {
			errors.push('氏名が入力されていません');
			firstField = firstField || getField('name');
		} else if (name.length > 20) {
			errors.push('氏名は20文字以内で入力してください');
			firstField = firstField || getField('name');
		}

		// 郵便番号: 必須・形式
		const zip = valueOf('zip');
		if (zip === '') {
			errors.push('郵便番号が入力されていません');
			firstField = firstField || getField('zip');
		} else if (!RE_ZIP.test(zip)) {
			errors.push('郵便番号は「123-4567」または「1234567」の形式で入力してください');
			firstField = firstField || getField('zip');
		}

		// 住所1: 必須・最大98（元仕様を維持）
		const address1 = valueOf('address1');
		if (address1 === '') {
			errors.push('住所1が入力されていません');
			firstField = firstField || getField('address1');
		} else if (address1.length > 98) {
			errors.push('住所1は98文字以内で入力してください');
			firstField = firstField || getField('address1');
		}

		// 住所2: 任意・最大98
		const address2 = valueOf('address2');
		if (address2.length > 98) {
			errors.push('住所2は98文字以内で入力してください');
			firstField = firstField || getField('address2');
		}

		// TEL: 任意・形式・最大20
		const tel = valueOf('tel');
		if (tel !== '') {
			if (!RE_TEL_FAX.test(tel)) {
				errors.push('TELは数字、ハイフン、空白、括弧のみで入力してください');
				firstField = firstField || getField('tel');
			} else if (tel.length > 20) {
				errors.push('TELは20文字以内で入力してください');
				firstField = firstField || getField('tel');
			}
		}

		// FAX: 任意・形式・最大20
		const fax = valueOf('fax');
		if (fax !== '') {
			if (!RE_TEL_FAX.test(fax)) {
				errors.push('FAXは数字、ハイフン、空白、括弧のみで入力してください');
				firstField = firstField || getField('fax');
			} else if (fax.length > 20) {
				errors.push('FAXは20文字以内で入力してください');
				firstField = firstField || getField('fax');
			}
		}

		// Email: 必須・形式・最大50
		const email = valueOf('email');
		if (email === '') {
			errors.push('Emailが入力されていません');
			firstField = firstField || getField('email');
		} else if (email.length > 50) {
			errors.push('Emailは50文字以内で入力してください');
			firstField = firstField || getField('email');
		} else if (!RE_EMAIL.test(email)) {
			errors.push('Emailの形式が正しくありません');
			firstField = firstField || getField('email');
		}

		// エラーがあればまとめて表示し、最初のエラー項目にフォーカス
		if (errors.length > 0) {
			// UX: 複数エラーをまとめて表示
			alert(errors.join('\n'));
			if (firstField && typeof firstField.focus === 'function') {
				try { firstField.focus(); } catch (e) { /* ignore */ }
			}
			return false;
		}

		// 送信前トリム
		TRIM_FIELDS.forEach(function(n) {
			const f = form.elements[n];
			if (f && typeof f.value === 'string') f.value = f.value.trim();
		});

		return true;
	}

	// onsubmit から呼ばれるエントリポイント（event を受け取る）
	window.funcConfirm = function(event) {

		// JSP からのみ呼ばれる前提なので固定で form1 を使う
		const form = document.forms['form1'] || null;

		if (!form) {
			if (event && typeof event.preventDefault === 'function') event.preventDefault();
			return false;
		}

		const ok = validateForm(form);
		if (!ok) {
			if (event && typeof event.preventDefault === 'function') event.preventDefault();
			return false;
		}
		return true;
	};

	// 互換性のために validateForm を外部からも呼べるように公開
	window.validateForm = validateForm;

})();
