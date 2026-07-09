<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="customer.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean class="user.UserBean" id="user" scope="session" />
<jsp:useBean class="customer.CustomerListBean" id="customerList" scope="request" />

<!doctype html>
<html>
<head>
<title>顧客管理</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
</head>
<body>
	<h1>顧客管理</h1>
	<div class="main">
		<h2>検索結果</h2>
		<table border="1">
			<tr>
				<th>ＩＤ</th>
				<th>氏名</th>
				<th>郵便番号</th>
				<th>住所</th>
				<%
				if (user.getLvl() >= 1)
				{
				%>
				<th colspan="2" style="width: 100px">操作</th>
				<%
				}
				%>
			</tr>

			<c:set var="i" value="0" />
			<c:forEach begin="0" end="999">
				<!-- 無限ループを防ぐためのセーフティネット -->
				<c:if test="${costomerList.hasNext()}">
					<!-- whileの条件式 -->
					<!-- ここに繰り返したい処理を記述 -->

					<%
					CustomerBean customer = customerList.getNext();
					%>

					<tr>
						<td class="center">${cutomer.id}</td>
						<td>${cutomer.name}</td>
						<td>${cutomer.zip}</td>
						<td>${cutomer.address1}${cutomer.address2}</td>

						<c:if test="${user.getLvl() >= 1 }">
							<td class="center">
								<form action="CustomerServlet" method="post">
									<button name="state" value="detail,${request.cutomer.id}">詳細</button>
								</form>
							</td>
						</c:if>
						<!-- TODO ｢削除｣ボタン -->



					</tr>

				</c:if>

				<c:set var="i" value="${i + 1}" />
			</c:forEach>

		</table>
		<form action="CustomerServlet" method="post">
			<p>

				<!-- TODO ｢新規登録｣ボタン -->

				<button name="state" value="search">検索条件画面</button>
			</p>
		</form>
	</div>
</body>
</html>
