<%@page import="com.classes.DbConnector"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.classes.MD5"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<% 

String firstname = request.getParameter("firstname");
String lastname = request.getParameter("lastname");
String username = request.getParameter("username");
String password = MD5.getMd5(request.getParameter("password")); //encrypt password


//Connect Application to the Database
String query = "INSERT INTO user(firstname, lastname, username, password) VALUES (?, ?, ?, ?)";
PreparedStatement pstmt = DbConnector.getConnection().prepareStatement(query);
pstmt.setString(1, firstname);
pstmt.setString(2, lastname);
pstmt.setString(3, username);
pstmt.setString(4, password);

if(pstmt.executeUpdate() > 0){
	out.println("Successfully Saved");
}else{
	out.println("Error occurred");
}

%>

</body>
</html>