<%@ include file="../include/inc.jsp" %>
<%@ include file="../include/connex.jsp" %>
<%
String id = request.getParameter("d");
int num = Integer.parseInt(id);
stat = conn.createStatement();
stat.executeUpdate("DELETE FROM `banque` WHERE `banque`.`NumBanque` = '"+num+"'");
response.sendRedirect("../pages/listbanque2.jsp");
%>