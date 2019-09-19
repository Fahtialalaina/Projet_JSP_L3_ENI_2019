<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ include file="../include/inc.jsp" %>
<jsp:include page="../include/header.jsp" />
<title>Virement | Gestion des Prets Bancaire</title>
<jsp:include page="../include/menu.jsp" />
<%@ include file="../include/connex.jsp" %>

<div class="right_col" role="main">
        <div class="">
        <div class="page-title">
        <div class="title_left">
        <h3>Virement | <small>Gestion des Prets Bancaire</small></h3>
        </div>
        </div>

        <!-- page content -->

        <div class="clearfix"></div>

        <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
        <div class="x_title">
        <h2>Nouveau Virement</h2>
        <div class="clearfix"></div>
        </div>
        <div class="x_content">
        <br />
        <%
        ResultSet res2 = null;
        int num = 0;
        stat = conn.createStatement();
        String data2 = "SELECT MAX(idvi) as midvi FROM virement";
        res2 = stat.executeQuery(data2);
        while(res2.next()){
                num = res2.getInt("midvi");
        }
        String nb = String.valueOf(num + 1);
        String numnve = "";
        if(nb.length() == 1){
                numnve = "VI0000" + nb;
        }else
        if(nb.length() == 2){
                numnve = "VI000" + nb;
        }else
        if(nb.length() == 3){
                numnve = "VI00" + nb;
        }else
        if(nb.length() == 4){
                numnve = "VI0" + nb;
        }else
        if(nb.length() == 5){
                numnve = "VI" + nb;
        }
        %>
        <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" action="" method="POST">
        <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="nvi">N°Virement <span class="required">*</span>
        </label>
        <div class="col-md-6 col-sm-6 col-xs-12">
        <input type="text" name="nvi" required="required" class="form-control col-md-7 col-xs-12" value='<%= numnve %>' readonly="readonly">
        </div>
        </div>
        <%
        String cbe="";
        %>
        <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="cbe">N°Compte Émetteur <span class="required">*</span>
        </label>
        <div class="col-md-6 col-sm-6 col-xs-12">
        <input type="text" name="cbe" required="required" class="form-control col-md-7 col-xs-12"  id="cbe" onchange="changer(this.id, 'nome');" value='<%= cbe %>' readonly="readonly">
        </div>
        </div>

        <%
        stat = conn.createStatement();
        String data = "SELECT * FROM client";
        res = stat.executeQuery(data);
        %>
        <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="nome">Nom du Client <span class="required">*</span>
        </label>

        <div class="col-md-3 col-sm-3 col-xs-12">

        
        <select name="nome" id="nome" onchange="changer(this.id, 'cbe');" class="form-control col-md-7 col-xs-12" required="required">
        <option value=""></option>
        <%
        while(res.next()){
        %>
        <option value='<%= res.getString("cb") %>'>
                <%= res.getString("nom") %>
        </option>
        <%
        }
        %>
        </select>
        </div>
        </div>

        <%
        String cbr="";
        %>
        <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="cbr">N°Compte Récepteur <span class="required">*</span>
        </label>
        <div class="col-md-6 col-sm-6 col-xs-12">
        <input type="text" name="cbr" required="required" class="form-control col-md-7 col-xs-12"  id="cbr" onchange="changer(this.id, 'nomr');" value='<%= cbr %>' readonly="readonly">
        </div>
        </div>

        <%
        ResultSet res3 = null;
        stat = conn.createStatement();
        String data3 = "SELECT * FROM client";
        res3 = stat.executeQuery(data3);
        %>
        <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="nomr">Nom du Récepteur <span class="required">*</span>
        </label>

        <div class="col-md-3 col-sm-3 col-xs-12">

        
        <select name="nomr" id="nomr" onchange="changer(this.id, 'cbr');" class="form-control col-md-7 col-xs-12" required="required">
        <option value=""></option>
        <%
        while(res3.next()){
        %>
        <option value='<%= res3.getString("cb") %>'>
                <%= res3.getString("nom") %>
        </option>
        <%
        }
        %>
        </select>
        </div>
        </div>


        <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="montant">Montant viré <span class="required">*</span>
        </label>
        <div class="col-md-6 col-sm-6 col-xs-12">
                <input type="text" name="montant" required="required" class="form-control col-md-7 col-xs-12">
        </div>
        </div>
        <%
        java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd");
        %>
        <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="date">Date du virement <span class="required">*</span>
        </label>
        <div class="col-md-6 col-sm-6 col-xs-12">
                <input type="date" name="date" required="required" class="form-control col-md-7 col-xs-12" value='<%= df.format(new java.util.Date()) %>'>
        </div>
        </div>
        <div class="ln_solid"></div>
        <div class="form-group">
        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
        <a href="../pages/virement.jsp"><button class="btn btn-dark" type="button">Annuler</button></a>
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
        
<script type="text/javascript">
function changer(param1, param2){
var param1 = document.getElementById(param1);
var param2 = document.getElementById(param2);
param2.value = param1.value;
}
</script>
<jsp:include page="../include/footer.jsp" />
<%
String a = request.getParameter("nvi");
String b = request.getParameter("cbe");
String c = request.getParameter("cbr");
String d = "";
String e = request.getParameter("montant");
String f = request.getParameter("date");

ResultSet res4 = null;
stat = conn.createStatement();
String data4 = "SELECT nom FROM client WHERE cb='"+c+"'";
res4 = stat.executeQuery(data4);
while(res4.next()){
        d = res4.getString("nom");
}

if(a!=null && b!=null && c!=null && d!=null && e!=null && f!=null){
    stmt = conn.prepareStatement("INSERT INTO `virement` (`nvi`, `cbe`, `cbr`, `nomr`, `montant`, `date`) VALUES (?,?,?,?,?,?)");
    stmt.setString(1,a);
    stmt.setString(2,b);
    stmt.setString(3,c);
    stmt.setString(4,d);
    stmt.setString(5,e);
    stmt.setString(6,f);
    stmt.executeUpdate();

        stmt = conn.prepareStatement("UPDATE client SET solde = solde + ? WHERE cb = '"+c+"'");
        stmt.setString(1,e);
        stmt.executeUpdate();

        stmt = conn.prepareStatement("UPDATE client SET solde = solde - ? WHERE cb = '"+b+"'");
        stmt.setString(1,e);
        stmt.executeUpdate();

        response.sendRedirect("../pages/virement.jsp");
}
%>