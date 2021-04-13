<!DOCTYPE html>
<html class="fixed">
<%@include file="db.jsp" %>
	<head>
		<!-- Basic -->
		<meta charset="UTF-8">

		<title>Question List</title>
		<meta name="keywords" content="HTML5 Admin Template" />
		<meta name="description" content="JSOFT Admin - Responsive HTML5 Template">
		<meta name="author" content="JSOFT.net">

		<!-- Mobile Metas -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

		<!-- Web Fonts  -->
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
		<script>  
			var request;  
			function searchInfo()  
			{  
			var course=document.vinform.course.value;
			var subject=document.vinform.subject.value;
			var name=document.vinform.name.value;
			var url="check.jsp?course="+course+"&subject="+subject+"&name="+name+"";
				  
			if(window.XMLHttpRequest){  
			request=new XMLHttpRequest();  
			}  
			else if(window.ActiveXObject){  
			request=new ActiveXObject("Microsoft.XMLHTTP");  
			}  
			  
			try{  
			request.onreadystatechange=getInfo;  
			request.open("GET",url,true);  
			request.send();  
			}catch(e){alert("Unable to connect to server");}  
			}  
			  
			function getInfo(){  
			if(request.readyState==4){  
				var val1=request.responseText; 
				if(val1.match('no ques found'))
					{
					alert("no questions found according to your search");
					}  
			document.getElementById('mylocation').innerHTML=val1;  
			}  
			}  
		</script>
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
											<li>
												<a href="qlist.jsp">
													 List Of All Quiz
												</a>
											</li>
											<li>
												<a href="addques.jsp">
													 Add Questions
												</a>
											</li>
											<li class="nav-active">
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
								<li><span>Question List</span></li>
							</ol>					
							<a class="sidebar-right-toggle"><i class="fa fa-chevron-left"></i></a>
						</div>
					</header>

					<!-- start: page -->

					<section class="panel">
							<header class="panel-heading">
								<h2 class="panel-title">List Of Questions</h2>
							</header>
							<div class="panel-body">
							<div class="col-sm-8">
							<form id="form" name="vinform" class="form-horizontal">
								<section class="panel">
									<div class="panel-body">
										<div class="form-group">
											<label class="col-sm-3 control-label">Course</label>
											<div class="col-sm-9">
												<select id="company" name="course" class="form-control" required>
													<option value="">Choose a Course</option>
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
													<option value="">Choose a Subject</option>
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
												<select id="company" onchange="searchInfo()" name="name" class="form-control" required>
													<option value="">Choose a Quiz</option>
													<option>Quiz 1</option>
													<option>Quiz 2</option>
													<option>Quiz 3</option>
												</select>
												<label class="error" for="company"></label>
											</div>
										</div>
									</div>
								</section>
							</form>
						</div>						
						
						<span id="mylocation"></span>
							</div>
						</section>
						
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