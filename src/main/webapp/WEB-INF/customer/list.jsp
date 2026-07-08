<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="customer.*"%>
<jsp:useBean class="user.UserBean" id="user" scope="session" />
<%-- <jsp:useBean class="customer.CustomerListBean" id="customerList" scope="request" /> --%>

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
			<%
			while (customerList.hasNext())
			{
			    CustomerBean customer = customerList.getNext();
			%>
			<tr>
				<td class="center">${request.cutomer.id}</td>
				<td>${request.cutomer.name}</td>
				<td>${request.cutomer.zip}</td>
				<td>${request.cutomer.address1}${request.cutomer.address2}</td>
				<%
				if (user.getLvl() >= 1)
				{
				%>
				<td class="center">
					<form action="CustomerServlet" method="post">
						<button name="state" value="detail,${request.cutomer.id}">詳細</button>
					</form>
				</td>

				<!-- TODO ｢削除｣ボタン -->

				<%
				}
				%>
			</tr>
			<%
			}
			%>
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
