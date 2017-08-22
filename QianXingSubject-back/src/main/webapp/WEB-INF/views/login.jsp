<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<title>Insert title here</title>
</head>

<body>
	<strong>${message }</strong>
	<form action="do_login">
		<label>AdminName:<input name="adminName"></label><br/>
		<label>AdminPwd:<input name="adminPwd"></label><br/>
		<button type="submit">login</button>
	</form>
</body>
</html>