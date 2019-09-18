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
<h2>Modification du Banque</h2>
<div class="clearfix"></div>
</div>
<div class="x_content">
<br />
<form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" action="" method="POST">
<%
stat = conn.createStatement();
String u = request.getParameter("u");
int num = Integer.parseInt(u);
String data = "SELECT * FROM banque WHERE NumBanque='"+num+"'";
res = stat.executeQuery(data);
while(res.next()){
%>
<input type="hidden" name="idb" value='<%= res.getString("NumBanque") %>'/>
<div class="form-group">
<label class="control-label col-md-3 col-sm-3 col-xs-12" for="a">N° Banque <span class="required">*</span>
</label>
<div class="col-md-6 col-sm-6 col-xs-12">
<input type="text" name="a" required="required" class="form-control col-md-7 col-xs-12" value='<%= res.getString("NumBq") %>'>
</div>
</div>
<div class="form-group">
<label class="control-label col-md-3 col-sm-3 col-xs-12" for="b">Desing <span class="required">*</span>
</label>
<div class="col-md-6 col-sm-6 col-xs-12">
<input type="text" name="b" required="required" class="form-control col-md-7 col-xs-12" value='<%= res.getString("NomBanque") %>'>
</div>
</div>
<div class="form-group">
<label class="control-label col-md-3 col-sm-3 col-xs-12" for="c">Adresse <span class="required">*</span>
</label>
<div class="col-md-6 col-sm-6 col-xs-12">
<input type="text" name="c" required="required" class="form-control col-md-7 col-xs-12" value='<%= res.getString("AdresseBanque") %>'>
</div>
</div>
<div class="form-group">
<label class="control-label col-md-3 col-sm-3 col-xs-12" for="d">Taux <span class="required">*</span>
</label>
<div class="col-md-6 col-sm-6 col-xs-12">
<input type="text" name="d" required="required" class="form-control col-md-7 col-xs-12" value='<%= res.getString("TauxBanque") %>'>
</div>
</div>
<%
}
%>
<div class="ln_solid"></div>
<div class="form-group">
<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
<a href="../pages/listbanque.jsp"><button class="btn btn-dark" type="button">Annuler</button></a>
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
String e = request.getParameter("idb");
String a = request.getParameter("a");
String b = request.getParameter("b");
String c = request.getParameter("c"); 
String d = request.getParameter("d");

if(a!=null && b!=null && c!=null && d!=null){
String query = "UPDATE banque SET NumBq=?, NomBanque=?, AdresseBanque=?, TauxBanque=? WHERE NumBanque='"+e+"'";
stmt = conn.prepareStatement(query);
stmt.setString(1,a);
stmt.setString(2,b);
stmt.setString(3,c);
stmt.setString(4,d);
stmt.executeUpdate();
response.sendRedirect("../pages/listbanque.jsp");
}
%>