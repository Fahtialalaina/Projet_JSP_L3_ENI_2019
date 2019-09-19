<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ include file="../include/inc.jsp" %>
<jsp:include page="../include/header.jsp" />
<title>Clients | Gestion Bancaire</title>
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
String data2 = "SELECT MAX(idc) as midc FROM client_table";
res11 = stat.executeQuery(data2);
while(res11.next()){
num = res11.getInt("midc");
}
String nb = String.valueOf(num + 1);
String numcb = "";
if(nb.length() == 1){
numcb = "C00000" + nb;
}else
if(nb.length() == 2){
numcb = "C0000" + nb;
}else
if(nb.length() == 3){
numcb = "C000" + nb;
}else
if(nb.length() == 4){
numcb = "C00" + nb;
}else
if(nb.length() == 5){
numcb = "C0" + nb;
}else
if(nb.length() == 6){
numcb = "C" + nb;
}
%>
<form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" action="" method="POST">
<div class="form-group">
<label class="control-label col-md-3 col-sm-3 col-xs-12" for="numc">N° Client <span class="required">*</span>
</label>
<div class="col-md-6 col-sm-6 col-xs-12">
<input type="text" name="numc" required="required" class="form-control col-md-7 col-xs-12" value='<%= numcb %>' readonly="readonly">
</div>
</div>
<div class="form-group">
<label class="control-label col-md-3 col-sm-3 col-xs-12" for="nom">Nom <span class="required">*</span>
</label>
<div class="col-md-6 col-sm-6 col-xs-12">
<input type="text" name="nom" required="required" class="form-control col-md-7 col-xs-12">
</div>
</div>
<div class="form-group">
<label class="control-label col-md-3 col-sm-3 col-xs-12" for="phone">N° Téléphone <span class="required">*</span>
</label>
<div class="col-md-6 col-sm-6 col-xs-12">
<input type="tel" name="phone" required="required" class="form-control col-md-7 col-xs-12">
</div>
</div>
<%
java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd");
%>
<div class="form-group">
<label class="control-label col-md-3 col-sm-3 col-xs-12" for="born">Date Naissace <span class="required">*</span>
</label>
<div class="col-md-6 col-sm-6 col-xs-12">
<input type="date" name="born" required="required" class="form-control col-md-7 col-xs-12" value='<%= df.format(new java.util.Date()) %>'>
</div>
</div>

<div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="nom">Sexe <span class="required">*</span>
        </label>
        <div class="col-md-3 col-sm-3 col-xs-12">
        <select name="sexe" id="sexe" class="form-control col-md-7 col-xs-12" required="required">
        <option value="Masculin">Masculin</option>
        <option value="Feminin">Feminin</option>
        </select>
        </div>
        </div>

<!-- 
<div class="form-group">
<label class="control-label col-md-3 col-sm-3 col-xs-12" for="sexe">Sexe <span class="required">*</span>
</label>
<div class="col-md-6 col-sm-6 col-xs-12">
<input type="text" name="sexe" required="required" class="form-control col-md-7 col-xs-12">
</div>
</div> -->

<div class="form-group">
<label class="control-label col-md-3 col-sm-3 col-xs-12" for="adresse">Adresse <span class="required">*</span>
</label>
<div class="col-md-6 col-sm-6 col-xs-12">
<input type="text" name="adresse" required="required" class="form-control col-md-7 col-xs-12">
</div>
</div>
<div class="ln_solid"></div>
<div class="form-group">
<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
<a href="../pages/listeclient.jsp"><button class="btn btn-dark" type="button">Annuler</button></a>
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
String numc = request.getParameter("numc");
String nom = request.getParameter("nom");
String phone = request.getParameter("phone");
String born = request.getParameter("born");
String sexe = request.getParameter("sexe");
String adresse = request.getParameter("adresse");

if(numc!=null && nom!=null && phone!=null && born!=null && sexe!=null && adresse!=null){
String data = "INSERT INTO `client_table` (`cin`, `nomc`, `gsm`, `date_naissance`, `sexe`, `adresse`) VALUES (?,?,?,?,?,?)";
stmt = conn.prepareStatement(data);
stmt.setString(1,numc);
stmt.setString(2,nom);
stmt.setString(3,phone);
stmt.setString(4,born);
stmt.setString(5,sexe);
stmt.setString(6,adresse);
stmt.executeUpdate();
response.sendRedirect("../pages/listeclient.jsp");
}
%>