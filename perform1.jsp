<!DOCTYPE html>
<html class="fixed">
<%@include file="db.jsp" %>
	<head>
		<!-- Basic -->
		<meta charset="UTF-8">

		<title>Student Home</title>
		<meta name="keywords" content="HTML5 Admin Template" />
		<meta name="description" content="JSOFT Admin - Responsive HTML5 Template">
		<meta name="author" content="JSOFT.net">

		<!-- Mobile Metas -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

		<!-- Web Fonts  -->
		<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light" rel="stylesheet" type="text/css">

		<!-- Vendor CSS -->
		<link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.css" />
		<link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.css" />
		<link rel="stylesheet" href="assets/vendor/magnific-popup/magnific-popup.css" />
		<link rel="stylesheet" href="assets/vendor/bootstrap-datepicker/css/datepicker3.css" />

		<!-- Specific Page Vendor CSS -->
		<link rel="stylesheet" href="assets/vendor/morris/morris.css" />

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
	<%String email=(String) session.getAttribute("email"); %>
		<section class="body">

			<!-- start: header -->
			<header class="header">
				<div class="logo-container">
					<a href="s_home.jsp" class="logo">
						<img src="assets/images/q1.jpg" height="35" alt="Quiz Portal" />
					</a>
					<div class="visible-xs toggle-sidebar-left" data-toggle-class="sidebar-left-opened" data-target="html" data-fire-event="sidebar-left-opened">
						<i class="fa fa-bars" aria-label="Toggle sidebar"></i>
					</div>
				</div>
				<div class="header-right">
					<span class="separator"></span>
			
					<div id="userbox" class="userbox">
						<a href="#" data-toggle="dropdown">
							<div class="profile-info" data-lock-name="John Doe" data-lock-email="johndoe@okler.com">
							<% String sname1=(String) session.getAttribute("sname");%>
								<span class="name" style="text-transform: capitalize;"><%=sname1 %></span>
								<span class="role">Student</span>
							</div>
			
							<i class="fa custom-caret"></i>
						</a>
			
						<div class="dropdown-menu">
							<ul class="list-unstyled">
								<li class="divider"></li>
								<li>
									<a role="menuitem" tabindex="-1" href="sdetail.jsp"><i class="fa fa-user"></i> My Profile</a>
								</li>
								<li>
									<a role="menuitem" tabindex="-1" href="logout.jsp"><i class="fa fa-power-off"></i> Logout</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</header>
				

			<div class="inner-wrapper">
				<!-- start: sidebar -->
				<aside id="sidebar-left" class="sidebar-left">
				
					<div class="sidebar-header">
						<div class="sidebar-title">
							Navigation
						</div>
						<div class="sidebar-toggle hidden-xs" data-toggle-class="sidebar-left-collapsed" data-target="html" data-fire-event="sidebar-left-toggle">
							<i class="fa fa-bars" aria-label="Toggle sidebar"></i>
						</div>
					</div>
				
					<div class="nano">
						<div class="nano-content">
							<nav id="menu" class="nav-main" role="navigation">
								<ul class="nav nav-main">
									<li>
										<a href="s_home.jsp">
											<i class="fa fa-code" aria-hidden="true"></i>
											<span>Quiz Section</span>
										</a>
									</li>
									<li>
										<a href="qstatus.jsp">
											<i class="fa fa-list-alt" aria-hidden="true"></i>
											<span>Quiz Status</span>
										</a>
									</li>
									<li class="nav-active">
										<a href="perform.jsp">
											<i class="fa fa-signal" aria-hidden="true"></i>
											<span>View Performance</span>
										</a>
									</li>
								</ul>
							</nav>
						</div>
					</div>
				
				</aside>
				<!-- end: sidebar -->
				<section role="main" class="content-body">
					<header class="page-header">
						<h2>Welcome <%=email %></h2>
						<div class="right-wrapper pull-right">
							<ol class="breadcrumbs">
								<li>
									<a href="s_home.jsp">
										<i class="fa fa-home"></i>
									</a>
								</li>
								<li><span>Quiz Performance</span></li>
							</ol>					
							<a class="sidebar-right-toggle"><i class="fa fa-chevron-left"></i></a>
						</div>
					</header>					
					<%
						int count=0;
						String course=request.getParameter("course");
						String subject=request.getParameter("subject");
						String qr="select * from result where course=? and subject=?";
						PreparedStatement ps=con.prepareStatement(qr);
						ps.setString(1, course);
						ps.setString(2, subject);
						ResultSet rs=ps.executeQuery();
						while(rs.next())
						{
							count++;
						}
						String marks1="";
						String marks2="";
						String marks3="";
						String name1="Quiz 1";
						String name2="Quiz 2";
						String name3="Quiz 3";
						if(count==3)
						{
							if(name1.equals("Quiz 1"))
							{
							String q1="select * from result where course=? and subject=? and name=?";
							PreparedStatement p1=con.prepareStatement(q1);
							p1.setString(1, course);
							p1.setString(2, subject);
							p1.setString(3, name1);
							ResultSet rs1=ps.executeQuery();
							while(rs1.next())
							{
								String marks11=rs1.getString("marks");
								marks1=marks11;
							}
							
							%>
							<script>alert("marks1 <%=marks1%>");</script>
							<%}
							if(name2.equals("Quiz 2"))
							{
							String q2="select * from result where course=? and subject=? and name=?";
							PreparedStatement p2=con.prepareStatement(q2);
							p2.setString(1, course);
							p2.setString(2, subject);
							p2.setString(3, name2);
							ResultSet rs2=ps.executeQuery();
							while(rs2.next())
							{
								String marks22=rs2.getString("marks");
								marks2=marks22;
							}
							
							%>
							<script>alert("marks2 <%=marks2%>");</script>
							<%}
							if(name3.equals("Quiz 3"))
							{
							String q3="select * from result where course=? and subject=? and name=?";
							PreparedStatement p3=con.prepareStatement(q3);
							p3.setString(1, course);
							p3.setString(2, subject);
							p3.setString(3, name3);
							ResultSet rs3=ps.executeQuery();
							while(rs3.next())
							{
								String marks33=rs3.getString("marks");
								marks3=marks33;
							}
							
							%>
							<script>alert("marks3 <%=marks3%>");</script>
							<%
							}
						}
						else{
							%>
								<script>alert("First you have to complete all 3 Quiz according to your search!!");
									window.location.href="perform.jsp";</script>
							<%
						}
						%>
					<!-- start: page -->
						<h2 class="mt-none">Flot Charts</h2>
						<p class="mb-lg">Flot is a pure JavaScript plotting library for jQuery, with a focus on simple usage, attractive looks and interactive features.</p>
						
						<div class="row">
							<div class="col-md-6">
								<section class="panel">
									<header class="panel-heading">
										<div class="panel-actions">
											<a href="#" class="fa fa-caret-down"></a>
											<a href="#" class="fa fa-times"></a>
										</div>
						
										<h2 class="panel-title">Basic Chart</h2>
										<p class="panel-subtitle">You don't have to do much to get an attractive plot. Create a placeholder, make sure it has dimensions (so Flot knows at what size to draw the plot), then call the plot function with your data.</p>
									</header>
									<div class="panel-body">
						
										<!-- Flot: Basic -->
										<div class="chart chart-md" id="flotBasic"></div>
										<script type="text/javascript">
						
											var flotBasicData = [{
												data: [
													[0, 0],
													[1, <%=marks1%>],
													[2, <%=marks2%>],
													[3, <%=marks3%>]
												],
												label: "Series 1",
												color: "#0088cc"
											}];
						
											// See: assets/javascripts/ui-elements/examples.charts.js for more settings.
						
										</script>
						
									</div>
								</section>
							</div>
						</div>
						
		<!-- Vendor -->
		<!-- Vendor -->
		<script src="assets/vendor/jquery/jquery.js"></script>
		<script src="assets/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
		<script src="assets/vendor/bootstrap/js/bootstrap.js"></script>
		<script src="assets/vendor/nanoscroller/nanoscroller.js"></script>
		<script src="assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
		<script src="assets/vendor/magnific-popup/magnific-popup.js"></script>
		<script src="assets/vendor/jquery-placeholder/jquery.placeholder.js"></script>
		
		<!-- Specific Page Vendor -->
		<script src="assets/vendor/jquery-appear/jquery.appear.js"></script>
		<script src="assets/vendor/jquery-easypiechart/jquery.easypiechart.js"></script>
		<script src="assets/vendor/flot/jquery.flot.js"></script>
		<script src="assets/vendor/flot-tooltip/jquery.flot.tooltip.js"></script>
		<script src="assets/vendor/flot/jquery.flot.pie.js"></script>
		<script src="assets/vendor/flot/jquery.flot.categories.js"></script>
		<script src="assets/vendor/flot/jquery.flot.resize.js"></script>
		<script src="assets/vendor/jquery-sparkline/jquery.sparkline.js"></script>
		<script src="assets/vendor/raphael/raphael.js"></script>
		<script src="assets/vendor/morris/morris.js"></script>
		<script src="assets/vendor/gauge/gauge.js"></script>
		<script src="assets/vendor/snap-svg/snap.svg.js"></script>
		<script src="assets/vendor/liquid-meter/liquid.meter.js"></script>
		
		<!-- Theme Base, Components and Settings -->
		<script src="assets/javascripts/theme.js"></script>
		
		<!-- Theme Custom -->
		<script src="assets/javascripts/theme.custom.js"></script>
		
		<!-- Theme Initialization Files -->
		<script src="assets/javascripts/theme.init.js"></script>


		<!-- Examples -->
		<script src="assets/javascripts/ui-elements/examples.charts.js"></script>
	</body>
</html>