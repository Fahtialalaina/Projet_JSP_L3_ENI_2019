<%@ include file="../include/inc.jsp" %>
<%@ include file="../include/connex.jsp" %>
<%
String id = request.getParameter("d");
int num = Integer.parseInt(id);

stat = conn.createStatement();
String tmpmontant = "";
String tmpcbe = "";
String tmpcbr = "";
String data = "SELECT * FROM virement WHERE idvi='"+num+"'";
res = stat.executeQuery(data);
while(res.next()){
    tmpmontant = res.getString("montant");
    tmpcbe = res.getString("cbe");
    tmpcbr = res.getString("cbr");
}

stmt = conn.prepareStatement("UPDATE client SET solde = solde + ? WHERE cb = '"+tmpcbe+"'");
stmt.setString(1,tmpmontant);
stmt.executeUpdate();

stmt = conn.prepareStatement("UPDATE client SET solde = solde - ? WHERE cb = '"+tmpcbr+"'");
stmt.setString(1,tmpmontant);
stmt.executeUpdate();

stat = conn.createStatement();
stat.executeUpdate("DELETE FROM virement WHERE idvi='"+num+"'");
response.sendRedirect("../pages/virement.jsp");
%>