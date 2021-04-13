<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="db.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body align="center">
	<h1>Students List</h1>
	<%
		String qr="select * from student where status=?";
		PreparedStatement ps=con.prepareStatement(qr);
		ps.setString(1, "pending");
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			%>
			<table align="center" border="1px">
				<tr>
					<th>ID</th>
					<th>NAME</th>
					<th>EMAIL</th>
					<th>MOBILE NO.</th>
					<th>SEMESTER</th>
					<th>STATUS</th>
					<th>CONFIRM</th>
					<th>REJECT</th>
				</tr>
			<%
				do{
					String id=rs.getString("id");
					String name=rs.getString("name");
					String email=rs.getString("email");
					String number=rs.getString("number");
					String sem=rs.getString("sem");
					String status=rs.getString("status");
					%>
					<tr>
						<td><%=id %></td>
						<td><%=name %></td>
						<td><%=email %></td>
						<td><%=number %></td>
						<td><%=sem %> SEM</td>
						<td style="color: red; font-weight: bold;"><%=status %></td>
						<td><a href="sconfirm.jsp?id=<%=id %>&email=<%=email%>&status=confirm"><button>Confirm</button></a></td>
						<td><a href="sreject.jsp?id=<%=id %>&email=<%=email%>"><button>Reject</button></a></td>
					</tr>
					<%
				}while(rs.next());
			%>
			</table>
			<%
		}
		else{
			RequestDispatcher rd=request.getRequestDispatcher("t_home.jsp");
			rd.include(request, response);
			%><script>alert("No New Registration Found!!!")</script><%
		}
	%>
</body>
</html>