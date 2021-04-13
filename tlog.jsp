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
		String pwd=request.getParameter("pwd");
		
		String qr1="select * from teacher where id=? and email=? and pwd=?";
		PreparedStatement ps1=con.prepareStatement(qr1);
		ps1.setString(1, id);
		ps1.setString(2, email);
		ps1.setString(3, pwd);
		ResultSet rs1=ps1.executeQuery();
		if(rs1.next())
		{
			String tname=rs1.getString("name");
			String qr="select status from teacher where id=?";
			PreparedStatement ps=con.prepareStatement(qr);
			ps.setString(1, id);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				String status=rs.getString("status");
				if(status.equals("pending"))
				{
					%><script>alert("Not approved by admin!!");
					window.location.href="teacher.jsp";</script><%	
				}
				else{					
					session.setAttribute("id", id);
					session.setAttribute("email", email);
					session.setAttribute("tname", tname);
					response.sendRedirect("t_home.jsp");
				}
			}
		}
		else{		
			%><script>alert("id or password is invalid!!");
			window.location.href="teacher.jsp";</script><%	
		}
	%>
</body>
</html>