<%@ include file="../include/inc.jsp" %>
<%@ include file="../include/connex.jsp" %>
<%
String id = request.getParameter("d");
int num = Integer.parseInt(id);

stat = conn.createStatement();
String tmpmontant = "";
String tmpcb = "";
String data = "SELECT * FROM retrait WHERE idr='"+num+"'";
res = stat.executeQuery(data);
while(res.next()){
    tmpmontant = res.getString("montant");
    tmpcb = res.getString("cb");
}

String data2 = "UPDATE client SET solde = solde + ? WHERE cb = '"+tmpcb+"'";
stmt = conn.prepareStatement(data2);
stmt.setString(1,tmpmontant);
stmt.executeUpdate();

stat = conn.createStatement();
stat.executeUpdate("DELETE FROM retrait WHERE idr='"+num+"'");
response.sendRedirect("../pages/retrait.jsp");
%>