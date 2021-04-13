<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student home</title>
	<style>
		.tdata{
			opacity: 0.6;
			cursor: not-allowed;
		}
		#start{
			cursor: not-allowed;
		}
	</style>
	<script type="text/javascript">
		function val()
		{
			document.getElementById('start').disabled=true;
		}
	</script>
		<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.css" />
		<link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.css" />
		<link rel="stylesheet" href="assets/vendor/magnific-popup/magnific-popup.css" />
		<link rel="stylesheet" href="assets/vendor/bootstrap-datepicker/css/datepicker3.css" />

		<!-- Theme CSS -->
		<link rel="stylesheet" href="assets/stylesheets/theme.css" />

		<!-- Skin CSS -->
		<link rel="stylesheet" href="assets/stylesheets/skins/default.css" />

		<!-- Theme Custom CSS -->
		<link rel="stylesheet" href="assets/stylesheets/theme-custom.css">

		<!-- Head Libs -->
		<script src="assets/vendor/modernizr/modernizr.js"></script>
		
</head>
<body>
<%@ page import="java.sql.*"%>
<%  
String subject=request.getParameter("subject");
if(subject==null||subject.trim().equals("")){  
  
}else{  
	Class.forName("com.mysql.jdbc.Driver");  
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz","root","root"); 
	String qr="select * from quiz where subject=?";
	PreparedStatement ps=con.prepareStatement(qr);
	ps.setString(1, subject);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		%>
		<section class="panel">
			<div class="panel-body">
									<style>
										.swing-in-top-fwd {
												animation: swing-in-top-fwd 0.8s cubic-bezier(0.175, 0.885, 0.320, 1.275) both;
											}
											@keyframes swing-in-top-fwd {
											  0% {
											    transform: rotateX(-100deg);
											    transform-origin: top;
											    opacity: 0;
											  }
											  100% {
											    transform: rotateX(0deg);
											    transform-origin: top;
											    opacity: 1;
											  }
											}									
									</style>
									<style>
									.sdc {
										animation: shadow-drop-center 0.4s ease-in-out both ;
									}
									@keyframes shadow-drop-center {
									  0% {
									    box-shadow: 0 0 0 0 rgba(0, 0, 0, 0);
									  }
									  100% {
									    box-shadow: 0 0 20px 0px rgb(52, 73, 94);
									  }
									}
								</style>
				<table class="table  table-bordered table-striped mb-none swing-in-top-fwd sdc" id="datatable-editable">
				<thead>
					<tr>
						<th>Course</th>
						<th>Subject</th>
						<th>Quiz No.</th>
						<th>Status</th>
						<th>Start Quiz</th>
					</tr>
				</thead>
			<%
				do{
					String course=rs.getString("course");
					subject=rs.getString("subject");
					String name=rs.getString("name");
					String status=rs.getString("status");
			%>
			<tbody>
				<tr class="gradeX">
					<%
						if(status.equals("inactive"))
						{
							%>
								<td class="tdata"><%=course %></td>
								<td class="tdata"><%=subject %></td>
								<td class="tdata"><%=name %></td>
								<td class="tdata" style="color:red;text-transform: uppercase;"><span class="fa fa-times-circle" style="color:red;"></span><span style="margin:0px 1px;"></span><%=status %></td>
								<td class="tdata"><button type="button" class="btn btn-sm btn-primary" id="start" onclick="val()">Start Quiz</button></td>
							<%
						}
						else{
							%>
								
								<td><%=course %></td>
								<td><%=subject %></td>
								<td><%=name %></td>
								<td style="color:blue;text-transform: uppercase;"><span class="fa fa-check-circle" style="color:blue;"></span><span style="margin:0px 1px;"></span><%=status %></td>
								<td><a href="start.jsp?course=<%=course%>&subject=<%=subject%>&name=<%=name%>">
								<button type="button" class="btn btn-sm btn-primary">Start Quiz</button>
								</a></td>
							<%
						}
					%>
					
				</tr>
			<%
				}while(rs.next());
			%>
		</tbody>	
		</table>
		<%
	}
	else{
		%>
		<input type="hidden" value="no quiz found">
		<%
	}
}
%>
	</div>
</section>
		<!-- Vendor -->
		<script src="assets/vendor/jquery/jquery.js"></script>
		<script src="assets/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
		<script src="assets/vendor/bootstrap/js/bootstrap.js"></script>
		<script src="assets/vendor/nanoscroller/nanoscroller.js"></script>
		<script src="assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
		<script src="assets/vendor/magnific-popup/magnific-popup.js"></script>
		<script src="assets/vendor/jquery-placeholder/jquery.placeholder.js"></script>
		
		<!-- Specific Page Vendor -->
		<script src="assets/vendor/jquery-validation/jquery.validate.js"></script>
		
		<!-- Theme Base, Components and Settings -->
		<script src="assets/javascripts/theme.js"></script>
		
		<!-- Theme Custom -->
		<script src="assets/javascripts/theme.custom.js"></script>
		
		<!-- Theme Initialization Files -->
		<script src="assets/javascripts/theme.init.js"></script>


		<!-- Examples -->
		<script src="assets/javascripts/forms/examples.validation.js"></script>
</body>
</html>

							