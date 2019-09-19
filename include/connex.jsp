<%
String host = "jdbc:mysql://localhost:3306/gpb";
Connection conn = null;
Connection conn2 = null;
Connection conn3 = null;
Connection conn5 = null;
Connection conn7 = null;
Connection conn7777 = null;
Connection conn15 = null;
Connection conn16 = null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
conn = DriverManager.getConnection(host, "root", "");
conn2 = DriverManager.getConnection(host, "root", "");
conn3 = DriverManager.getConnection(host, "root", "");
conn5 = DriverManager.getConnection(host, "root", "");
conn7 = DriverManager.getConnection(host, "root", "");
conn15 = DriverManager.getConnection(host, "root", "");
conn16 = DriverManager.getConnection(host, "root", "");
%>