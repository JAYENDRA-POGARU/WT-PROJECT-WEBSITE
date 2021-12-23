<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%! Connection con=null; %>
<%! Statement st= null; %>
<%! ResultSet rs= null; %>
<html>
<%
String name1=request.getParameter("id");
try {
Class.forName("com.mysql.jdbc.Driver").newInstance();
}catch(ClassNotFoundException ce){out.println(ce);}

try{
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pj","root", "");
           Statement st=con.createStatement();
           int i=st.executeUpdate("delete from test where name='"+name1+"'");
           out.println("User deleted successfully");
}catch(SQLException e){out.println("ERRor:"+e);}

%>