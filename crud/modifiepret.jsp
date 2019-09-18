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
<h2>Modification du Client</h2>
<div class="clearfix"></div>
</div>
<div class="x_content">
<br />
<form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" action="" method="POST">
<%
stat = conn.createStatement();
String u = request.getParameter("u");
int num = Integer.parseInt(u);
String data = "SELECT * FROM pret WHERE idPret='"+num+"'";
res = stat.executeQuery(data);
while(res.next()){
%>
<input type="hidden" name="idc" value='<%= res.getString("idc") %>'/>
<div class="form-group">
<label class="control-label col-md-3 col-sm-3 col-xs-12" for="numc">N° Client <span class="required">*</span>
</label>
<div class="col-md-6 col-sm-6 col-xs-12">
<input type="text" name="numc" required="required" class="form-control col-md-7 col-xs-12" value='<%= res.getString("cin") %>'>
</div>
</div>
<div class="form-group">
<label class="control-label col-md-3 col-sm-3 col-xs-12" for="nom">Nom <span class="required">*</span>
</label>
<div class="col-md-6 col-sm-6 col-xs-12">
<input type="text" name="nom" required="required" class="form-control col-md-7 col-xs-12" value='<%= res.getString("nomc") %>'>
</div>
</div>
<div class="form-group">
<label class="control-label col-md-3 col-sm-3 col-xs-12" for="phone">N° Téléphone <span class="required">*</span>
</label>
<div class="col-md-6 col-sm-6 col-xs-12">
<input type="tel" name="phone" required="required" class="form-control col-md-7 col-xs-12" value='<%= res.getString("gsm") %>'>
</div>
</div>
<div class="form-group">
<label class="control-label col-md-3 col-sm-3 col-xs-12" for="born">Date Naissace <span class="required">*</span>
</label>
<div class="col-md-6 col-sm-6 col-xs-12">
<input type="date" name="born" required="required" class="form-control col-md-7 col-xs-12" value='<%= res.getString("date_naissance") %>'>
</div>
</div>
<div class="form-group">
<label class="control-label col-md-3 col-sm-3 col-xs-12" for="sexe">Sexe<span class="required">*</span>
</label>
<div class="col-md-6 col-sm-6 col-xs-12">
<input type="text" name="sexe" required="required" class="form-control col-md-7 col-xs-12" value='<%= res.getString("sexe") %>'>
</div>
</div>
<div class="form-group">
<label class="control-label col-md-3 col-sm-3 col-xs-12" for="adresse">Adresse <span class="required">*</span>
</label>
<div class="col-md-6 col-sm-6 col-xs-12">
<input type="text" name="adresse" required="required" class="form-control col-md-7 col-xs-12" value='<%= res.getString("adresse") %>'>
</div>
</div>
<%
}
%>
<div class="ln_solid"></div>
<div class="form-group">
<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
<a href="../pages/listeclient.jsp"><button class="btn btn-dark" type="button">Annuler</button></a>
<button type="submit" class="btn btn-success">Valider</button>
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
String idc = request.getParameter("idc");
String numc = request.getParameter("numc");
String nom = request.getParameter("nom");
String phone = request.getParameter("phone"); 
String born = request.getParameter("born");
String sexe = request.getParameter("sexe");
String adresse = request.getParameter("adresse");

if(idc!=null && numc!=null && nom!=null && phone!=null && born!=null && sexe!=null && adresse!=null){
String query = "UPDATE client_table SET cin=?, nomc=?, gsm=?, date_naissance=?, sexe=?, adresse=? WHERE idc='"+idc+"'";
stmt = conn.prepareStatement(query);
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