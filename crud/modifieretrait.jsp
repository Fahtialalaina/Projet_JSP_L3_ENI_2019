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
                <h2>Modification du Retrait</h2>
                <div class="clearfix"></div>
                </div>
                <div class="x_content">
                <br />
                <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" action="" method="POST">
                        <%
                        stat = conn.createStatement();
                String u = request.getParameter("u");
                int num = Integer.parseInt(u);
                String tmpmontant = "";
                String tmpcb = "";
                String data = "SELECT * FROM retrait INNER JOIN client ON retrait.cb = client.cb WHERE idr='"+num+"'";
                res = stat.executeQuery(data);
                while(res.next()){
                        tmpmontant = res.getString("montant");
                        tmpcb = res.getString("cb");
                %>
                <input type="hidden" name="idr" value='<%= res.getString("idr") %>'/>
                <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="nr">N°Retrait <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" name="nr" required="required" class="form-control col-md-7 col-xs-12" value='<%= res.getString("nr") %>' readonly="readonly">
                                </div>
                                </div>
                                <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="cb">N°Compte Bancaire <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" name="cb" required="required" class="form-control col-md-7 col-xs-12"  id="cb" onchange="changer(this.id, 'nom');" value='<%= res.getString("retrait.cb") %>' readonly="readonly">
                                </div>
                                </div>

                                <%
                                        ResultSet res2 = null;
                                        Statement stat2 = null;
                                        stat2 = conn.createStatement();
                                        String data2 = "SELECT * FROM client WHERE cb<>'"+tmpcb+"'";
                                        res2 = stat2.executeQuery(data2);
                                %>
                                <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="nom">Nom du Client <span class="required">*</span>
                                </label>

                                <div class="col-md-3 col-sm-3 col-xs-12">

                                
                                <select name="nom" id="nom" onchange="changer(this.id, 'cb');" class="form-control col-md-7 col-xs-12" required="required">
                                                <option value='<%= res.getString("retrait.cb") %>'><%= res.getString("nom") %></option>
                                                <%
                                                while(res2.next()){
                                                %>
                                                <option value='<%= res2.getString("cb") %>'>
                                                <%= res2.getString("nom") %>
                                                </option>
                                                <%
                                                }
                                                %>
                                </select>
                                </div>
                                </div>


                                <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="montant">Montant versé <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" name="montant" required="required" class="form-control col-md-7 col-xs-12" value='<%= res.getString("montant") %>'>
                                </div>
                                </div>
                                <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="date">Date du retrait <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="date" name="date" required="required" class="form-control col-md-7 col-xs-12" value='<%= res.getString("date") %>'>
                                </div>
                                </div>
                        <%
                        }
                        %>
                        <div class="ln_solid"></div>
                        <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                        <a href="../pages/retrait.jsp"><button class="btn btn-dark" type="button">Annuler</button></a>
                        <button type="submit" class="btn btn-success">Modifier</button>
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
String z = request.getParameter("idr");
String a = request.getParameter("nr");
String b = request.getParameter("cb");
String c = request.getParameter("montant");
String d = request.getParameter("date");

if(z!=null && a!=null && b!=null && c!=null && d!=null){
        int tmp = Integer.parseInt(tmpmontant);
        int cc = Integer.parseInt(c);
        if((b == tmpcb) && (tmp != cc)){
                if(tmp > cc){
                        String data3 = "UPDATE client SET solde = solde + (? - ?) WHERE cb = '"+b+"'";
                        stmt = conn.prepareStatement(data3);
                        stmt.setString(1,tmpmontant);
                        stmt.setString(2,c);
                        stmt.executeUpdate();
                }else
                if(tmp < cc){
                        String data4 = "UPDATE client SET solde = solde - (? - ?) WHERE cb = '"+b+"'";
                        stmt = conn.prepareStatement(data4);
                        stmt.setString(1,c);
                        stmt.setString(2,tmpmontant);
                        stmt.executeUpdate();
                }
        }else
        if(b != tmpcb){
                String data5 = "UPDATE client SET solde = solde + ? WHERE cb = '"+tmpcb+"'";
                stmt = conn.prepareStatement(data5);
                stmt.setString(1,tmpmontant);
                stmt.executeUpdate();

                String data6 = "UPDATE client SET solde = solde - ? WHERE cb = '"+b+"'";
                stmt = conn.prepareStatement(data6);
                stmt.setString(1,c);
                stmt.executeUpdate();
        }
        

    String data1 = "UPDATE retrait SET nr=?, cb=?, montant=?, date=? WHERE idr='"+z+"'";
    stmt = conn.prepareStatement(data1);
    stmt.setString(1,a);
    stmt.setString(2,b);
    stmt.setString(3,c);
    stmt.setString(4,d);
    stmt.executeUpdate();

    response.sendRedirect("../pages/retrait.jsp");
}
%>