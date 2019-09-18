<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ include file="../include/inc.jsp" %>
<jsp:include page="../include/header.jsp" />
<title>Virement | Gestion Bancaire</title>
<jsp:include page="../include/menu.jsp" />
<%@ include file="../include/connex.jsp" %>

<div class="right_col" role="main">
        <div class="">
                <div class="page-title">
                <div class="title_left">
                <h3>Virement | <small>Gestion Bancaire</small></h3>
                </div>
                </div>
        
        <!-- page content -->
        
                <div class="clearfix"></div>
        
                <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                <div class="x_title">
                <h2>Modification du Virement</h2>
                <div class="clearfix"></div>
                </div>
                <div class="x_content">
                <br />
                <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" action="" method="POST">
                <%
                ResultSet res8 = null;
                stat = conn.createStatement();
                String u = request.getParameter("u");
                int num = Integer.parseInt(u);
                String tmpmontant = "";
                String tmpcbe = "";
                String tmpcbr = "";
                String data = "SELECT * FROM virement INNER JOIN client ON cbe = cb WHERE idvi='"+num+"'";
                res8 = stat.executeQuery(data);
                while(res8.next()){
                        tmpmontant = res8.getString("montant");
                        tmpcbe = res8.getString("cbe");
                        tmpcbr = res8.getString("cbr");
                %>
                <input type="hidden" name="idvi" value='<%= res8.getString("idvi") %>'/>
                <div class="form-group">
                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="nvi">N°Virement <span class="required">*</span>
                </label>
                <div class="col-md-6 col-sm-6 col-xs-12">
                <input type="text" name="nvi" required="required" class="form-control col-md-7 col-xs-12" value='<%= res8.getString("nvi") %>' readonly="readonly">
                </div>
                </div>

                <div class="form-group">
                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="cbe">N°Compte Émetteur <span class="required">*</span>
                </label>
                <div class="col-md-6 col-sm-6 col-xs-12">
                <input type="text" name="cbe" required="required" class="form-control col-md-7 col-xs-12"  id="cbe" onchange="changer(this.id, 'nome');" value='<%= res8.getString("cbe") %>' readonly="readonly">
                </div>
                </div>
                
                <div class="form-group">
                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="nome">Nom d'Émetteur <span class="required">*</span>
                </label>

                <div class="col-md-3 col-sm-3 col-xs-12">

                
                <select name="nome" id="nome" onchange="changer(this.id, 'cbe');" class="form-control col-md-7 col-xs-12" required="required">
                <option value='<%= res8.getString("cb") %>'><%= res8.getString("nom") %></option>
                <%
                ResultSet res20 = null;
                Statement stat20 = null;
                stat20 = conn.createStatement();
                String data20 = "SELECT * FROM client WHERE cb<>'"+tmpcbe+"'";
                res20 = stat20.executeQuery(data20);
                while(res20.next()){
                %>
                <option value='<%= res20.getString("cb") %>'>
                <%= res20.getString("nom") %>
                </option>
                <%
                }
                %>
                </select>
                </div>
                </div>

                <div class="form-group">
                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="cbr">N°Compte Récepteur <span class="required">*</span>
                </label>
                <div class="col-md-6 col-sm-6 col-xs-12">
                <input type="text" name="cbr" required="required" class="form-control col-md-7 col-xs-12"  id="cbr" onchange="changer(this.id, 'nomr');" value='<%= res8.getString("cbr") %>' readonly="readonly">
                </div>
                </div>
                
                <div class="form-group">
                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="nomr">Nom du Récepteur <span class="required">*</span>
                </label>

                <div class="col-md-3 col-sm-3 col-xs-12">

                
                <select name="nomr" id="nomr" onchange="changer(this.id, 'cbr');" class="form-control col-md-7 col-xs-12" required="required">
                <option value='<%= res8.getString("cbr") %>'><%= res8.getString("nomr") %></option>
                <%
                ResultSet res30 = null;
                Statement stat30 = null;
                stat30 = conn.createStatement();
                String data30 = "SELECT * FROM client WHERE cb<>'"+tmpcbr+"'";
                res30 = stat30.executeQuery(data30);
                while(res30.next()){
                %>
                <option value='<%= res30.getString("cb") %>'>
                <%= res30.getString("nom") %>
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
                        <input type="text" name="montant" required="required" class="form-control col-md-7 col-xs-12" value='<%= res8.getString("montant") %>'>
                </div>
                </div>
                <div class="form-group">
                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="date">Date du virement <span class="required">*</span>
                </label>
                <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="date" name="date" required="required" class="form-control col-md-7 col-xs-12" value='<%= res8.getString("date") %>'>
                </div>
                </div>
                <%
                }
                %>
                <div class="ln_solid"></div>
                <div class="form-group">
                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                <a href="../pages/virement.jsp"><button class="btn btn-dark" type="button">Annuler</button></a>
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
String z = request.getParameter("idvi");
String a = request.getParameter("nvi");
String b = request.getParameter("cbe");
String c = request.getParameter("cbr");
String d = "";
String e = request.getParameter("montant");
String f = request.getParameter("date");

ResultSet res4 = null;
stat = conn.createStatement();
String data4 = "SELECT * FROM client WHERE cb='"+c+"'";
res4 = stat.executeQuery(data4);
while(res4.next()){
        d = res4.getString("nom");
}

if(z!=null && a!=null && b!=null && c!=null && d!=null && e!=null && f!=null){
        int tmp = Integer.parseInt(tmpmontant);
        int ee = Integer.parseInt(e);

        if((b == tmpcbe) && (c != tmpcbr) && (tmpmontant == e)){
                stmt = conn.prepareStatement("UPDATE client SET solde = solde - ? WHERE cb = '"+tmpcbr+"'");
                stmt.setString(1,e);
                stmt.executeUpdate();

                stmt = conn.prepareStatement("UPDATE client SET solde = solde + ? WHERE cb = '"+c+"'");
                stmt.setString(1,e);
                stmt.executeUpdate();
        }else
        if((b == tmpcbe) && (c == tmpcbr) && (tmpmontant != e)){
                if(tmp > ee){
                        stmt = conn.prepareStatement("UPDATE client SET solde = solde + (? - ?) WHERE cb = '"+b+"'");
                        stmt.setString(1,tmpmontant);
                        stmt.setString(2,e);
                        stmt.executeUpdate();

                        stmt = conn.prepareStatement("UPDATE client SET solde = solde - (? - ?) WHERE cb = '"+c+"'");
                        stmt.setString(1,tmpmontant);
                        stmt.setString(2,e);
                        stmt.executeUpdate();
                }else
                if(tmp < ee){
                    stmt = conn.prepareStatement("UPDATE client SET solde = solde - (? - ?) WHERE cb = '"+b+"'");
                    stmt.setString(1,e);
                    stmt.setString(2,tmpmontant);
                    stmt.executeUpdate();

                    stmt = conn.prepareStatement("UPDATE client SET solde = solde + (? - ?) WHERE cb = '"+c+"'");
                    stmt.setString(1,e);
                    stmt.setString(2,tmpmontant);
                    stmt.executeUpdate();
                }
        }else
        if((b != tmpcbe) && (c == tmpcbr) && (tmpmontant == e)){
                stmt = conn.prepareStatement("UPDATE client SET solde = solde + ? WHERE cb = '"+tmpcbe+"'");
                stmt.setString(1,e);
                stmt.executeUpdate();

                stmt = conn.prepareStatement("UPDATE client SET solde = solde - ? WHERE cb = '"+b+"'");
                stmt.setString(1,e);
                stmt.executeUpdate();
        }else
        if((b != tmpcbe) && (c == tmpcbr) && (tmpmontant != e)){
                stmt = conn.prepareStatement("UPDATE client SET solde = solde + ? WHERE cb = '"+tmpcbe+"'");
                stmt.setString(1,tmpmontant);
                stmt.executeUpdate();

                stmt = conn.prepareStatement("UPDATE client SET solde = solde - ? WHERE cb = '"+b+"'");
                stmt.setString(1,e);
                stmt.executeUpdate();

                if(tmp > ee){
                    stmt = conn.prepareStatement("UPDATE client SET solde = solde - (? - ?) WHERE cb = '"+c+"'");
                    stmt.setString(1,tmpmontant);
                    stmt.setString(2,e);
                    stmt.executeUpdate();
                }else
                if(tmp < ee){
                    stmt = conn.prepareStatement("UPDATE client SET solde = solde + (? - ?) WHERE cb = '"+c+"'");
                    stmt.setString(1,e);
                    stmt.setString(2,tmpmontant);
                    stmt.executeUpdate();
                }
        }else
        if((b == tmpcbe) && (c != tmpcbr) && (tmpmontant != e)){
                stmt = conn.prepareStatement("UPDATE client SET solde = solde - ? WHERE cb = '"+tmpcbr+"'");
                stmt.setString(1,tmpmontant);
                stmt.executeUpdate();

                stmt = conn.prepareStatement("UPDATE client SET solde = solde + ? WHERE cb = '"+c+"'");
                stmt.setString(1,e);
                stmt.executeUpdate();

                if(tmp > ee){
                    stmt = conn.prepareStatement("UPDATE client SET solde = solde + (? - ?) WHERE cb = '"+b+"'");
                    stmt.setString(1,tmpmontant);
                    stmt.setString(2,e);
                    stmt.executeUpdate();
                }else
                if(tmp < ee){
                    stmt = conn.prepareStatement("UPDATE client SET solde = solde - (? - ?) WHERE cb = '"+b+"'");
                    stmt.setString(1,e);
                    stmt.setString(2,tmpmontant);
                    stmt.executeUpdate();
                }
        }else
        if((b != tmpcbe) && (c != tmpcbr)){
                stmt = conn.prepareStatement("UPDATE client SET solde = solde + ? WHERE cb = '"+tmpcbe+"'");
                stmt.setString(1,tmpmontant);
                stmt.executeUpdate();

                stmt = conn.prepareStatement("UPDATE client SET solde = solde - ? WHERE cb = '"+b+"'");
                stmt.setString(1,e);
                stmt.executeUpdate();

                stmt = conn.prepareStatement("UPDATE client SET solde = solde - ? WHERE cb = '"+tmpcbr+"'");
                stmt.setString(1,tmpmontant);
                stmt.executeUpdate();

                stmt = conn.prepareStatement("UPDATE client SET solde = solde + ? WHERE cb = '"+c+"'");
                stmt.setString(1,e);
                stmt.executeUpdate();
        }
        

    String data5 = "UPDATE virement SET nvi=?, cbe=?, cbr=?, nomr=?, montant=?, date=? WHERE idvi='"+z+"'";
    stmt = conn.prepareStatement(data5);
    stmt.setString(1,a);
    stmt.setString(2,b);
    stmt.setString(3,c);
    stmt.setString(4,d);
    stmt.setString(5,e);
    stmt.setString(6,f);
    stmt.executeUpdate();

    response.sendRedirect("../pages/virement.jsp");
}
%>