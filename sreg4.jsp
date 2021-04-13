<%@include file="db.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
String id=(String)session.getAttribute("id");
String name=(String)session.getAttribute("name");
String email=(String)session.getAttribute("email");
String pwd=(String)session.getAttribute("pwd");
String number=(String)session.getAttribute("number");
String sem=(String)session.getAttribute("sem");
int otp= (Integer) session.getAttribute("otp");
String otpvalue=request.getParameter("otpvalue");
int enterOtp=Integer.parseInt(otpvalue);
if(otp==enterOtp)
{
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
		String qr1="insert into student (id,name,email,pwd,number,sem) values(?,?,?,?,?,?)";
		PreparedStatement ps1=con.prepareStatement(qr1);
		ps1.setString(1, id);
		ps1.setString(2, name);
		ps1.setString(3, email);
		ps1.setString(4, pwd);
		ps1.setString(5, number);
		ps1.setString(6, sem);
		int i=ps1.executeUpdate();
		if(i>0)
		{
			%><script>
				alert("Successfully Registered admin will confirm you within 24 hours");
				window.location.href="student.jsp";
			</script><%
		}
		else{
			%><script>alert("Server Error..Please try again later!!");
			window.location.href="student.jsp";
			</script>
			<%
		}
	}
}
else
{
	%><script>alert("Enter Correct OTP!!!");
	window.location.href="sreg3.jsp";
	</script>
	<%
}
%>