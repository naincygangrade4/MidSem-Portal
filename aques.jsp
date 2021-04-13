<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body align="center">
	<br><br>
	<%
	String course=request.getParameter("course");
	String subject=request.getParameter("subject");
	String name=request.getParameter("name");
	%>
	<form action="addques1.jsp">
		<input type="hidden" name="course" value="<%=course%>">
		<input type="hidden" name="subject" value="<%=subject%>">
		<input type="hidden" name="name" value="<%=name%>">
		<textarea name="question" placeholder="Enter Question" required style="margin:0px;width:218px;height:68px;"></textarea><br><br>
		Option A:
		<input type="text" name="opta" required><br><br>
		Option B:
		<input type="text" name="optb" required><br><br>
		Option C:
		<input type="text" name="optc" required><br><br>
		Option D:
		<input type="text" name="optd" required><br><br>
		Correct Answer:
		<input type="text" name="ca" required><br><br>
		<input type="submit" value="Add Question">
	</form>
</body>
</html>