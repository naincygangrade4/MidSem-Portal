	<%
		String bid=request.getParameter("id");
		int id=Integer.parseInt(bid);
		//String tname=(String) session.getAttribute("tname");
		String name=request.getParameter("name");
		String course=request.getParameter("course");
		String subject=request.getParameter("subject");
		String duration=request.getParameter("duration");
		String passmark=request.getParameter("passmark");
	%>
<!DOCTYPE html>
<html class="fixed">
<%@include file="db.jsp" %>
	<head>
		<!-- Basic -->
		<meta charset="UTF-8">

		<title>Edit Quiz</title>
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
							<% String tname1=(String) session.getAttribute("tname");%>
								<span class="name" style="text-transform: capitalize;"><%=tname1 %></span>
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
								<li><span>Edit Quiz</span></li>
							</ol>					
							<a class="sidebar-right-toggle"><i class="fa fa-chevron-left"></i></a>
						</div>
					</header>

					<!-- start: page -->
					<div class="col-md-6">
							<form id="form" action="qedit1.jsp" class="form-horizontal">
							<input type="hidden" value="<%=id%>" name="id">
								<section class="panel">
									<header class="panel-heading">
										<h2 class="panel-title">Edit for <%=name %> of <%=subject %></h2>
									</header>
									<div class="panel-body">
										
										<div class="form-group">
											<label class="col-sm-3 control-label">Course</label>
											<div class="col-sm-9">
												<select id="company" name="course" class="form-control" required>
													<option selected><%=course %></option>
													<option>Engineering</option>
													<option>MCA</option>
													<option>BSc</option>
													<option>BCA</option>
													<option>ME</option>
													<option>MBA</option>
													<option>Integrated Maths</option>
												</select>
												<label class="error" for="company"></label>
											</div>
										</div>
										
										<div class="form-group">
											<label class="col-sm-3 control-label">Subject</label>
											<div class="col-sm-9">
												<select id="company" name="subject" class="form-control" required>
													<option selected><%=subject %></option>
													<option>Compiler</option>
													<option>Automata</option>
													<option>Data Structures</option>
													<option>DBMS</option>
													<option>Operating System</option>
													<option>Computer Networking</option>
													<option>Principle Of Management</option>
													<option>Entrepreneurship</option>
													<option>C</option>
													<option>C++</option>
													<option>Java</option>
													<option>Web Programming</option>
													<option>AI</option>
													<option>Python</option>
													<option>NSM</option>
												</select>
												<label class="error" for="company"></label>
											</div>
										</div>
										
										<div class="form-group">
											<label class="col-sm-3 control-label">Quiz No.</label>
											<div class="col-sm-9">
												<select id="company" name="name" class="form-control" required>
													<option selected><%=name %></option>
													<option>Quiz 1</option>
													<option>Quiz 2</option>
													<option>Quiz 3</option>
												</select>
												<label class="error" for="company"></label>
											</div>
										</div>
										
										<div class="form-group">
											<label class="col-sm-3 control-label">Duration (Minutes): <span class="required">*</span></label>
											<div class="col-sm-9">
												<input type="text" name="duration" value=<%=duration %> class="form-control" required/>
											</div>
										</div>
										
										<div class="form-group">
											<label class="col-sm-3 control-label">Passmark<span class="required">*</span></label>
											<div class="col-sm-9">
												<input type="text" name="passmark" value="<%=passmark %>" class="form-control" required/>
											</div>
										</div>
									</div>
									<footer class="panel-footer">
										<div class="row">
											<div class="col-sm-9 col-sm-offset-3">
												<button class="btn btn-primary">Edit</button>
											</div>
										</div>
									</footer>
								</section>
							</form>
						</div>
					
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