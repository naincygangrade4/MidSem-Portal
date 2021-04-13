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
	String tname=(String) session.getAttribute("tname");
	String name=request.getParameter("name");
	String course=request.getParameter("course");
	String subject=request.getParameter("subject");
	String duration=request.getParameter("duration");
	String passmark=request.getParameter("passmark");
	String qr="update quiz set tname=?,course=?,subject=?,name=?,duration=?,passmark=? where id=?";
	PreparedStatement ps=con.prepareStatement(qr);
	ps.setString(1, tname);
	ps.setString(2, course);
	ps.setString(3, subject);
	ps.setString(4, name);
	ps.setString(5, duration);
	ps.setString(6, passmark);
	ps.setInt(7, id);
	int i=ps.executeUpdate();
	if(i>0)
	{
		%><script>alert("<%=name%> of <%=subject%> is edited successfully");
		window.location.href="qlist.jsp";</script><%
	}
	else{
		%><script>alert("Server Error!!!");
		window.location.href="qlist.jsp";</script><%
	}
%>
</body>
</html>