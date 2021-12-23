<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%! Connection con=null; %>
<%! Statement st= null; %>
<%! ResultSet rs= null; %>


<html>
<head><title>auth</title></head>
<body>

<%
try {
Class.forName("com.mysql.jdbc.Driver").newInstance();
}catch(ClassNotFoundException ce){out.println(ce);}

try{
con = DriverManager.getConnection("jdbc:mysql://localhost/pj","root", "");
st = con.createStatement();

String user1=request.getParameter("usr");
String pass1=request.getParameter("psw");
//out.println(user1 + " " +pass1+"<br>");

rs = st.executeQuery("SELECT pass FROM test where name='"+user1+"'");
if(!rs.isBeforeFirst()){out.println("Invalid user");}
else{
while(rs.next()) {
out.println("<form id =\"form\" action=\"updat1.jsp\"><input type=\"hidden\" name=\"id\" id=\"re\" value=\""+user1+"\"><button >EDIT</button></form>");
out.println("<form id =\"form\" action=\"delete.jsp\"><input type=\"hidden\" name=\"id\" id=\"re\" value=\""+user1+"\"><button >DELETE</button></form>");
String name = rs.getString(1);

if(pass1.equals(name))
{
out.println("login successful");
}else{
out.println("login Failed");
}
}}
rs.close();
st.close();
con.close();

}catch(SQLException e){
out.println("<!--");
StringWriter sw = new StringWriter();
PrintWriter pw = new PrintWriter(sw);
e.printStackTrace(pw);
out.print(sw);
sw.close();
pw.close();
out.println("-->");
out.println("ERROR:"+e);

}

%>
<br>
<br>
<%= "welcome to jsp" %>  

	<a href="LOGREG.html">
		BACK TO HOME
	</a>
</body>
</html> 