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
stat2 = conn2.createStatement();
String u = request.getParameter("u");
int num = Integer.parseInt(u);
String data = "SELECT * FROM pret WHERE idPret='"+num+"'";
res = stat.executeQuery(data);

String dataccc = "SELECT * FROM client_table ORDER BY idc DESC";
res2 = stat2.executeQuery(dataccc);

while(res.next()){

%>
<input type="hidden" name="idp" value='<%= res.getString("idPret") %>'/>
<div class="form-group">
<label class="control-label col-md-3 col-sm-3 col-xs-12" for="a">N° Pret <span class="required">*</span>
</label>
<div class="col-md-6 col-sm-6 col-xs-12">
<input type="text" name="a" required="required" class="form-control col-md-7 col-xs-12" value='<%= res.getString("pretNum") %>'>
</div>
</div>
<div class="form-group">
<label class="control-label col-md-3 col-sm-3 col-xs-12" for="b">Nom Client <span class="required">*</span>
</label>
<div class="col-md-6 col-sm-6 col-xs-12">
<input type="text" name="nom" required="required" class="form-control col-md-7 col-xs-12" value='<%= res.getString("NomCli") %>'>
</div>
</div>

<div class="form-group">
<label class="control-label col-md-3 col-sm-3 col-xs-12" for="idC">Nom Client <span class="required">*</span>
</label>
<div class="col-md-6 col-sm-6 col-xs-12">
<select name="idC">
<option name="idC" value='<%= res.getString("NomCli") %>'> <%= res.getString("NomCli") %> </option>
<%

while(res2.next()){
%>
<option name="idC" value='<%= res2.getInt("idc") %>' > <%= res2.getString("nomc") %>   </option>
<%
}
%>
</select>
</div>
</div>

<div class="form-group">
<label class="control-label col-md-3 col-sm-3 col-xs-12" for="c">Nom Banque <span class="required">*</span>
</label>
<div class="col-md-6 col-sm-6 col-xs-12">
<input type="text" name="c" required="required" class="form-control col-md-7 col-xs-12" value='<%= res.getString("NomBq") %>'>
</div>
</div>
<div class="form-group">
<label class="control-label col-md-3 col-sm-3 col-xs-12" for="d">Montant <span class="required">*</span>
</label>
<div class="col-md-6 col-sm-6 col-xs-12">
<input type="int" name="d" required="required" class="form-control col-md-7 col-xs-12" value='<%= res.getString("Montant") %>'>
</div>
</div>
<div class="form-group">
<label class="control-label col-md-3 col-sm-3 col-xs-12" for="e">date du Pre<span class="required">*</span>
</label>
<div class="col-md-6 col-sm-6 col-xs-12">
<input type="date" name="e" required="required" class="form-control col-md-7 col-xs-12" value='<%= res.getString("datePret") %>'>
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
String a = request.getParameter("a");
String b = request.getParameter("b");
String c = request.getParameter("c"); 
String d = request.getParameter("d");
String e = request.getParameter("e");
String adresse = request.getParameter("adresse");

if(idc!=null && a!=null && b!=null && c!=null && d!=null && e!=null && adresse!=null){
String query = "UPDATE client_table SET cin=?, bc=?, gsm=?, date_naissance=?, e=?, adresse=? WHERE idc='"+idc+"'";
stmt = conn.prepareStatement(query);
stmt.setString(1,a);
stmt.setString(2,b);
stmt.setString(3,c);
stmt.setString(4,d);
stmt.setString(5,e);
stmt.setString(6,adresse);
stmt.executeUpdate();
response.sendRedirect("../pages/listeclient.jsp");
}
%>