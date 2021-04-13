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
	String id=request.getParameter("qid");
	int qid=Integer.parseInt(id);
	String question=request.getParameter("question");
	String opta=request.getParameter("opta");
	String optb=request.getParameter("optb");
	String optc=request.getParameter("optc");
	String optd=request.getParameter("optd");
	String ca=request.getParameter("ca");
	String qr="update question set question=?,opta=?,optb=?,optc=?,optd=?,ca=? where qid=?";
	PreparedStatement ps=con.prepareStatement(qr);
	ps.setString(1, question);
	ps.setString(2, opta);
	ps.setString(3, optb);
	ps.setString(4, optc);
	ps.setString(5, optd);
	ps.setString(6, ca);
	ps.setInt(7, qid);
	int i=ps.executeUpdate();
	if(i>0)
	{
		%><script>window.alert('Question Edited');
		window.location.href="t_home.jsp";</script><%
	}
	else{
		%><script>window.alert('Server Error');
		window.location.href="t_home.jsp";</script><%
	}
	%>
</body>
</html>