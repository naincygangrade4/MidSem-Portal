<!DOCTYPE html>
<html class="fixed">
<%@include file="db.jsp" %>
	<head>
		<!-- Basic -->
		<meta charset="UTF-8">

		<title>Admin Home</title>
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
		<script type="text/javascript">
			history.pushState(null, null, location.href);
			window.onpopstate = function () {
			    history.go(1);
			};
		</script>	
	</head>
	<body>
		<section class="body">

			<!-- start: header -->
			<header class="header">
				<div class="logo-container">
					<a href="ahome.jsp" class="logo">
						<img src="assets/images/q1.jpg" height="35" alt="Quiz Portal" />
					</a>
					<div class="visible-xs toggle-sidebar-left" data-toggle-class="sidebar-left-opened" data-target="html" data-fire-event="sidebar-left-opened">
						<i class="fa fa-bars" aria-label="Toggle sidebar"></i>
					</div>
				</div>
			
				

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
										<a href="ahome.jsp">
											<i class="fa fa-home" aria-hidden="true"></i>
											<span>Teachers List</span>
										</a>
									</li>
									<li>
										<a href="timetable.jsp">
											<i class="fa fa-power-off" aria-hidden="true"></i>
											<span>Make a Time Table</span>
										</a>
									</li>
									<li>
										<a href="checktimetable.jsp">
											<i class="fa fa-power-off" aria-hidden="true"></i>
											<span>Check Time Table</span>
										</a>
									</li>
									<li>
										<a href="logout.jsp">
											<i class="fa fa-power-off" aria-hidden="true"></i>
											<span>Logout</span>
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
						<h2>Welcome Admin</h2>
						<div class="right-wrapper pull-right">
							<ol class="breadcrumbs">
								<li>
									<a href="ahome.jsp">
										<i class="fa fa-home"></i>
									</a>
								</li>
								<li><span>Admin Home</span></li>
							</ol>					
							<a class="sidebar-right-toggle"><i class="fa fa-chevron-left"></i></a>
						</div>
					</header>

					<!-- start: page -->
					<section class="panel">
							<header class="panel-heading">
								<h2 class="panel-title">Timetable</h2>
							</header>
							<div class="panel-body">
							<%
								String qr="select * from timetable";
								Statement st=con.createStatement();
								
								ResultSet rs=st.executeQuery(qr);
								if(rs.next())
								{
									%>
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
									<table class="table table-bordered table-striped mb-none swing-in-top-fwd" id="datatable-editable">
										<thead>
											<tr>
												<th>Branch</th>
												<th>Date & Subject</th>
												<th>Date & Subject</th>
												<th>Date & Subject</th>
												<th>Date & Subject</th>
												<th>Date & Subject</th>
												
											</tr>
										</thead>
									<%
										do{
											String branch=rs.getString("branch");
											String date1=rs.getString("date1");
											String subject1=rs.getString("subject1");
											String date2=rs.getString("date2");
											String subject2=rs.getString("subject2");
											String date3=rs.getString("date3");
											String subject3=rs.getString("subject3");
											String date4=rs.getString("date4");
											String subject4=rs.getString("subject4");
											String date5=rs.getString("date5");
											String subject5=rs.getString("subject");
											%>
											<tbody>
												<tr class="gradeX">
													<td><%=branch %></td>
													<td><%=date1 %> & <%=subject1 %></td>
													<td><%=date2 %> & <%=subject2 %></td>
													<td><%=date3 %> & <%=subject3 %></td>
													<td><%=date4 %> & <%=subject4 %></td>
													<td><%=date5 %> & <%=subject5 %></td>
													
													<td class="actions">
														<a href="timedelete.jsp?subject1=<%=subject1 %> class="on-editing cancel-row"><i class="fa fa-times"></i></a>
														
													</td>
												</tr>
											</tbody>
											<%
										}while(rs.next());
									%>
									</table>
									<%
								}
								else{
									%>
									<style>
										.tsdc {
											animation: shake-horizontal 0.8s cubic-bezier(0.455, 0.030, 0.515, 0.955) both;
										}
										@keyframes shake-horizontal {
										  0%,
										  100% {
										    transform: translateX(0);
										  }
										  10%,
										  30%,
										  50%,
										  70% {
										    transform: translateX(-10px);
										  }
										  20%,
										  40%,
										  60% {
										    transform: translateX(10px);
										  }
										  80% {
										    transform: translateX(8px);
										  }
										  90% {
										    transform: translateX(-8px);
										  }
										}
									</style>
									<tr class="gradeX">
										<td><h4 class="tsdc">No Record Found</h4></td>
									</tr>
									<%	
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