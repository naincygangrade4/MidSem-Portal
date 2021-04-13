<%@include file="db.jsp" %>
<%
String id=request.getParameter("id");
String name=request.getParameter("name");
String email=request.getParameter("email");
String pwd=request.getParameter("pwd");
String cpass=request.getParameter("cpwd");
String number=request.getParameter("number");
String subject=request.getParameter("subject");

	String qr="select * from teacher where id=?";
	PreparedStatement ps=con.prepareStatement(qr);
	ps.setString(1, id);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		%><script>alert("Teacher with this id is already registered");
		window.location.href="treg.jsp";</script><%
	}
	else{
		String qr1="insert into teacher (id,name,email,pwd,cpwd,number,subject) values(?,?,?,?,?,?,?)";
		PreparedStatement ps1=con.prepareStatement(qr1);
		ps1.setString(1, id);
		ps1.setString(2, name);
		ps1.setString(3, email);
		ps1.setString(4, pwd);
		ps1.setString(5, cpass);
		ps1.setString(6, number);
		ps1.setString(7, subject);
		int i=ps1.executeUpdate();
		if(i>0)
		{
			session.setAttribute("id",id);
			%><script>alert("Successfully Registered admin will confirm you within 24 hours");
			window.location.href="teacher.jsp";</script><%
		}
		else{
			%><script>alert("Server Error..Please try again later!!");
			window.location.href="teacher.jsp";</script><%
		}
	}
//session.setAttribute("id", id);
//session.setAttribute("name", name);
//session.setAttribute("email", email);
//session.setAttribute("pwd", pwd);
//session.setAttribute("number", number);
//session.setAttribute("subject", subject);
//Random rand = new Random();
//int otp = rand.nextInt(900000) + 100000;
//session.setAttribute("otp",otp);
//response.sendRedirect("treg2.jsp");
%>
