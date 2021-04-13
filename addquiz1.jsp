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
		String tname=(String) session.getAttribute("tname");
		String name=request.getParameter("name");
		String course=request.getParameter("course");
		String subject=request.getParameter("subject");
		String duration=request.getParameter("duration");
		String passmark=request.getParameter("passmark");
		String q="select * from quiz where course=? and subject=? and name=?";
		PreparedStatement p=con.prepareStatement(q);
		p.setString(1, course);
		p.setString(2, subject);
		p.setString(3, name);
		ResultSet rs=p.executeQuery();
		if(rs.next())
		{
			%><script>alert("Already Added");
			window.location.href="t_home.jsp";</script><%
		}
		else{
			String qr="insert into quiz (tname,course,subject,name,duration,passmark) values(?,?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(qr);
			ps.setString(1, tname);
			ps.setString(2, course);
			ps.setString(3, subject);
			ps.setString(4, name);
			ps.setString(5, duration);
			ps.setString(6, passmark);
			int i=ps.executeUpdate();
			if(i>0)
			{
				%><script>alert("Successfully added");
				window.location.href="t_home.jsp";</script><%
			}
			else{
				%><script>alert("Server Error");
				window.location.href="t_home.jsp";</script><%
			}	
		}
	%>
</body>
</html>