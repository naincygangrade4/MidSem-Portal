<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@include file="db.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String id=request.getParameter("id");
		String email=request.getParameter("email");
		String qr="delete from teacher where id=?";
		PreparedStatement ps=con.prepareStatement(qr);
		ps.setString(1, id);
		int i=ps.executeUpdate();
		if(i>0)
		{
			response.sendRedirect("treject1.jsp?id="+id+"&email="+email+"");
		}
		else{
			%><script>alert("server error");
			window.location.href="ahome.jsp";</script><%
		}
	%>
</body>
</html>