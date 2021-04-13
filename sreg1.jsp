<%@include file="db.jsp" %>
<%
String id=request.getParameter("id");
String name=request.getParameter("name");
String email=request.getParameter("email");
String pwd=request.getParameter("pwd");
String cpwd=request.getParameter("cpwd");
String number=request.getParameter("number");
String sem=request.getParameter("sem");

String qr="select * from student where id=?";
PreparedStatement ps=con.prepareStatement(qr);
ps.setString(1, id);
ResultSet rs=ps.executeQuery();
if(rs.next())
{
	%><script>alert("Student with this id is already registered");
		window.location.href="sreg.jsp";		
	</script><%
}
else{
	String qr1="insert into student (id,name,email,pwd,cpwd,number,sem) values(?,?,?,?,?,?,?)";
	PreparedStatement ps1=con.prepareStatement(qr1);
	ps1.setString(1, id);
	ps1.setString(2, name);
	ps1.setString(3, email);
	ps1.setString(4, pwd);
	ps1.setString(5, cpwd);
	ps1.setString(6, number);
	ps1.setString(7, sem);
	int i=ps1.executeUpdate();
	if(i>0)
	{
		%><script>
			alert("Successfully Registered admin will confirm you within 24 hours");
			window.location.href="student.jsp";
		</script><%
	}
}
%>
//session.setAttribute("id", id);
//session.setAttribute("name", name);
//session.setAttribute("email", email);
//session.setAttribute("pwd", pwd);
//session.setAttribute("number", number);
//session.setAttribute("sem", sem);
//Random rand = new Random();
//int otp = rand.nextInt(900000) + 100000;
//session.setAttribute("otp",otp);
//response.sendRedirect("sreg2.jsp");
//%>
</body>
</html>