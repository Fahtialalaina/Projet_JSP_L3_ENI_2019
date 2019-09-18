<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ include file="../include/inc.jsp" %>
<jsp:include page="../include/header.jsp" />
<title>Liste des Clients | Gestion des Prets Bancaire</title>
<jsp:include page="../include/menu.jsp" />
<%@ include file="../include/connex.jsp" %>






<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
<!-- Content Header (Page header) -->
<section class="content-header">
<div class="container-fluid">
<div class="row mb-2">
<div class="col-sm-6">
<h1>Liste des Clients | <small>Gestion des Prets Bancaire</h1>
</div>
<!-- <div class="col-sm-6">
<ol class="breadcrumb float-sm-right">
<li class="breadcrumb-item"><a href="#">Home</a></li>
<li class="breadcrumb-item active">DataTables</li>
</ol>
</div> -->
</div>
<a href='../crud/ajoutclient.jsp'><button type="button" class="btn btn-primary btn-sm"><i class="fa fa-plus" aria-hidden="true"></i> Ajouter</button></a>
<a href='../pages/listeclient.jsp'></a><button type="button" class="btn btn-default btn-sm" id="btnclear"><i class="fa fa-refresh" aria-hidden="true"></i> Actualiser</button></a>
<div class="title_right">
<div class="col-md-4 col-sm-4 col-xs-12 form-group pull-right top_search">
<!-- /.container-fluid -->


</section>
<!-- /.content-header -->



<!-- Main content -->
<section class="content">





<div class="row">
<div class="col-12">
<div class="card">
<div class="card-header">
<h3 class="card-title">DataTable</h3>
</div>

<%
stat = conn.createStatement();
String data = "SELECT * FROM client_table ORDER BY cin DESC";
%>


<!-- /.card-header -->
<div class="card-body">
<table id="example1" class="table table-bordered table-striped">
<thead>
<tr>
<th>N° Client</th>
<th>Nom</th>
<th>N° Téléphone</th>
<th>Date de Naissance</th>
<th>Sexe</th>
<th>Adresse</th>
<th style="text-align: center;">Actions</th>
</tr>
</thead>
<tbody>
<%
res = stat.executeQuery(data);
while(res.next()){
%>
<tr>
<td><%=res.getString("cin")%></td>
<td><%=res.getString("nomc")%></td>
<td><%=res.getString("gsm")%></td>
<td><%=res.getString("date_naissance")%></td>
<td><%=res.getString("sexe")%></td> 
<td><%=res.getString("adresse")%></td>
<td style="text-align: center;">
<a href='../crud/modifieclient.jsp?u=<%=res.getString("idc")%>'><button type="button" class="btn btn-success btn-xs"><i class="fa fa-edit" aria-hidden="true"></i> Modifier</button></a>
<a href='../crud/supclient.jsp?d=<%=res.getString("idc")%>'><button type="button" class="btn btn-dark btn-xs"><i class="fa fa-trash" aria-hidden="true"></i> Supprimer</button></a>
</td>
</tr>
<%
}
%>
</tbody>
<!-- <tfoot>
<tr>
<th>N° Client</th>
<th>Browser</th>
<th>Platform(s)</th>
<th>Engine version</th>
<th>CSS grade</th>
</tr>
</tfoot> -->
</table>
</div>
<!-- /.card-body -->
</div>
<!-- /.card -->
</div>
<!-- /.col -->
</div>
<!-- /.row -->




</section>
<!-- /.content -->



</div>



<!-- /.content-wrapper -->


<jsp:include page="../include/footer.jsp" />
<!-- <script type="text/javascript" language="javascript" >
$('.input-daterange').datepicker({
todayBtn:'linked',
format: "yyyy-mm-dd",
autoclose: true
});

table = $('#datatable').DataTable({
"order": [[ 0, "desc" ]],
"dom": 'flBrtip',
"buttons": [
{
text: '<i class="fa fa-print" aria-hidden="true"></i> Imprimer',
extend: 'pdfHtml5',
filename: 'liste_clients',
orientation: 'portrait',
pageSize: 'A4', //A3 , A5 , A6 , legal , letter
exportOptions: {
columns: [ 0, 1, 2, 3, 4, 5 ],
search: 'applied',
order: 'applied'
},
customize: function (doc) {
doc.content.splice(0,1);
var now = new Date();
var jsDate = now.getDate()+'-'+(now.getMonth()+1)+'-'+now.getFullYear();
doc.pageMargins = [20,60,20,30];
doc.defaultStyle.fontSize = 11;
doc.styles.tableHeader.fontSize = 11;
doc['header']=(function() {
return {
columns: [
{
alignment: 'center',
fontSize: 14,
text: 'Liste de Clients | Gestion Bancaire'
}
],
margin: 20
}
});
doc['footer']=(function(page, pages) {
return {
columns: [
{
alignment: 'left',
text: ['Imprimé en: ', { text: jsDate.toString() }]
},
{
alignment: 'right',
text: ['page ', { text: page.toString() },	' sur ',	{ text: pages.toString() }]
}
],
margin: 20
}
});
var objLayout = {};
objLayout['hLineWidth'] = function(i) { return .5; };
objLayout['vLineWidth'] = function(i) { return .5; };
objLayout['hLineColor'] = function(i) { return '#aaa'; };
objLayout['vLineColor'] = function(i) { return '#aaa'; };
objLayout['paddingLeft'] = function(i) { return 4; };
objLayout['paddingRight'] = function(i) { return 4; };
doc.content[0].layout = objLayout;
}
}]
});

$.fn.dataTable.ext.search.push(
function(settings, data, dataIndex) {
var min = $('#min-date').val();
var max = $('#max-date').val();
var createdAt = data[5] || 0;

if (
(min == "" || max == "") ||
(moment(createdAt).isSameOrAfter(min) && moment(createdAt).isSameOrBefore(max))
) {
return true;
}
return false;
}
);


$('.date-range-filter').change(function() {
table.draw();
});

$('#my-table_filter').hide();

$('.input-daterange input').each(function() {
$(this).datepicker('clearDates');
});

$('#btnclear').click(function(){
$('input[type="text"]').val('');
table.draw();
});
</script> -->




