

<!DOCTYPE html>
<html class="fixed">
<%@include file="db.jsp" %>

	<%
		String course=request.getParameter("course");
		String subject=request.getParameter("subject");
		String name=request.getParameter("name");
		String email=(String) session.getAttribute("email");
		String q="select * from result where email=? and course=? and subject=? and name=?";
		PreparedStatement p=con.prepareStatement(q);
		p.setString(1, email);
		p.setString(2, course);
		p.setString(3, subject);
		p.setString(4, name);
		ResultSet r=p.executeQuery();
		if(r.next())
		{
			%>
			<script>alert("you have already given this quiz");
			window.location.href="s_home.jsp";</script>
			<%
		}
		else{
		session.setAttribute("course", course);
		session.setAttribute("subject", subject);
		session.setAttribute("name", name);
		String qr="select * from quiz where course=? and subject=? and name=?";
		PreparedStatement ps=con.prepareStatement(qr);
		ps.setString(1, course);
		ps.setString(2, subject);
		ps.setString(3, name);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			String duration=rs.getString("duration");
		
			%>
				
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
		<link rel="stylesheet" href="assets/vendor/jquery-ui/css/ui-lightness/jquery-ui-1.10.4.custom.css" />
		<link rel="stylesheet" href="assets/vendor/bootstrap-multiselect/bootstrap-multiselect.css" />
		<link rel="stylesheet" href="assets/vendor/morris/morris.css" />

		<!-- Theme CSS -->
		<link rel="stylesheet" href="assets/stylesheets/theme.css" />

		<!-- Skin CSS -->
		<link rel="stylesheet" href="assets/stylesheets/skins/default.css" />

		<!-- Theme Custom CSS -->
		<link rel="stylesheet" href="assets/stylesheets/theme-custom.css">

		<!-- Head Libs -->
		<script src="assets/vendor/modernizr/modernizr.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.3/jquery.min.js"></script>
		<script type="text/javascript">
		jQuery(document).ready(function($) {

			if (window.history && window.history.pushState) {

			window.history.pushState('forward', null);

			$(window).on('popstate', function() {
			window.location.href = "s_home.jsp";
			});

			}
			});
		</script>
	</head>
	<body>
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
									<li class="nav-active">
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
									<li>
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
								<li><span>Quiz Section</span></li>
							</ol>					
							<a class="sidebar-right-toggle"><i class="fa fa-chevron-left"></i></a>
						</div>
					</header>

					<!-- start: page -->
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
									<div class="alert alert-info fade in nomargin col-md-6 sdc">
										<h4>Instructions!</h4>
										<ul>
											  <li>Total number of questions : 15</li>
											  <li>Time alloted : <%=duration %> minutes.</li>
											  <li>Each question carry 1 mark, no negative marks.</li>
											  <li>DO NOT refresh the page.</li>
											  <li>All the best :-).</li>
										</ul>
										<p>
											<a href="startquiz.jsp"><button class="btn btn-info mt-xs mb-xs col-md-offset-4" type="button">Start Quiz..</button></a>
										</p>
									</div>		
			<%
		}
		}
	%>	
		<!-- Vendor -->
		<script src="assets/vendor/jquery/jquery.js"></script>
		<script src="assets/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
		<script src="assets/vendor/bootstrap/js/bootstrap.js"></script>
		<script src="assets/vendor/nanoscroller/nanoscroller.js"></script>
		<script src="assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
		<script src="assets/vendor/magnific-popup/magnific-popup.js"></script>
		<script src="assets/vendor/jquery-placeholder/jquery.placeholder.js"></script>
		
		<!-- Specific Page Vendor -->
		<script src="assets/vendor/jquery-ui/js/jquery-ui-1.10.4.custom.js"></script>
		<script src="assets/vendor/jquery-ui-touch-punch/jquery.ui.touch-punch.js"></script>
		<script src="assets/vendor/jquery-appear/jquery.appear.js"></script>
		<script src="assets/vendor/bootstrap-multiselect/bootstrap-multiselect.js"></script>
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
		<script src="assets/vendor/jqvmap/jquery.vmap.js"></script>
		<script src="assets/vendor/jqvmap/data/jquery.vmap.sampledata.js"></script>
		<script src="assets/vendor/jqvmap/maps/jquery.vmap.world.js"></script>
		<script src="assets/vendor/jqvmap/maps/continents/jquery.vmap.africa.js"></script>
		<script src="assets/vendor/jqvmap/maps/continents/jquery.vmap.asia.js"></script>
		<script src="assets/vendor/jqvmap/maps/continents/jquery.vmap.australia.js"></script>
		<script src="assets/vendor/jqvmap/maps/continents/jquery.vmap.europe.js"></script>
		<script src="assets/vendor/jqvmap/maps/continents/jquery.vmap.north-america.js"></script>
		<script src="assets/vendor/jqvmap/maps/continents/jquery.vmap.south-america.js"></script>
		
		<!-- Theme Base, Components and Settings -->
		<script src="assets/javascripts/theme.js"></script>
		
		<!-- Theme Custom -->
		<script src="assets/javascripts/theme.custom.js"></script>
		
		<!-- Theme Initialization Files -->
		<script src="assets/javascripts/theme.init.js"></script>


		<!-- Examples -->
		<script src="assets/javascripts/dashboard/examples.dashboard.js"></script>
	</body>
</html>