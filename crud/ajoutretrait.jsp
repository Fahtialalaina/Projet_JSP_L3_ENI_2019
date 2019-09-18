<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ include file="../include/inc.jsp" %>
<jsp:include page="../include/header.jsp" />
<title>Retrait | Gestion Bancaire</title>
<jsp:include page="../include/menu.jsp" />
<%@ include file="../include/connex.jsp" %>

<div class="right_col" role="main">
        <div class="">
                <div class="page-title">
                <div class="title_left">
                <h3>Retrait | <small>Gestion Bancaire</small></h3>
                </div>
                </div>
        
        <!-- page content -->
        
                <div class="clearfix"></div>
        
                <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                        <div class="x_title">
                        <h2>Nouveau Retrait</h2>
                        <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                        <br />
                        <%
                        ResultSet res2 = null;
                        int num = 0;
                        stat = conn.createStatement();
                        String data2 = "SELECT MAX(idr) as midr FROM retrait";
                        res2 = stat.executeQuery(data2);
                        while(res2.next()){
                                num = res2.getInt("midr");
                        }
                        String nb = String.valueOf(num + 1);
                        String numnr = "";
                        if(nb.length() == 1){
                                numnr = "RE0000" + nb;
                        }else
                        if(nb.length() == 2){
                                numnr = "RE000" + nb;
                        }else
                        if(nb.length() == 3){
                                numnr = "RE00" + nb;
                        }else
                        if(nb.length() == 4){
                                numnr = "RE0" + nb;
                        }else
                        if(nb.length() == 5){
                                numnr = "RE" + nb;
                        }
                        %>
                        <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" action="" method="POST">
                                <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="nr">N°Retrait <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" name="nr" required="required" class="form-control col-md-7 col-xs-12" value='<%= numnr %>' readonly="readonly">
                                </div>
                                </div>
                                <%
                                String cb="";
                                %>
                                <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="cb">N°Compte Bancaire <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" name="cb" required="required" class="form-control col-md-7 col-xs-12"  id="cb" onchange="changer(this.id, 'nom');" value='<%= cb %>' readonly="readonly">
                                </div>
                                </div>

                                <%
                                stat = conn.createStatement();
                                String data = "SELECT * FROM client";
                                res = stat.executeQuery(data);
                                %>
                                <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="nom">Nom du Client <span class="required">*</span>
                                </label>

                                <div class="col-md-3 col-sm-3 col-xs-12">

                                
                                <select name="nom" id="nom" onchange="changer(this.id, 'cb');" class="form-control col-md-7 col-xs-12" required="required">
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


                                <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="montant">Montant tiré <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" name="montant" required="required" class="form-control col-md-7 col-xs-12">
                                </div>
                                </div>
                                <%
                                java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd");
                                %>
                                <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="date">Date du retrait <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="date" name="date" required="required" class="form-control col-md-7 col-xs-12" value='<%= df.format(new java.util.Date()) %>'>
                                </div>
                                </div>
                                <div class="ln_solid"></div>
                                <div class="form-group">
                                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                <a href="../pages/retrait.jsp"><button class="btn btn-dark" type="button">Annuler</button></a>
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
String a = request.getParameter("nr");
String b = request.getParameter("cb");
String c = request.getParameter("montant");
String d = request.getParameter("date");

if(a!=null && b!=null && c!=null && d!=null){
        String data1 = "INSERT INTO `retrait` (`nr`, `cb`, `montant`, `date`) VALUES (?,?,?,?)";
        stmt = conn.prepareStatement(data1);
        stmt.setString(1,a);
        stmt.setString(2,b);
        stmt.setString(3,c);
        stmt.setString(4,d);
        stmt.executeUpdate();

        String data3 = "UPDATE client SET solde = solde - ? WHERE cb = '"+b+"'";
        stmt = conn.prepareStatement(data3);
        stmt.setString(1,c);
        stmt.executeUpdate();

        response.sendRedirect("../pages/retrait.jsp");
}
%>