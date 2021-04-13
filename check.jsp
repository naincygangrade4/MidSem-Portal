<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
</head>
<body align="center">
<%@ page import="java.sql.*"%>
<%  
String course=request.getParameter("course");
String subject=request.getParameter("subject");
String name=request.getParameter("name");
if(name==null||name.trim().equals("")){  
  
}else{  
	Class.forName("com.mysql.jdbc.Driver");  
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz","root","scott"); 
	String qr="select * from question where course=? and subject=? and name=?";
	PreparedStatement ps=con.prepareStatement(qr);
	ps.setString(1, course);
	ps.setString(2, subject);
	ps.setString(3, name);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		%>
		<section class="panel">
			<div class="col-md-12">
				<div class="panel-body">
					<div class="table-responsive sdc">
								<style>
									.swing-in-top-fwd {
											animation: swing-in-top-fwd 0.8s ease-in-out both;
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
						<table class="table table-bordered table-striped table-condensed mb-none swing-in-top-fwd">
							<thead>
								<tr>
									<th class="text-left">QId</th>
									<th class="text-left">Question</th>
									<th class="text-left">Option A</th>
									<th class="text-left">Option B</th>
									<th class="text-left">Option C</th>
									<th class="text-left">Option D</th>
									<th class="text-left">Answer</th>
									<th class="text-left">Action</th>
							   </tr>
						   </thead>
							<%
								do{
									int qid=rs.getInt(1);
									String question=rs.getString(5);
									String opta=rs.getString(6);
									String optb=rs.getString(7);
									String optc=rs.getString(8);
									String optd=rs.getString(9);
									String ca=rs.getString(10);
							%>
							<tbody>
								<tr>
									<td class="text-left"><%=qid %></td>
									<td class="text-left"><%=question %></td>
									<td class="text-left"><%=opta %></td>
									<td class="text-left"><%=optb %></td>
									<td class="text-left"><%=optc %></td>
									<td class="text-left"><%=optd %></td>
									<td class="text-left" style="color:blue;"><%=ca %></td>
									<td class="text-left">	
										<div class="col-md-13">
											<div class="btn-group">
												<button type="button" class=" btn btn-default dropdown-toggle" data-toggle="dropdown">Action <span class="caret"></span></button>
												<ul class="dropdown-menu" role="menu">
													<li><a href="quesdel.jsp?qid=<%=qid%>">Remove</a></li>
													<li><a href="quesedit.jsp?qid=<%=qid%>&question=<%= question%>&opta=<%= opta%>&optb=<%= optb%>&optc=<%= optc%>&optd=<%= optd%>&ca=<%= ca%>">Edit</a></li>
												</ul>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
							<%
								}while(rs.next());
							%>
						
						</table>
					</div>
				</div>
			</div>
		</section>
						<%
					}
					else{
						%>
						<input type="hidden" value="no ques found">
						<%
					}
				}
				%>
		<script src="assets/vendor/jquery/jquery.js"></script>
		<script src="assets/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
		<script src="assets/vendor/bootstrap/js/bootstrap.js"></script>
		<script src="assets/vendor/nanoscroller/nanoscroller.js"></script>
		<script src="assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
		<script src="assets/vendor/magnific-popup/magnific-popup.js"></script>
		<script src="assets/vendor/jquery-placeholder/jquery.placeholder.js"></script>
		
		<!-- Theme Base, Components and Settings -->
		<script src="assets/javascripts/theme.js"></script>
		
		<!-- Theme Custom -->
		<script src="assets/javascripts/theme.custom.js"></script>
		
		<!-- Theme Initialization Files -->
		<script src="assets/javascripts/theme.init.js"></script>
</body>
</html>

												
								