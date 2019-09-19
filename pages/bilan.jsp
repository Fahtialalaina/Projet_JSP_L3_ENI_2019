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
String data0 = "SELECT * FROM pret ORDER BY datePret desc limit 10";
String d0 = "";
String d0000 = "";
res0 = stat.executeQuery(data0);
while(res0.next()){
d0 = d0.concat(res0.getString("Montant") + ",");
d0000 = d0000.concat( "'" + res0.getString("datePret") + "' ,");
}
d0 = d0.substring(0, d0.length() - 1);
d0000 = d0000.substring(0, d0000.length() - 1);

ResultSet res1 = null;
stat = conn.createStatement();
String data1 = "SELECT * FROM banque ORDER BY TauxBanque desc limit 10";
String d1 = "";
res1 = stat.executeQuery(data1);
while(res1.next()){
d1 = d1.concat(res1.getString("TauxBanque") + ",");
}
d1 = d1.substring(0, d1.length() - 1);

stat = conn.createStatement();
String data2 = "SELECT DISTINCT(NomBanque) as nom FROM banque ORDER BY NumBanque DESC";
String d2 = "";
String d5 = "";
res2 = stat.executeQuery(data2);
while(res2.next()){

stat = conn.createStatement();
String data5 = "SELECT SUM(MontantAPayer) as MontantAPayer  FROM `pret` WHERE NomBq ='"+res2.getString("nom")+"'";

res5 = stat.executeQuery(data5);
while(res5.next()){
d5 = d5.concat( res5.getString("MontantAPayer") + ",");

}
d5 = d5.substring(0, d5.length() - 1);

d2 = d2.concat("'" + res2.getString("nom") + "',");
}
d2 = d2.substring(0, d2.length() - 1);


stat = conn.createStatement();
String data3 = "SELECT MontantAPayer FROM pret ORDER BY NomBq asc limit 10";
String d3 = "";
res7 = stat.executeQuery(data3);
while(res7.next()){
d3 = d3.concat(res7.getString("MontantAPayer") + ",");
}
d3 = d3.substring(0, d3.length() - 1);

ResultSet res4 = null;
stat = conn.createStatement();
String data4 = "SELECT * FROM banque ORDER BY TauxBanque asc limit 10";
String d4 = "";
res4 = stat.executeQuery(data4);
while(res4.next()){
d4 = d4.concat(  res4.getString("TauxBanque") + ",");
}
d4 = d4.substring(0, d4.length() - 1);


ResultSet res6 = null;
stat = conn.createStatement();
String data6 = "SELECT DISTINCT(NomBanque) as nom, TauxBanque FROM banque ORDER BY TauxBanque DESC ";
String d6 = "";
String d999 = "";
res6 = stat.executeQuery(data6);
while(res6.next()){
d6 = d6.concat("'" + res6.getString("nom") + "' ,");
d999 = d999.concat( res6.getString("TauxBanque") + " ,");
}
d6 = d6.substring(0, d6.length() - 1);
d999 = d999.substring(0, d999.length() - 1);


ResultSet res333 = null;
stat = conn.createStatement();
String data44 = "SELECT DISTINCT(cincand) as id FROM pret ORDER BY cincand DESC";
String d44 = "";
String d55 = "";
res15 = stat.executeQuery(data44);

%>


<div class="clearfix"></div>

<div class="row">
<div class="col-md-6 col-sm-6 col-xs-12">
<div class="x_panel">
<div class="x_title">
<h2>Effectif Prets Clients |<small> Dans 10 dernier jour</small></h2>
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
<h2>Montant a Payer |<small>par Banque</small></h2>
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
<h2>Taux Par Banque|<small>Possédant taux maximum</small></h2>
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
<h2>Liste de Client |<small>effecuant le Pret</small></h2>
<ul class="nav navbar-right panel_toolbox">
<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
</li>
</ul>
<div class="clearfix"></div>
</div>
<div class="x_content">
<div class="card-body table-responsive p-0">
<table class="table table-hover">
<thead>
<tr>
<th>N° Client</th>
<th>Nom</th>
<th>Adresse</th>
<th>Contat</th>
</tr>
</thead>
<tbody>
<%
while(res15.next()){

stat = conn.createStatement();
String data55 = "SELECT * FROM `client_table` WHERE idc ='"+res15.getString("id")+"' ORDER BY cin DESC ";

res16 = stat.executeQuery(data55);
while(res16.next()){

%>
<tr>
<td> <%= res16.getString("cin") %> </td>
<td> <%=res16.getString("nomc")%> </td>
<td> <%=res16.getString("adresse")%>  </td>
<td> <%=res16.getString("gsm")%> </td>
</tr>
<% 
}
}%>


</tbody>
</table>
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
var f=document.getElementById("lC");new Chart(f,{type:"line",data:{labels:[ <%= d0000 %> ],datasets:[{label:"Statique pret",backgroundColor:"rgba(38, 185, 154, 0.31)",borderColor:"rgba(38, 185, 154, 0.7)",pointBorderColor:"rgba(38, 185, 154, 0.7)",pointBackgroundColor:"rgba(38, 185, 154, 0.7)",pointHoverBackgroundColor:"#fff",pointHoverBorderColor:"rgba(220,220,220,1)",pointBorderWidth:1,data:[<%= d0 %>]},{label:"Banque",backgroundColor:"rgba(23, 45, 68, 0.3)",borderColor:"rgba(0, 0, 0, 0.70)",pointBorderColor:"rgba(0, 0, 0, 0.70)",pointBackgroundColor:"rgba(0, 0, 0, 0.70)",pointHoverBackgroundColor:"#fff",pointHoverBorderColor:"rgba(151,187,205,1)",pointBorderWidth:1,data:[<%= d1 %>]}]}});

var f2=document.getElementById("lC2");new Chart(f2,{type:"line",data:{labels:[ <%= d2 %> ],datasets:[ {label:"Montant a payer",backgroundColor:"rgba(23, 45, 68, 0.3)",borderColor:"rgba(0, 0, 0, 0.70)",pointBorderColor:"rgba(0, 0, 0, 0.70)",pointBackgroundColor:"rgba(0, 0, 0, 0.70)",pointHoverBackgroundColor:"#fff",pointHoverBorderColor:"rgba(151,187,205,1)",pointBorderWidth:1,data:[<%= d4 %>]}]}});

var b=document.getElementById("bC1");new Chart(b,{type:"bar",data:{labels:[ <%= d6 %> ],datasets:[{label:"Taux (en %)",backgroundColor:"#26B99A",data:[ <%=d999%> ]} ]},options:{scales:{yAxes:[{ticks:{beginAtZero:!0}}]}}});

if($("#pieChart").length){var f=document.getElementById("pieChart"),i={datasets:[{data:[120,50,140,180,100],backgroundColor:["#455C73","#9B59B6","#BDC3C7","#26B99A","#3498DB"],label:"My dataset"}],labels:["Dark Gray","Purple","Gray","Green","Blue"]};new Chart(f,{data:i,type:"pie",otpions:{legend:!1}})}
</script>