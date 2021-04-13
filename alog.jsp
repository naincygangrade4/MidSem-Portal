<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String name=request.getParameter("name");
		String pwd=request.getParameter("pwd");
		if(name.equals("admin") && pwd.equals("12345"))
		{
			response.sendRedirect("ahome.jsp");
		}
		else{
			%><script>alert("invalid name or password");
			window.location.href="admin.jsp";</script><%	
		}
	%>
</body>
</html>