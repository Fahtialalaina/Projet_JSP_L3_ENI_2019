<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.io.IOException" %>
<%@ include file="../include/inc.jsp" %>
<jsp:include page="../include/header.jsp" />
<title>Liste de Clients | Gestion Bancaire</title>
<jsp:include page="../include/menu.jsp" />
<%@ include file="../include/connex.jsp" %>

<div class="right_col" role="main">
<div class="">
<div class="page-title">
<div class="title_left">
<h3>Liste de Clients | <small>Gestion Bancaire</small></h3>
</div>
</div>

<!-- page content -->

<div class="clearfix"></div>

<div class="row">
<div class="col-md-12 col-sm-12 col-xs-12">
<div class="x_panel">
<div class="x_title">
<h2>Nouveau Client</h2>
<div class="clearfix"></div>
</div>
<div class="x_content">
<br />
<%
ResultSet res11 = null;
int num = 0;
stat = conn.createStatement();
String data2 = "SELECT MAX(idPret) as midc FROM pret";
res11 = stat.executeQuery(data2);
while(res11.next()){
num = res11.getInt("midc");
}
String nb = String.valueOf(num + 1);
String numcb = "";
if(nb.length() == 1){
numcb = "P00000" + nb;
}else
if(nb.length() == 2){
numcb = "P0000" + nb;
}else
if(nb.length() == 3){
numcb = "P000" + nb;
}else
if(nb.length() == 4){
numcb = "P00" + nb;
}else
if(nb.length() == 5){
numcb = "P0" + nb;
}else
if(nb.length() == 6){
numcb = "P" + nb;
}

%>

<form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" action="" method="POST">
<div class="form-group">
<label class="control-label col-md-3 col-sm-3 col-xs-12" for="nump">N° Pret <span class="required">*</span>
</label>
<div class="col-md-6 col-sm-6 col-xs-12">
<input type="text" name="nump" required="required" class="form-control col-md-7 col-xs-12" value='<%= numcb %>' readonly="readonly">
</div>
</div>

<div class="form-group">
<label class="control-label col-md-3 col-sm-3 col-xs-12" for="idC">Nom Client <span class="required">*</span>
</label>
<div class="col-md-6 col-sm-6 col-xs-12">
<select name="idC">
<option name="idC" value="0" > -----Veillez un Client----- </option>
<%
String dataC = "SELECT * FROM client_table ORDER BY idc DESC";
ResultSet resC = stat.executeQuery(dataC);
while(resC.next()){
%>
<option name="idC" value='<%= resC.getInt("idc") %>' > <%= resC.getString("nomc") %></option>
<%
}
%>
</select>
</div>
</div>
<div class="form-group">
<label class="control-label col-md-3 col-sm-3 col-xs-12" for="idC">Nom Banque <span class="required">*</span>
</label>
<div class="col-md-6 col-sm-6 col-xs-12">
<select name="idB">
<option name="idB" value="0" > -----Veillez une Banque----- </option>
<%
String dataB = "SELECT * FROM banque ORDER BY NumBanque DESC";
ResultSet resB = stat.executeQuery(dataB);
while(resB.next()){
%>
<option name="idB" value='<%= resB.getInt("NumBanque") %>' > <%= resB.getString("NomBanque") %></option>
<%
}
%>
</select>
</div>
</div>

<div class="form-group">
<label class="control-label col-md-3 col-sm-3 col-xs-12" for="montant">Montant <span class="required">*</span>
</label>
<div class="col-md-6 col-sm-6 col-xs-12">
<input type="number" name="montant" required="required" class="form-control col-md-7 col-xs-12">
</div>
</div>
<%
java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd");
%>
<div class="form-group">
<label class="control-label col-md-3 col-sm-3 col-xs-12" for="dp">date du Pret<span class="required">*</span>
</label>
<div class="col-md-6 col-sm-6 col-xs-12">
<input type="date" name="dp" required="required" class="form-control col-md-7 col-xs-12" value='<%= df.format(new java.util.Date()) %>'>
</div>
</div>
<div class="ln_solid"></div>
<div class="form-group">
<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
<a href="../pages/listepret.jsp"><button class="btn btn-dark" type="button">Annuler</button></a>
<button type="submit" class="btn btn-primary">Ajouter</button>
</div>
</div>

</form>
</div>
</div>
</div>
</div>

</div>
</div>

<jsp:include page="../include/footer.jsp" />
<% 
int mm = 0;
int idCc =0;
int idBb = 0;
String cccc = "";
String bbbb = "";
int tttt=0;
int Mp=0;

String nump = request.getParameter("nump");
String idC = request.getParameter("idC");
String idB = request.getParameter("idB");
String m = request.getParameter("montant");
String dp = request.getParameter("dp");


if(nump!=null && m!=null && dp!=null){
    idCc = Integer.parseInt(idC);
    idBb = Integer.parseInt(idB);
    mm = Integer.parseInt(m);

    String datacc = "SELECT * FROM client_table WHERE idc='"+idCc+"'";
    ResultSet rescc = stat.executeQuery(datacc);
    while(rescc.next()){
        cccc = rescc.getString("nomc");
    }
    String databb = "SELECT * FROM banque WHERE NumBanque='"+idBb+"'";
    ResultSet resbb = stat.executeQuery(databb);
    while(resbb.next()){
        bbbb = resbb.getString("NomBanque");
        tttt = resbb.getInt("TauxBanque");
    }
    Mp = mm + ((mm * tttt)/100);
}

try {
if(nump!=null && m!=null && dp!=null){
String data = "INSERT INTO `pret` (`pretNum`,`cincand`,`NumBanque`,`Montant`,`datePret`,`NomCli`,`NomBq`,`MontantAPayer`) VALUES (?,?,?,?,?,?,?,?)";
stmt = conn.prepareStatement(data);
stmt.setString(1,nump);
stmt.setInt(2,idCc);
stmt.setInt(3,idBb);
stmt.setInt(4,mm);
stmt.setString(5,dp);
stmt.setString(6,cccc);
stmt.setString(7,bbbb);
stmt.setInt(8,Mp);
stmt.executeUpdate();
response.sendRedirect("../pages/listepret.jsp");
}
} catch (Exception e) {
e.printStackTrace();
}
%>