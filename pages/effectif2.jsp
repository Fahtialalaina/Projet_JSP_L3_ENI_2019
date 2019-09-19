<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ include file="../include/inc.jsp" %>
<jsp:include page="../include/header.jsp" />
<title>Effectifs | Gestion des Prets Bancaire</title>
<jsp:include page="../include/menu.jsp" />
<%@ include file="../include/connex.jsp" %>


<div class="right_col" role="main">
        <div class="">
          <div class="page-title">
            <div class="title_left">
              <h3>Effectifs | <small>Gestion des Prets Bancaire</small></h3>
            </div>
          </div>

          <%
          stat = conn.createStatement();
          String data = "SELECT DISTINCT(NomBanque) as nom, TauxBanque FROM banque ORDER BY NumBanque DESC";
          %>

<div class="clearfix"></div>

<div class="row">
  <div class="col-md-12 col-sm-12 col-xs-12">
    
      <div class="x_content">
        <table id="datatable" class="table table-striped table-bordered">
            <thead>
                <tr>
                <th>Dessign</th>
                <th>Taux</th>
                <th>EFFECTIFE</th>
                <th>Montant</th>
                <th>Montant A Payer</th>
                </tr>
                </thead>
                <tbody>
                <%
                
                String datappp = "";
                stat5 = conn5.createStatement();
                
                res = stat.executeQuery(data);
                while(res.next()){
                
                    datappp = "SELECT COUNT(cincand) as EFFECTIFE, SUM(Montant) as Montant,SUM(MontantAPayer) as MontantAPayer  FROM `pret` WHERE NomBq ='"+res.getString("nom")+"'";
                    res5 = stat5.executeQuery(datappp);
                   
                    while(res5.next()){
                
                        %>
                        <tr>
                        <td><%=res.getString("nom")%></td>
                        <td><%=res.getString("TauxBanque")%> % </td>
                        <td><%=res5.getString("EFFECTIFE")%></td>
                        <td><%=res5.getString("Montant")%></td>
                        <td><%=res5.getString("MontantAPayer")%></td>
                        </tr>
                        <%
                
                    }
                }
                %>
                </tbody>
</table>
</div>
</div>
</div>
</div>

</div>
</div>


<jsp:include page="../include/footer.jsp" />
<script type="text/javascript" language="javascript" >
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
					filename: 'Effectifs',
					orientation: 'portrait',
					pageSize: 'A4', //A3 , A5 , A6 , legal , letter
					exportOptions: {
						columns: [ 0, 1, 2, 3, 4 ],
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
										text: 'Effectifs | Gestion des Prets Bancaire'
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
   var createdAt = data[3] || 0;

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
</script>