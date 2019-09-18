<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ include file="../include/inc.jsp" %>
<jsp:include page="../include/header.jsp" />
<title>Bilan | Gestion Bancaire</title>
<jsp:include page="../include/menu.jsp" />
<%@ include file="../include/connex.jsp" %>

<div class="right_col" role="main">
        <div class="">
          <div class="page-title">
            <div class="title_left">
              <h3>Bilan | <small>Gestion Bancaire</small></h3>
            </div>
          </div>
    
        <!-- page content -->
        <%
        ResultSet res0 = null;
        stat = conn.createStatement();
        String data0 = "SELECT * FROM versement ORDER BY montant desc limit 10";
        String d0 = "";
        res0 = stat.executeQuery(data0);
        while(res0.next()){
                d0 = d0.concat(res0.getString("montant") + ",");
        }
        d0 = d0.substring(0, d0.length() - 1);

        ResultSet res1 = null;
        stat = conn.createStatement();
        String data1 = "SELECT * FROM retrait ORDER BY montant desc limit 10";
        String d1 = "";
        res1 = stat.executeQuery(data1);
        while(res1.next()){
                d1 = d1.concat(res1.getString("montant") + ",");
        }
        d1 = d1.substring(0, d1.length() - 1);

        ResultSet res2 = null;
        stat = conn.createStatement();
        String data2 = "SELECT * FROM virement ORDER BY montant desc limit 10";
        String d2 = "";
        res2 = stat.executeQuery(data2);
        while(res2.next()){
                d2 = d2.concat(res2.getString("montant") + ",");
        }
        d2 = d2.substring(0, d2.length() - 1);

        ResultSet res3 = null;
        stat = conn.createStatement();
        String data3 = "SELECT * FROM versement ORDER BY montant asc limit 10";
        String d3 = "";
        res3 = stat.executeQuery(data3);
        while(res3.next()){
                d3 = d3.concat(res3.getString("montant") + ",");
        }
        d3 = d3.substring(0, d3.length() - 1);

        ResultSet res4 = null;
        stat = conn.createStatement();
        String data4 = "SELECT * FROM retrait ORDER BY montant asc limit 10";
        String d4 = "";
        res4 = stat.executeQuery(data4);
        while(res4.next()){
                d4 = d4.concat(res4.getString("montant") + ",");
        }
        d4 = d4.substring(0, d4.length() - 1);

        ResultSet res5 = null;
        stat = conn.createStatement();
        String data5 = "SELECT * FROM virement ORDER BY montant asc limit 10";
        String d5 = "";
        res5 = stat.executeQuery(data5);
        while(res5.next()){
                d5 = d5.concat(res5.getString("montant") + ",");
        }
        d5 = d5.substring(0, d5.length() - 1);

        ResultSet res6 = null;
        stat = conn.createStatement();
        String data6 = "SELECT SUM(montant) as smv FROM versement INNER JOIN client ON versement.cb = client.cb GROUP BY client.cb ORDER BY client.solde desc limit 5";
        String d6 = "";
        res6 = stat.executeQuery(data6);
        while(res6.next()){
                d6 = d6.concat(res6.getString("smv") + ",");
        }
        d6 = d6.substring(0, d6.length() - 1);

        ResultSet res7 = null;
        stat = conn.createStatement();
        String data7 = "SELECT SUM(montant) as smr FROM retrait INNER JOIN client ON retrait.cb = client.cb GROUP BY client.cb ORDER BY solde desc limit 5";
        String d7 = "";
        res7 = stat.executeQuery(data7);
        while(res7.next()){
                d7 = d7.concat(res7.getString("smr") + ",");
        }
        d7 = d7.substring(0, d7.length() - 1);

        ResultSet res8 = null;
        stat = conn.createStatement();
        String data8 = "SELECT SUM(montant) as smvi FROM virement FULL JOIN client ON cbe = cb GROUP BY cb ORDER BY solde desc limit 5";
        String d8 = "";
        res8 = stat.executeQuery(data8);
        while(res8.next()){
                d8 = d8.concat(res8.getString("smvi") + ",");
        }
        d8 = d8.substring(0, d8.length() - 1);

        ResultSet res9 = null;
        stat = conn.createStatement();
        String data9 = "SELECT * FROM client ORDER BY solde desc limit 5";
        String d9 = "";
        res9 = stat.executeQuery(data9);
        %>
        
    
              <div class="clearfix"></div>
    
              <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-12">
                  <div class="x_panel">
                    <div class="x_title">
                      <h2>Montant Maximum |<small>Top 10</small></h2>
                      <ul class="nav navbar-right panel_toolbox">
                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                        </li>
                      </ul>
                      <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                      <canvas id="lC"></canvas>
                    </div>
                  </div>
                </div>
  
                <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="x_panel">
                          <div class="x_title">
                            <h2>Montant Minimum |<small>Top 10</small></h2>
                            <ul class="nav navbar-right panel_toolbox">
                              <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                              </li>
                            </ul>
                            <div class="clearfix"></div>
                          </div>
                          <div class="x_content">
                            <canvas id="lC2"></canvas>
                          </div>
                        </div>
                      </div>
              </div>
              <div class="clearfix"></div>
            <!-- end row -->
            <div class="row">
                    <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="x_panel">
                            <div class="x_title">
                                <h2>État du Client |<small>Possédant le solde maximum</small></h2>
                                <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                </li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <canvas id="bC1"></canvas>
                            </div>
                            </div>
                    </div>
      
                    <div class="col-md-6 col-sm-6 col-xs-12">
                      <div class="x_panel">
                        <div class="x_title">
                          <h2>Détails du Client |<small>Possédant le solde maximum</small></h2>
                          <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                          </ul>
                          <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                          <table>
                              <%
                              int i = 1;
                              while(res9.next()){
                              %>
                              <tr>
                                  <td>C<%=i%> : </td>
                                  <td>&nbsp;<%=res9.getString("cb")%> - </td>
                                  <td>&nbsp;<%=res9.getString("nom")%>  </td>
                                  <td>&nbsp;&nbsp;&nbsp;<%=res9.getString("solde")%></td>
                                  <% i = i + 1; %>
                              </tr>
                              <%}%>
                          </table>
                        </div>
                      </div>
                    </div>
                  </div>
        </div>
    
        </div>
    </div>
    
    
    <jsp:include page="../include/footer.jsp" />
    <script>
    var f=document.getElementById("lC");new Chart(f,{type:"line",data:{labels:["1","2","3","4","5","6","7","8","9","10"],datasets:[{label:"Versement",backgroundColor:"rgba(38, 185, 154, 0.31)",borderColor:"rgba(38, 185, 154, 0.7)",pointBorderColor:"rgba(38, 185, 154, 0.7)",pointBackgroundColor:"rgba(38, 185, 154, 0.7)",pointHoverBackgroundColor:"#fff",pointHoverBorderColor:"rgba(220,220,220,1)",pointBorderWidth:1,data:[<%= d0 %>]},{label:"Retrait",backgroundColor:"rgba(3, 88, 106, 0.3)",borderColor:"rgba(3, 88, 106, 0.70)",pointBorderColor:"rgba(3, 88, 106, 0.70)",pointBackgroundColor:"rgba(3, 88, 106, 0.70)",pointHoverBackgroundColor:"#fff",pointHoverBorderColor:"rgba(151,187,205,1)",pointBorderWidth:1,data:[<%= d1 %>]},{label:"Virement",backgroundColor:"rgba(23, 45, 68, 0.3)",borderColor:"rgba(0, 0, 0, 0.70)",pointBorderColor:"rgba(0, 0, 0, 0.70)",pointBackgroundColor:"rgba(0, 0, 0, 0.70)",pointHoverBackgroundColor:"#fff",pointHoverBorderColor:"rgba(151,187,205,1)",pointBorderWidth:1,data:[<%= d2 %>]}]}});

    var f2=document.getElementById("lC2");new Chart(f2,{type:"line",data:{labels:["1","2","3","4","5","6","7","8","9","10"],datasets:[{label:"Versement",backgroundColor:"rgba(38, 185, 154, 0.31)",borderColor:"rgba(38, 185, 154, 0.7)",pointBorderColor:"rgba(38, 185, 154, 0.7)",pointBackgroundColor:"rgba(38, 185, 154, 0.7)",pointHoverBackgroundColor:"#fff",pointHoverBorderColor:"rgba(220,220,220,1)",pointBorderWidth:1,data:[<%= d3 %>]},{label:"Retrait",backgroundColor:"rgba(3, 88, 106, 0.3)",borderColor:"rgba(3, 88, 106, 0.70)",pointBorderColor:"rgba(3, 88, 106, 0.70)",pointBackgroundColor:"rgba(3, 88, 106, 0.70)",pointHoverBackgroundColor:"#fff",pointHoverBorderColor:"rgba(151,187,205,1)",pointBorderWidth:1,data:[<%= d4 %>]},{label:"Virement",backgroundColor:"rgba(23, 45, 68, 0.3)",borderColor:"rgba(0, 0, 0, 0.70)",pointBorderColor:"rgba(0, 0, 0, 0.70)",pointBackgroundColor:"rgba(0, 0, 0, 0.70)",pointHoverBackgroundColor:"#fff",pointHoverBorderColor:"rgba(151,187,205,1)",pointBorderWidth:1,data:[<%= d5 %>]}]}});

    var b=document.getElementById("bC1");new Chart(b,{type:"bar",data:{labels:["C1", "C2", "C3", "C4", "C5"],datasets:[{label:"Versement",backgroundColor:"#26B99A",data:[<%= d6 %>]},{label:"Retrait",backgroundColor:"#03586A",data:[<%= d7 %>]},{label:"Virement",backgroundColor:"rgba(0, 0, 0, 0.70)",data:[<%= d8 %>]}]},options:{scales:{yAxes:[{ticks:{beginAtZero:!0}}]}}});

    if($("#pieChart").length){var f=document.getElementById("pieChart"),i={datasets:[{data:[120,50,140,180,100],backgroundColor:["#455C73","#9B59B6","#BDC3C7","#26B99A","#3498DB"],label:"My dataset"}],labels:["Dark Gray","Purple","Gray","Green","Blue"]};new Chart(f,{data:i,type:"pie",otpions:{legend:!1}})}
    </script>