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
String name=request.getParameter("name");
String email=request.getParameter("email");
String number=request.getParameter("number");
String subject=request.getParameter("subject");
String qr="update teacher set id=?,name=?,number=?,subject=? where email=?";
PreparedStatement ps=con.prepareStatement(qr);
ps.setString(1, id);
ps.setString(2, name);
ps.setString(3, number);
ps.setString(4, subject);
ps.setString(5, email);
int i=ps.executeUpdate();
if(i>0)
{
	%>
	<script>
		alert("Successfully Updated Your Profile");
		window.location.href="t_home.jsp";
	</script>
	<%
}
else{
	%>
	<script>
		alert("Server Error...Try again later!!!");
		window.location.href="t_home.jsp";
	</script>
	<%
}
%>
</body>
</html>