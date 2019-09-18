<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ include file="../include/inc.jsp" %>
<jsp:include page="../include/header.jsp" />
<title>Accueil | Gestion Bancaire</title>
<jsp:include page="../include/menu.jsp" />
<%@ include file="../include/connex.jsp" %>

<div class="right_col" role="main">
        <div class="">
          <div class="page-title">
            <div class="title_left">
              <h3>Accueil | <small>Gestion Bancaire</small></h3>
            </div>
          </div>
    
        <!-- page content -->
        <%
        ResultSet res0 = null;
        stat = conn.createStatement();
        String data0 = "SELECT * FROM client_table ORDER BY date desc limit 10";
        String d0 = "";
        res0 = stat.executeQuery(data0);
        while(res0.next()){
                d0 = d0.concat(res0.getString("montant") + ",");
        }
        d0 = d0.substring(0, d0.length() - 1);

        ResultSet res1 = null;
        stat = conn.createStatement();
        String data1 = "SELECT * FROM retrait ORDER BY date desc limit 10";
        String d1 = "";
        res1 = stat.executeQuery(data1);
        while(res1.next()){
                d1 = d1.concat(res1.getString("montant") + ",");
        }
        d1 = d1.substring(0, d1.length() - 1);

        ResultSet res2 = null;
        stat = conn.createStatement();
        String data2 = "SELECT * FROM virement ORDER BY date desc limit 10";
        String d2 = "";
        res2 = stat.executeQuery(data2);
        while(res2.next()){
                d2 = d2.concat(res2.getString("montant") + ",");
        }
        d2 = d2.substring(0, d2.length() - 1);

        ResultSet res3 = null;
        stat = conn.createStatement();
        String data3 = "SELECT SUM(montant) as smve FROM versement";
        String d3 = "";
        res3 = stat.executeQuery(data3);
        while(res3.next()){
                d3 = res3.getString("smve");
        }

        ResultSet res4 = null;
        stat = conn.createStatement();
        String data4 = "SELECT SUM(montant) as smr FROM retrait";
        String d4 = "";
        res4 = stat.executeQuery(data4);
        while(res4.next()){
            d4 = res4.getString("smr");
        }

        ResultSet res5 = null;
        stat = conn.createStatement();
        String data5 = "SELECT SUM(montant) as smvi FROM virement";
        String d5 = "";
        res5 = stat.executeQuery(data5);
        while(res5.next()){
            d5 = res5.getString("smvi");
        }

        ResultSet res6 = null;
        stat = conn.createStatement();
        String data6 = "SELECT SUM(montant) as smve2 FROM versement GROUP BY date ORDER BY date DESC LIMIT 7";
        int d6 = 0;
        res6 = stat.executeQuery(data6);
        while(res6.next()){
                d6 = d6 + res6.getInt("smve2");
        }

        double pve = ((d6*100)/Integer.parseInt(d3));

        ResultSet res7 = null;
        stat = conn.createStatement();
        String data7 = "SELECT SUM(montant) as smr2 FROM retrait GROUP BY date ORDER BY date DESC LIMIT 7";
        int d7 = 0;
        res7 = stat.executeQuery(data7);
        while(res7.next()){
                d7 = d7 + res7.getInt("smr2");
        }

        double pr = ((d7*100)/Integer.parseInt(d4));

        ResultSet res8 = null;
        stat = conn.createStatement();
        String data8 = "SELECT SUM(montant) as smvi2 FROM virement GROUP BY date ORDER BY date DESC LIMIT 7";
        int d8 = 0;
        res8 = stat.executeQuery(data8);
        while(res8.next()){
                d8 = d8 + res8.getInt("smvi2");
        }

        double pvi = ((d8*100)/Integer.parseInt(d5));

        ResultSet res9 = null;
        stat = conn.createStatement();
        String data9 = "SELECT * FROM client";
        int nbcli = 0;
        res9 = stat.executeQuery(data9);
        while(res9.next()){
            nbcli = nbcli + 1;
        }

        ResultSet res10 = null;
        stat = conn.createStatement();
        String data10 = "SELECT * FROM client ORDER BY debut DESC LIMIT 7";
        int d10 = 0;
        res10 = stat.executeQuery(data10);
        while(res10.next()){
                d10 = d10 + 1;
        }

        double pcli = ((d10*100)/nbcli);
        %>
        
    
              <div class="clearfix"></div>
    
              <!-- top tiles -->
          <div class="row tile_count">
            <div class="col-md-3 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> Total de Clients</span>
              <div class="count"><%=nbcli%></div>
              <span class="count_bottom"><i class="green"><%=pcli%>% </i> De la semaine dernière</span>
            </div>
            <div class="col-md-3 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-money"></i> Montant total de Versements</span>
              <div class="count green"><%=d3%></div>
              <span class="count_bottom"><i class="green"><%=pve%>% </i> De la semaine dernière</span>
            </div>
            <div class="col-md-3 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-money"></i> Montant total de Retraits</span>
              <div class="count"><%=d4%></div>
              <span class="count_bottom"><i class="red"><%=pr%>% </i> De la semaine dernière</span>
            </div>
            <div class="col-md-3 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-money"></i> Montant total de Virements</span>
              <div class="count"><%=d5%></div>
              <span class="count_bottom"><i class="green"><%=pvi%>% </i> De la semaine dernière</span>
            </div>
          </div>
          <!-- /top tiles -->

          <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="dashboard_graph">

                <div class="row x_title">
                  <div class="col-md-6">
                    <h3>Activités <small>Gestion Bancaire</small></h3>
                  </div>
                  <div class="col-md-6">
                    <div id="reportrange" class="pull-right" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc">
                      <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                      <span>December 30, 2014 - January 28, 2015</span> <b class="caret"></b>
                    </div>
                  </div>
                </div>

                <div class="col-md-9 col-sm-9 col-xs-12">
                  <canvas id="lC"></canvas>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-12 bg-white">
                  <div class="x_title">
                    <h2>Performance de Campagne</h2>
                    <div class="clearfix"></div>
                  </div>

                  <div class="col-md-12 col-sm-12 col-xs-6">
                    <div>
                      <p>Campagne Facebook</p>
                      <div class="">
                        <div class="progress progress_sm" style="width: 76%;">
                          <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="80"></div>
                        </div>
                      </div>
                    </div>
                    <div>
                      <p>Campagne Google+</p>
                      <div class="">
                        <div class="progress progress_sm" style="width: 76%;">
                          <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="60"></div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-12 col-sm-12 col-xs-6">
                    <div>
                      <p>Campagne Twitter</p>
                      <div class="">
                        <div class="progress progress_sm" style="width: 76%;">
                          <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="40"></div>
                        </div>
                      </div>
                    </div>
                    <div>
                      <p>YouTube</p>
                      <div class="">
                        <div class="progress progress_sm" style="width: 76%;">
                          <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="50"></div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-12 col-sm-12 col-xs-6">
                    <div>
                      <p>Médias conventionnels</p>
                      <div class="">
                        <div class="progress progress_sm" style="width: 76%;">
                          <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="40"></div>
                        </div>
                      </div>
                    </div>
                    <div>
                      <p>Panneaux d'affichage</p>
                      <div class="">
                        <div class="progress progress_sm" style="width: 76%;">
                          <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="50"></div>
                        </div>
                      </div>
                    </div>
                  </div>

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
    </script>