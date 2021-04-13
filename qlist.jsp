<!DOCTYPE html>
<html class="fixed">
<%@include file="db.jsp" %>
	<head>
		<!-- Basic -->
		<meta charset="UTF-8">

		<title>Add Quiz</title>
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

	</head>
	<body>
	<%String email=(String) session.getAttribute("email"); %>
		<section class="body">

			<!-- start: header -->
			<header class="header">
				<div class="logo-container">
					<a href="t_home.jsp" class="logo">
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
								<% String tname12=(String) session.getAttribute("tname");%>
								<span class="name" style="text-transform: capitalize;"><%=tname12 %></span>
								<span class="role">Teacher</span>
							</div>
			
							<i class="fa custom-caret"></i>
						</a>
			
						<div class="dropdown-menu">
							<ul class="list-unstyled">
								<li class="divider"></li>
								<li>
									<a role="menuitem" tabindex="-1" href="tdetail.jsp"><i class="fa fa-user"></i> My Profile</a>
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
										<a href="t_home.jsp">
											<i class="fa fa-home" aria-hidden="true"></i>
											<span>Student's List</span>
										</a>
									</li>
									<li class="nav-parent nav-expanded nav-active">
										<a>
											<i class="fa fa-list-alt" aria-hidden="true"></i>
											<span>Manage Quiz</span>
										</a>
										<ul class="nav nav-children">
											<li>
												<a href="addquiz.jsp">
													 Add Quiz
												</a>
											</li>
											<li class="nav-active">
												<a href="qlist.jsp">
													 List Of All Quiz
												</a>
											</li>
											<li>
												<a href="addques.jsp">
													 Add Questions
												</a>
											</li>
											<li>
												<a href="queslist.jsp">
													 List Of Questions
												</a>
											</li>
										</ul>
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
									<a href="t_home.jsp">
										<i class="fa fa-home"></i>
									</a>
								</li>
								<li><span>Quiz List</span></li>
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
					<section class="panel sdc">
							<header class="panel-heading">
								<h2 class="panel-title">List Of Quiz</h2>
							</header>
							<div class="panel-body">
							<%
							String qr="select * from quiz";
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
												<th>Quiz ID</th>
												<th>Teacher Name</th>
												<th>Course</th>
												<th>Subject</th>
												<th>Quiz Name</th>
												<th>Duration</th>
												<th>Passmark</th>
												<th>Status</th>
												<th>Action</th>
											</tr>
										</thead>
									<%
										do{
											int id=rs.getInt(1);
											String tname=rs.getString(2);
											String course=rs.getString(3);
											String subject=rs.getString(4);
											String name=rs.getString(5);
											String duration=rs.getString(6);
											String passmark=rs.getString(7);
											String status=rs.getString(8);
											%>
											<tbody>
												<tr class="gradeX">
													<td><%=id %></td>
													<td><%=tname %></td>
													<td><%=course %></td>
													<td><%=subject %></td>
													<td><%=name %></td>
													<td><%=duration %></td>
													<td><%=passmark %></td>
													<%
													if(status.equals("inactive"))
													{
													%><td style="color: red;text-transform: uppercase;"><span class="fa fa-times-circle" style="color:red;"></span><span style="margin:0px 1px;"></span><%=status %></td>
														 <td>	
															<div class="col-md-9">
																<div class="btn-group">
																	<button type="button" class=" btn btn-default dropdown-toggle" data-toggle="dropdown"><span class="fa fa-gear" style="font-size: 18px;"></span> <span class="caret"></span></button>
																	<ul class="dropdown-menu" role="menu">
																		<li><a href="active.jsp?id=<%=id%>&status=active">Make Active</a></li>
																		<li><a href="aques.jsp?course=<%=course%>&subject=<%=subject%>&name=<%=name%>">Add Questions</a></li>
																		<li><a href="qedit.jsp?id=<%=id%>&course=<%=course%>&subject=<%=subject%>&name=<%=name%>&duration=<%=duration%>&passmark=<%=passmark%>">Edit Quiz</a></li>
																		<li><a href="qremove.jsp?id=<%=id%>">Remove Quiz</a></li>
																	</ul>
																</div>
															</div>
														</td>		
													<%
													}
													else{
														%><td style="color: blue;text-transform: uppercase;"><span class="fa fa-check-circle" style="color:blue;"></span><span style="margin:0px 1px;"></span><%=status %></td>
														  <td>	
															<div class="col-md-9">
																<div class="btn-group">
																	<button type="button" class=" btn btn-default dropdown-toggle" data-toggle="dropdown"><span class="fa fa-gear" style="font-size: 18px;"></span> <span class="caret"></span></button>
																	<ul class="dropdown-menu" role="menu">
																		<li><a href="inactive.jsp?id=<%=id%>&status=inactive">Make Inactive</a></li>
																		<li><a href="aques.jsp?course=<%=course%>&subject=<%=subject%>&name=<%=name%>">Add Questions</a></li>
																		<li><a href="qedit.jsp?id=<%=id%>&course=<%=course%>&subject=<%=subject%>&name=<%=name%>&duration=<%=duration%>&passmark=<%=passmark%>">Edit Quiz</a></li>
																		<li><a href="qremove.jsp?id=<%=id%>">Remove Quiz</a></li>
																	</ul>
																</div>
															</div>
														</td>
														<%
													}
													%>
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
									<td>No Quiz Found</td>
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