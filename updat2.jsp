<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/pj";%>
<%!String user = "root";%>
<%!String psw = "";%>
<%
String id=request.getParameter("id");
String uname=request.getParameter("una");
String pass=request.getParameter("pass");
if(id != null)
{
Connection con = null;
PreparedStatement ps = null;

try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);

ps = con.prepareStatement("Update test set name=?,pass=? where name=?");
ps.setString(1,uname);
ps.setString(2,pass);
ps.setString(3,id);
int i = ps.executeUpdate();
if(i > 0)
{
out.print("Record Updated Successfully");
}
else
{
out.print("There is a problem in updating Record.");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>