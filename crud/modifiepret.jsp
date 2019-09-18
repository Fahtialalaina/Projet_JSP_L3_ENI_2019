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
String databbb = "SELECT * FROM client_table ORDER BY idc DESC";
res3 = stat3.executeQuery(databbb);

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
<select name="b">
<option name="b" value='<%= res.getString("NomCli") %>'> <%= res.getString("NomCli") %> </option>
<%

while(res2.next()){
%>
<option name="b" value='<%= res2.getInt("idc") %>' > <%= res2.getString("nomc") %>   </option>
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
<select name="c">
<option name="c" value='<%= res.getString("NumBanque") %>'> <%= res.getString("NomBq") %> </option>
<%

while(res3.next()){
%>
<option name="c" value='<%= res3.getInt("NumBanque") %>' > <%= res3.getString("NomBanque") %>   </option>
<%
}
%>
</select>
</div>
</div>

<div class="form-group">
<label class="control-label col-md-3 col-sm-3 col-xs-12" for="e">Montant <span class="required">*</span>
</label>
<div class="col-md-6 col-sm-6 col-xs-12">
<input type="int" name="e" required="required" class="form-control col-md-7 col-xs-12" value='<%= res.getString("Montant") %>'>
</div>
</div>
<div class="form-group">
<label class="control-label col-md-3 col-sm-3 col-xs-12" for="f">date du Pre<span class="required">*</span>
</label>
<div class="col-md-6 col-sm-6 col-xs-12">
<input type="date" name="f" required="required" class="form-control col-md-7 col-xs-12" value='<%= res.getString("datePret") %>'>
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
int mm = 0;
int idCc =0;
int idBb = 0;
String cccc = "";
String bbbb = "";
int tttt=0;
int Mp=0;

String nump = request.getParameter("a");
String idC = request.getParameter("b");
String idB = request.getParameter("c");
String m = request.getParameter("e");
String dp = request.getParameter("f");


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
String datappp = "INSERT INTO `pret` (`pretNum`,`cincand`,`NumBanque`,`Montant`,`datePret`,`NomCli`,`NomBq`,`MontantAPayer`) VALUES (?,?,?,?,?,?,?,?)";
stmt = conn.prepareStatement(datappp);
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