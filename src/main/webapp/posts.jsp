<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.jspcrud.BoardDAO, com.example.jspcrud.BoardVO, java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Free Board</title>
	<style>
		body {
			margin: 0;
			padding: 0;
			background-color: #f2f2f2;
			font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
		}

		.container {
			width: 80%;
			margin: auto;
		}

		h1 {
			color: #007BFF;
			text-align: center;
			margin-top: 20px;
		}

		#list-container {
			margin-top: 20px;
		}

		#add-post-link {
			display: block;
			margin-top: 20px;
			color: #28a745;
			font-weight: bold;
			text-align: center;
			text-decoration: none;
		}

		#add-post-link:hover {
			text-decoration: underline;
		}

		#list {
			border-collapse: collapse;
			width: 100%;
			margin-top: 20px;
		}

		#list th, #list td {
			border: 1px solid #ddd;
			padding: 12px;
			text-align: center;
		}

		#list th {
			background-color: #007BFF;
			color: white;
		}

		#list tr:nth-child(even) {
			background-color: #f8f9fa;
		}

		#list tr:hover {
			background-color: #e0e0e0;
		}

		#list a {
			text-decoration: none;
			color: #007BFF;
			font-weight: bold;
		}

		#list a:hover {
			text-decoration: underline;
		}

		.action-links {
			display: flex;
			justify-content: center;
		}

		.edit-link, .delete-link {
			margin: 0 5px;
			color: #007BFF;
			font-weight: bold;
			text-decoration: none;
		}

		.edit-link:hover, .delete-link:hover {
			text-decoration: underline;
		}

	</style>
	<script>
		function delete_ok(id) {
			var a = confirm("정말로 삭제하겠습니까?");
			if (a) location.href = 'deletepost.jsp?id=' + id;
		}
	</script>
</head>
<body>
<h1>자유게시판</h1>
<%
	BoardDAO boardDAO = new BoardDAO();
	List<BoardVO> list = boardDAO.getBoardList();
	request.setAttribute("list", list);
%>
<table id="list">
	<tr>
		<th>Id</th>
		<th>Title</th>
		<th>Writer</th>
		<th>Content</th>
		<th>Category</th>
		<th>Moddate</th>
		<th>Regdate</th>
		<th>Edit</th>
		<th>Delete</th>
	</tr>
	<c:forEach items="${list}" var="u">
		<tr>
			<td>${u.getSeq()}</td>
			<td>${u.getTitle()}</td>
			<td>${u.getWriter()}</td>
			<td>${u.getContent()}</td>
			<td>${u.getCategory()}</td>
			<td>${u.getModdate()}</td>
			<td>${u.getRegdate()}</td>
			<td><a href="editform.jsp?id=${u.getSeq()}">Edit</a></td>
			<td><a href="javascript:delete_ok('${u.getSeq()}')">Delete</a></td>
		</tr>
	</c:forEach>
</table>
<br/><a href="addpostform.jsp">Add New Post</a>
</body>
</html>
