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
		String bid=request.getParameter("id");
		int id=Integer.parseInt(bid);
		String qr="delete from quiz where id=?";
		PreparedStatement ps=con.prepareStatement(qr);
		ps.setInt(1, id);
		int i=ps.executeUpdate();
		if(i>0)
		{
			%><script>alert("Quiz removed Successfully");
			window.location.href="t_home.jsp";</script><%
		}
		else{
			%><script>alert("Server Error!!!");
			window.location.href="t_home.jsp";</script><%
		}
	%>
</body>
</html>