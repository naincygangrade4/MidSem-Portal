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
		String subject1=request.getParameter("subject1");
		
		String qr="delete from timetable where subject1=?";
		PreparedStatement ps=con.prepareStatement(qr);
		ps.setString(1, subject1);
		int i=ps.executeUpdate();
		if(i>0)
		{
			RequestDispatcher rd=request.getRequestDispatcher("checktimetable.jsp");
			rd.include(request, response);
			%><script>window.alert('Removed!!');</script><%
		}
	%>
</body>
</html>