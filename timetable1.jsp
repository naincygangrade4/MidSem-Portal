<%@include file="db.jsp" %>
<%
String branch = request.getParameter("branch");
String sem = request.getParameter("sem");
String date1 = request.getParameter("date1");
String subject1 = request.getParameter("subject1");
String date2 = request.getParameter("date2");
String subject2 = request.getParameter("subject2");
String date3 = request.getParameter("date3");
String subject3 = request.getParameter("subject3");
String date4 = request.getParameter("date4");
String subject4 = request.getParameter("subject4");
String date5 = request.getParameter("date5");
String subject5 = request.getParameter("subject5");

String qr="insert into timetable value(?,?,?,?,?,?,?,?,?,?,?,?)";
PreparedStatement ps=con.prepareStatement(qr);
ps.setString(1, branch);
ps.setString(2, sem);
ps.setString(3, date1);
ps.setString(4, subject1);
ps.setString(5, date2);
ps.setString(6, subject2);
ps.setString(7, date3);
ps.setString(8, subject3);
ps.setString(9, date4);
ps.setString(10, subject4);
ps.setString(11, date5);
ps.setString(12, subject5);
int i =ps.executeUpdate();
if(i>0)
{
	%>
	<script>
	window.alert('Time Tbale successfully Uploaded');
	window.location.href="ahome.jsp";
	</script>
	<%
}

%>