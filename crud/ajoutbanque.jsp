<%@page contentType="text/html" pageEncoding="UTF-8" %>
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
ResultSet res2 = null;
int num = 0;
stat = conn.createStatement();
String data2 = "SELECT MAX(NumBanque) as midc FROM banque";
res2 = stat.executeQuery(data2);
while(res2.next()){
num = res2.getInt("midc");
}
String nb = String.valueOf(num + 1);
String numcb = "";
if(nb.length() == 1){
numcb = "B00000" + nb;
}else
if(nb.length() == 2){
numcb = "B0000" + nb;
}else
if(nb.length() == 3){
numcb = "B000" + nb;
}else
if(nb.length() == 4){
numcb = "B00" + nb;
}else
if(nb.length() == 5){
numcb = "B0" + nb;
}else
if(nb.length() == 6){
numcb = "B" + nb;
}
%>
<form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" action="" method="POST">
<div class="form-group">
<label class="control-label col-md-3 col-sm-3 col-xs-12" for="a">Desing <span class="required">*</span>
</label>
<div class="col-md-6 col-sm-6 col-xs-12">
<input type="text" name="a" required="required" class="form-control col-md-7 col-xs-12">
</div>
</div>
<div class="form-group">
<label class="control-label col-md-3 col-sm-3 col-xs-12" for="b">Adresse <span class="required">*</span>
</label>
<div class="col-md-6 col-sm-6 col-xs-12">
<input type="text" name="b" required="required" class="form-control col-md-7 col-xs-12">
</div>
</div>
<div class="form-group">
<label class="control-label col-md-3 col-sm-3 col-xs-12" for="c">Taux <span class="required">*</span>
</label>
<div class="col-md-6 col-sm-6 col-xs-12">
<input type="number" name="c" required="required" class="form-control col-md-7 col-xs-12">
</div>
</div>
<div class="form-group">
<label class="control-label col-md-3 col-sm-3 col-xs-12" for="d">N° Banque <span class="required">*</span>
</label>
<div class="col-md-6 col-sm-6 col-xs-12">
<input type="text" name="d" required="required" class="form-control col-md-7 col-xs-12" value='<%= numcb %>' readonly="readonly">
</div>
</div>
<div class="ln_solid"></div>
<div class="form-group">
<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
<a href="../pages/listbanque.jsp"><button class="btn btn-dark" type="button">Annuler</button></a>
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
String a = request.getParameter("a");
String b = request.getParameter("b");
String c = request.getParameter("c");
String d = request.getParameter("d");

if(a!=null && b!=null && c!=null && d!=null){
String data = "INSERT INTO `banque` (`NumBanque`, `NomBanque`, `AdresseBanque`, `TauxBanque`, `NumBq`) VALUES (?,?,?,?,?)";
stmt = conn.prepareStatement(data);
stmt.setString(1,nb);
stmt.setString(2,a);
stmt.setString(3,b);
stmt.setString(4,c);
stmt.setString(5,d);
stmt.executeUpdate();
response.sendRedirect("../pages/listbanque.jsp");
}
%>