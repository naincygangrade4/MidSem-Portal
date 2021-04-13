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
		String qid=request.getParameter("id");
		int id=Integer.parseInt(qid);
		String status=request.getParameter("status");
		String qr="update quiz set status=? where id=?";
		PreparedStatement ps=con.prepareStatement(qr);
		ps.setString(1, status);
		ps.setInt(2, id);
		int i=ps.executeUpdate();
		if(i>0)
		{
			%><script>alert("Activated!!");
			window.location.href="qlist.jsp";</script><%
		}
		else{
			%><script>alert("Server Error..");
			window.location.href="qlist.jsp";</script><%
		}
	%>
</body>
</html>