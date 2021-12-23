<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%! Connection con=null; %>
<%! Statement st= null; %>
<%! ResultSet rs= null; %>
<html>
<%
String name1=request.getParameter("username");
String age1=request.getParameter("password");
try {
Class.forName("com.mysql.jdbc.Driver").newInstance();
}catch(ClassNotFoundException ce){out.println(ce);}

try{
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pj","root", "");
           Statement st=con.createStatement();
           int i=st.executeUpdate("insert into test(name,pass) values('"+name1+"','"+age1+"')");
           out.println("User created successfully");
}catch(SQLException e){out.println("ERRor:"+e);}

%>
<br>
<br>
    <a href="LOGREG.html">
        BACK TO HOME
    </a>
</html>