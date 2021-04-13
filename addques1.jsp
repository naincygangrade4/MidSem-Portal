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
		String course=null;
		String subject=null;
		String name=null;
		course=request.getParameter("course");
		subject=request.getParameter("subject");
		name=request.getParameter("name");
		String question=request.getParameter("question");
		String opta=request.getParameter("opta");
		String optb=request.getParameter("optb");
		String optc=request.getParameter("optc");
		String optd=request.getParameter("optd");
		String ca=request.getParameter("ca");
		String qr="select * from quiz where course=? and subject=? and name=?";
		PreparedStatement ps=con.prepareStatement(qr);
		ps.setString(1, course);
		ps.setString(2, subject);
		ps.setString(3, name);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			String q="insert into question (course,subject,name,question,opta,optb,optc,optd,ca) values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement p=con.prepareStatement(q);
			p.setString(1, course);
			p.setString(2, subject);
			p.setString(3, name);
			p.setString(4, question);
			p.setString(5, opta);
			p.setString(6, optb);
			p.setString(7, optc);
			p.setString(8, optd);
			p.setString(9, ca);
			int i=p.executeUpdate();
			if(i>0)
			{
				response.sendRedirect("addmore.jsp?course="+course+"&subject="+subject+"&name="+name+"");
			}
			else{
				%><script>alert("Cannot add question at moment");
				window.location.href="addques.jsp";</script><%
			}
		}
		else{
			%><script>alert("Quiz you selected is not Added yet");
			window.location.href="addques.jsp";</script><%
		}
	%>
</body>
</html>