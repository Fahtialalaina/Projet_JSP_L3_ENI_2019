<%
String host = "jdbc:mysql://localhost:3306/gpb";
Connection conn = null;
Connection conn2 = null;
Connection conn3 = null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
conn = DriverManager.getConnection(host, "root", "");
conn2 = DriverManager.getConnection(host, "root", "");
conn3 = DriverManager.getConnection(host, "root", "");
%>