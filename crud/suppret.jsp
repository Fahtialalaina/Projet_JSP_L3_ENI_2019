<%@ include file="../include/inc.jsp" %>
<%@ include file="../include/connex.jsp" %>
<%
String id = request.getParameter("d");
int num = Integer.parseInt(id);
stat = conn.createStatement();
stat.executeUpdate("DELETE FROM pret WHERE idPret='"+num+"'");
response.sendRedirect("../pages/listepret2.jsp");
%>