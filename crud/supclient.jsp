<%@ include file="../include/inc.jsp" %>
<%@ include file="../include/connex.jsp" %>
<%
String id = request.getParameter("d");
int num = Integer.parseInt(id);
stat = conn.createStatement();
stat.executeUpdate("DELETE FROM client_table WHERE idc='"+num+"'");
response.sendRedirect("../pages/listeclient.jsp");
%>