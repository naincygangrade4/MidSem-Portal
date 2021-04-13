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
					<div class="col-md-6">
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
							<form id="form" action="timetable1.jsp" class="form-horizontal">
								<section class="panel sdc">
									<header class="panel-heading">
										<h2 class="panel-title">Create Time Table</h2>
									</header>
									<div class="panel-body">
										
										<div class="form-group">
											<label class="col-sm-3 control-label">Select Branch</label>
											<div class="col-sm-9">
												<select id="company" name="branch" class="form-control" required>
													<option value="">Choose a branch</option>
													<option>CS</option>
													<option>CE</option>
													<option>ME</option>
													<option>EE</option>
												</select>
												<label class="error" for="company"></label>
											</div>
										</div>
										
										<div class="form-group">
											<label class="col-sm-3 control-label">Select Sem</label>
											<div class="col-sm-9">
												<select id="company" name="sem" class="form-control" required>
													<option value="">Choose a semester</option>
													<option>1st</option>
													<option>2nd</option>
													<option>3rd</option>
													<option>4th</option>
													<option>5th</option>
													<option>6th</option>
													<option>7th</option>
													<option>8th</option>
												</select>
												<label class="error" for="company"></label>
											</div>
										</div>
										
										<div class="form-group">
											<label class="col-sm-3 control-label">Date</label>
											<div class="col-sm-9">
												<input type="date" name="date1" class="form-control" placeholder="Duration" required>
												<label class="error" for="company"></label>
											</div>
										</div>
										
										<div class="form-group">
											<label class="col-sm-3 control-label">Subject 1</label>
											<div class="col-sm-9">
												<select id="company" name="subject1" class="form-control" required>
													<option value="">Choose a Subject</option>
													<option>Engineering Chemistry</option>
													<option>Mathematics - I</option>
													<option>English For Communication</option>
													<option>Basic Electrical & Electronics Engineering</option>
													<option>Engineering Graphics</option>
													<option>Engineering physics</option>
													<option>Mathematics - II</option>
													<option>Basic Mechanical Engineering</option>
													<option>Basic Civil Engineering & Mechanics</option>
													<option>Basic Computer Engineering</option>
													<option>Energy & Environmental</option>
													<option>Discrete Mathematics</option>
													<option>Data Structure</option>
													<option>Digital System</option>
													<option>OOPS</option>
													<option>Analysis Design of Algorithm</option>
													<option>Software Engineering</option>
													<option>Operating System</option>
													<option>Theory of Computation</option>
													<option>DBMS</option>
													<option>Data Analytics</option>
													<option>Pattern Recognition</option>
													<option>Internet and Web Technology</option>
													<option>Object Oriented Programming</option>
													<option>Introduction to Database Management System</option>
											        <option>Machine Learning</option>
											        <option>Computer Network</option>
											        <option>Advance Computer Architecture</option>
											        <option>Compiler Design</option>
											        <option>Knowledge Management</option>
											        <option>Project Management</option>
											        <option>Rural Technology & Community Development</option>
											        <option>Software Architecture</option>
											        <option>Computational Intelligence</option>
											        <option>Wireless & mobile Computing</option>
											        <option>Big Data</option>
											        <option>Cryptography & Information Security</option>
											        <option>Data Mining & Warehousing</option>
											        <option>Agile Software Development </option>
											        <option>Disaster Management</option>
			

												</select>
												<label class="error" for="company"></label>
											</div>
										</div>
										
										<div class="panel-body">
										
										<div class="form-group">
											<label class="col-sm-3 control-label">Date</label>
											<div class="col-sm-9">
												<input type="date" name="date2" class="form-control" placeholder="Duration" required>
												<label class="error" for="company"></label>
											</div>
										</div>
										
										<div class="form-group">
											<label class="col-sm-3 control-label">Subject 2</label>
											<div class="col-sm-9">
												<select id="company" name="subject2" class="form-control" required>
													<option value="">Choose a Subject</option>
													<option value="">Choose a Subject</option>
													<option>Engineering Chemistry</option>
													<option>Mathematics - I</option>
													<option>English For Communication</option>
													<option>Basic Electrical & Electronics Engineering</option>
													<option>Engineering Graphics</option>
													<option>Engineering physics</option>
													<option>Mathematics - II</option>
													<option>Basic Mechanical Engineering</option>
													<option>Basic Civil Engineering & Mechanics</option>
													<option>Basic Computer Engineering</option>
													<option>Energy & Environmental</option>
													<option>Discrete Mathematics</option>
													<option>Data Structure</option>
													<option>Digital System</option>
													<option>OOPS</option>
													<option>Analysis Design of Algorithm</option>
													<option>Software Engineering</option>
													<option>Operating System</option>
													<option>Theory of Computation</option>
													<option>DBMS</option>
													<option>Data Analytics</option>
													<option>Pattern Recognition</option>
													<option>Internet and Web Technology</option>
													<option>Object Oriented Programming</option>
													<option>Introduction to Database Management System</option>
											        <option>Machine Learning</option>
											        <option>Computer Network</option>
											        <option>Advance Computer Architecture</option>
											        <option>Compiler Design</option>
											        <option>Knowledge Management</option>
											        <option>Project Management</option>
											        <option>Rural Technology & Community Development</option>
											        <option>Software Architecture</option>
											        <option>Computational Intelligence</option>
											        <option>Wireless & mobile Computing</option>
											        <option>Big Data</option>
											        <option>Cryptography & Information Security</option>
											        <option>Data Mining & Warehousing</option>
											        <option>Agile Software Development </option>
											        <option>Disaster Management</option>
			
												</select>
												<label class="error" for="company"></label>
											</div>
										</div>
										
										<div class="panel-body">
										
										<div class="form-group">
											<label class="col-sm-3 control-label">Date</label>
											<div class="col-sm-9">
												<input type="date" name="date3" class="form-control" placeholder="Duration" required>
												<label class="error" for="company"></label>
											</div>
										</div>
										
										<div class="form-group">
											<label class="col-sm-3 control-label">Subject 3</label>
											<div class="col-sm-9">
												<select id="company" name="subject3" class="form-control" required>
													<option value="">Choose a Subject</option>
													<option>Engineering Chemistry</option>
													<option>Mathematics - I</option>
													<option>English For Communication</option>
													<option>Basic Electrical & Electronics Engineering</option>
													<option>Engineering Graphics</option>
													<option>Engineering physics</option>
													<option>Mathematics - II</option>
													<option>Basic Mechanical Engineering</option>
													<option>Basic Civil Engineering & Mechanics</option>
													<option>Basic Computer Engineering</option>
													<option>Energy & Environmental</option>
													<option>Discrete Mathematics</option>
													<option>Data Structure</option>
													<option>Digital System</option>
													<option>OOPS</option>
													<option>Analysis Design of Algorithm</option>
													<option>Software Engineering</option>
													<option>Operating System</option>
													<option>Theory of Computation</option>
													<option>DBMS</option>
													<option>Data Analytics</option>
													<option>Pattern Recognition</option>
													<option>Internet and Web Technology</option>
													<option>Object Oriented Programming</option>
													<option>Introduction to Database Management System</option>
											        <option>Machine Learning</option>
											        <option>Computer Network</option>
											        <option>Advance Computer Architecture</option>
											        <option>Compiler Design</option>
											        <option>Knowledge Management</option>
											        <option>Project Management</option>
											        <option>Rural Technology & Community Development</option>
											        <option>Software Architecture</option>
											        <option>Computational Intelligence</option>
											        <option>Wireless & mobile Computing</option>
											        <option>Big Data</option>
											        <option>Cryptography & Information Security</option>
											        <option>Data Mining & Warehousing</option>
											        <option>Agile Software Development </option>
											        <option>Disaster Management</option>
			
												</select>
												<label class="error" for="company"></label>
											</div>
										</div>
										
										<div class="panel-body">
										
										<div class="form-group">
											<label class="col-sm-3 control-label">Date</label>
											<div class="col-sm-9">
												<input type="date" name="date4" class="form-control" placeholder="Duration" required>
												<label class="error" for="company"></label>
											</div>
										</div>
										
										<div class="form-group">
											<label class="col-sm-3 control-label">Subject 4</label>
											<div class="col-sm-9">
												<select id="company" name="subject4" class="form-control" required>
													<option value="">Choose a Subject</option>
													<option value="">Choose a Subject</option>
													<option>Engineering Chemistry</option>
													<option>Mathematics - I</option>
													<option>English For Communication</option>
													<option>Basic Electrical & Electronics Engineering</option>
													<option>Engineering Graphics</option>
													<option>Engineering physics</option>
													<option>Mathematics - II</option>
													<option>Basic Mechanical Engineering</option>
													<option>Basic Civil Engineering & Mechanics</option>
													<option>Basic Computer Engineering</option>
													<option>Energy & Environmental</option>
													<option>Discrete Mathematics</option>
													<option>Data Structure</option>
													<option>Digital System</option>
													<option>OOPS</option>
													<option>Analysis Design of Algorithm</option>
													<option>Software Engineering</option>
													<option>Operating System</option>
													<option>Theory of Computation</option>
													<option>DBMS</option>
													<option>Data Analytics</option>
													<option>Pattern Recognition</option>
													<option>Internet and Web Technology</option>
													<option>Object Oriented Programming</option>
													<option>Introduction to Database Management System</option>
											        <option>Machine Learning</option>
											        <option>Computer Network</option>
											        <option>Advance Computer Architecture</option>
											        <option>Compiler Design</option>
											        <option>Knowledge Management</option>
											        <option>Project Management</option>
											        <option>Rural Technology & Community Development</option>
											        <option>Software Architecture</option>
											        <option>Computational Intelligence</option>
											        <option>Wireless & mobile Computing</option>
											        <option>Big Data</option>
											        <option>Cryptography & Information Security</option>
											        <option>Data Mining & Warehousing</option>
											        <option>Agile Software Development </option>
											        <option>Disaster Management</option>
															</select>
												<label class="error" for="company"></label>
											</div>
										</div>
										
										<div class="panel-body">
										
										<div class="form-group">
											<label class="col-sm-3 control-label">Date</label>
											<div class="col-sm-9">
												<input type="date" name="date5" class="form-control" placeholder="Duration" required>
												<label class="error" for="company"></label>
											</div>
										</div>
										
										<div class="form-group">
											<label class="col-sm-3 control-label">Subject 5</label>
											<div class="col-sm-9">
												<select id="company" name="subject5" class="form-control" required>
													<option value="">Choose a Subject</option>
													<option value="">Choose a Subject</option>
													<option>Engineering Chemistry</option>
													<option>Mathematics - I</option>
													<option>English For Communication</option>
													<option>Basic Electrical & Electronics Engineering</option>
													<option>Engineering Graphics</option>
													<option>Engineering physics</option>
													<option>Mathematics - II</option>
													<option>Basic Mechanical Engineering</option>
													<option>Basic Civil Engineering & Mechanics</option>
													<option>Basic Computer Engineering</option>
													<option>Energy & Environmental</option>
													<option>Discrete Mathematics</option>
													<option>Data Structure</option>
													<option>Digital System</option>
													<option>OOPS</option>
													<option>Analysis Design of Algorithm</option>
													<option>Software Engineering</option>
													<option>Operating System</option>
													<option>Theory of Computation</option>
													<option>DBMS</option>
													<option>Data Analytics</option>
													<option>Pattern Recognition</option>
													<option>Internet and Web Technology</option>
													<option>Object Oriented Programming</option>
													<option>Introduction to Database Management System</option>
											        <option>Machine Learning</option>
											        <option>Computer Network</option>
											        <option>Advance Computer Architecture</option>
											        <option>Compiler Design</option>
											        <option>Knowledge Management</option>
											        <option>Project Management</option>
											        <option>Rural Technology & Community Development</option>
											        <option>Software Architecture</option>
											        <option>Computational Intelligence</option>
											        <option>Wireless & mobile Computing</option>
											        <option>Big Data</option>
											        <option>Cryptography & Information Security</option>
											        <option>Data Mining & Warehousing</option>
											        <option>Agile Software Development </option>
											        <option>Disaster Management</option>
			
												</select>
												<label class="error" for="company"></label>
											</div>
										</div>
										
										
									</div>
									<footer class="panel-footer">
										<div class="row">
											<div class="col-sm-8 col-md-offset-4">
												<button class="btn btn-primary" style="width:70px;">Upload</button>
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