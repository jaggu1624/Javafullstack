<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%
String userid = request.getParameter("uname");    
String pwd = request.getParameter("pass");
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test",
"root", "root");
Statement st = con.createStatement();
ResultSet rs;
rs = st.executeQuery("select * from members where uname='" + userid + "' and pass='" + pwd + "'");
if (rs.next()) {
session.setAttribute("userid", userid);
out.println("welcome " + userid);
out.println("<a href='logout.jsp'>Log out</a>");
response.sendRedirect("success.jsp");
} else {
out.println("Invalid password / username <a href='index.jsp'>try again</a>");
}
%>


</body>
</html>