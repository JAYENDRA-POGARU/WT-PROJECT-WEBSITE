<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String uname = request.getParameter("id");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "pj";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
	out.println("ERRor:"+e);
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from test where name="+uname;
resultSet = statement.executeQuery("select * from test where name='"+uname+"'");
while(resultSet.next()){
	out.println("<form id =\"form\" action=\"updat2.jsp\"><input type=\"hidden\" name=\"id\" id=\"re\" value=\""+uname+"\">USERname:<input type=\"text\" name=\"una\"><br>password:<input type=\"text\" name=\"pass\"><br><br><br><input type=\"submit\" value=\"submit\"></form>");
%>
<!DOCTYPE html>
<html>
<body>
<h1>Update data from database in jsp</h1>

<%
}
connection.close();
} catch (Exception e) {
	out.println("ERRor:"+e);
e.printStackTrace();
}
%>
</body>
</html>