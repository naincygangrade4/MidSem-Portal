<!DOCTYPE html>
<html class="fixed">
<%@include file="db.jsp" %>

<%
	    String course=(String)session.getAttribute("course");
		String subject=(String)session.getAttribute("subject");
		String name=(String)session.getAttribute("name");
		String duration="";
		out.print(course+" "+subject+" "+name);
    	String q="select duration from quiz where course=? and subject=? and name=?";
    	PreparedStatement p=con.prepareStatement(q);
    	p.setString(1, course);
    	p.setString(2, subject);
    	p.setString(3, name);
    	ResultSet r=p.executeQuery();
    	if(r.next())
    	{
    		String duration1=r.getString("duration");
    		duration=duration1;
    	}
    %>
				
	<head>
		<!-- Basic -->
		<meta charset="UTF-8">

		<title>Quiz Section</title>
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
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
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
<script type="text/javascript">
//10 minutes from now
function countdown(){
	function countdown( elementName, minutes, seconds )
	{
	    var element, endTime, hours, mins, msLeft, time;

	    function twoDigits( n )
	    {
	        return (n <= 9 ? "0" + n : n);
	    }

	    function updateTimer()
	    {
	        msLeft = endTime - (+new Date);
	        if ( msLeft < 0 ) {
	            alert("Time is Up!");
	            document.getElementById("myForm").submit();
	        } else {
	            time = new Date( msLeft );
	            hours = time.getUTCHours();
	            mins = time.getUTCMinutes();
	            element.innerHTML ='Time Left: '+ (hours ? hours + ':' + twoDigits( mins ) : mins) + ':' + twoDigits( time.getUTCSeconds() );
	            setTimeout( updateTimer, time.getUTCMilliseconds() + 500 );
	        }
	    }

	    element = document.getElementById( elementName );
	    endTime = (+new Date) + 1000 * (60*minutes + seconds) + 500;
	    updateTimer();
	}

	countdown( "countdown", <%=duration%>, 0 );
	countdown( "countdown2", 100, 0 );
}

</script>
		<script>	
		function clicked() {
		    return confirm('Are you sure you want to submit Quiz now?');
		}
		</script>
	<script>
	var state = history.state || {};
	var reloadCount = state.reloadCount || 0;
	if (performance.navigation.type === 1) { // Reload
	    state.reloadCount = ++reloadCount;
	    history.replaceState(state, null, document.URL);
	} else if (reloadCount) {
	    delete state.reloadCount;
	    reloadCount = 0;
	    history.replaceState(state, null, document.URL);
	}
	if (reloadCount >= 1) {
	    window.location.href="s_home.jsp";
	}
	</script>
	</head>
	<body onload="countdown()">
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
					 <h2 id="countdown"></h2>
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
						<%
		int count=0;
		String qr="select * from question where course=? and subject=? and name=? order by rand() limit 4";
		PreparedStatement ps=con.prepareStatement(qr);
		ps.setString(1, course);
		ps.setString(2, subject);
		ps.setString(3, name);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{	
			%>
				<form action="startquiz1.jsp" id="myForm">
			<%
			do{
				count++;
				String question=rs.getString(5);
				String opta=rs.getString(6);
				String optb=rs.getString(7);
				String optc=rs.getString(8);
				String optd=rs.getString(9);
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
				<div class="row">
					<div class="col-md-12">
						<section class="panel panel-featured swing-in-top-fwd">
							<header class="panel-heading">
								<h2 class="panel-title">Q<%=count %>: <%=question %></h2>
							</header>
							<input type="hidden" name="question<%=count %>" value="<%=question%>">
							<div class="panel-body">
								<blockquote class="primary rounded b-thin">
									<div class="radio-custom radio-primary">
										<input type="radio" value="<%=opta%>" name="opt<%=count %>" class="opt-list">
										<label><h4><%=opta %></h4></label>
									</div>
									<div class="radio-custom radio-primary">
										<input type="radio" value="<%=optb%>" name="opt<%=count %>" class="opt-list">
										<label><h4><%=optb %></h4></label>
									</div>
									<div class="radio-custom radio-primary">
										<input type="radio" value="<%=optc %>" name="opt<%=count %>" class="opt-list">
										<label><h4><%=optc %></h4></label>
									</div>
									<div class="radio-custom radio-primary">
										<input type="radio" value="<%=optd %>" name="opt<%=count %>" class="opt-list">
										<label><h4><%=optd %></h4></label>
									</div>
									</blockquote>
									 <script type="text/javascript">
     //Near checkboxes
    $('.opt-list').click(function() {
        $(this).siblings('input:radio').prop('checked', false);
    });
  </script>
							</div>
						</section>
					</div>
				</div>
				<input type="radio" value="none" name="opt" class="opt-list" checked style="visibility: hidden;">
				<%
			}while(rs.next());
			%>
			<input type="hidden" name="count" value="<%=count%>">
			<button type="submit" class="btn btn-lg btn-primary col-md-1 col-md-offset-5">Submit</button>
			</form>
			<%
		}
		else{
			%>
			<script>alert("problem please start again");
			window.location.href="s_home.jsp";</script>
			<%
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