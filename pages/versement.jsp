<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ include file="../include/inc.jsp" %>
<jsp:include page="../include/header.jsp" />
<title>Versement | Gestion Bancaire</title>
<jsp:include page="../include/menu.jsp" />
<%@ include file="../include/connex.jsp" %>

<div class="right_col" role="main">
        <div class="">
          <div class="page-title">
            <div class="title_left">
              <h3>Versement | <small>Gestion Bancaire</small></h3>
            </div>
    
            <div class="title_right">
                <div class="col-md-4 col-sm-4 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                      <a href='../crud/ajoutvers.jsp'><button type="button" class="btn btn-primary btn-sm"><i class="fa fa-plus" aria-hidden="true"></i> Ajouter</button></a>
                      <button type="button" class="btn btn-default btn-sm" id="btnclear"><i class="fa fa-refresh" aria-hidden="true"></i> Actualiser</button>
                  </div>
                </div>
              </div>
          </div>
          <%
          stat = conn.createStatement();
          String data = "SELECT * FROM versement INNER JOIN client ON versement.cb = client.cb ORDER BY idve DESC";
            %>
    
        <!-- page content -->
    
              <div class="clearfix"></div>
    
              <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                  <div class="x_panel">
                    <div class="x_title">
                      <h2>Tableaux de données</h2>
                      <div class="clearfix"></div>
                    </div>
                    
                      <div class="title_right">
                        <div class="col-md-4 pull-right">
                            <div class="input-group input-daterange">
                        
                              <input autocomplete="off" type="text" id="min-date" class="form-control date-range-filter" data-date-format="yyyy-mm-dd" placeholder="Date de début">
                        
                              <div class="input-group-addon"><i class="fa fa-calendar" aria-hidden="true"></i></div>
                        
                              <input autocomplete="off" type="text" id="max-date" class="form-control date-range-filter" data-date-format="yyyy-mm-dd" placeholder="Date de fin">
                        
                            </div>
                          </div>
                      </div>
                  </div>
                    <div class="x_content">
                      <table id="datatable" class="table table-striped table-bordered">
                        <thead>
                          <tr>
                                        <th>N°Versement</th>
                                        <th>N°Compte Bancaire</th>
                                        <th>Nom Complet</th>
                                        <th>Montant Versé</th>
                                        <th>Solde Actuel</th>
                                        <th>Date du Versement</th>
                                        <th style="text-align: center;">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                    res = stat.executeQuery(data);
                                    while(res.next()){
                                    %>
                                    <tr>
                                        <td><%=res.getString("nve")%></td>
                                        <td><%=res.getString("versement.cb")%></td>
                                        <td><%=res.getString("nom")%></td>
                                        <td><%=res.getString("montant")%></td>
                                        <td><%=res.getString("solde")%></td>
                                        <td><%=res.getString("date")%></td>
                                        <td style="text-align: center;">
                                            <a href='../crud/modifievers.jsp?u=<%=res.getString("idve")%>'><button type="button" class="btn btn-success btn-xs"><i class="fa fa-edit" aria-hidden="true"></i> Modifier</button></a>
                                            <a href='../crud/supvers.jsp?d=<%=res.getString("idve")%>'><button type="button" class="btn btn-dark btn-xs"><i class="fa fa-trash" aria-hidden="true"></i> Supprimer</button></a>
                                        </td>
                                    </tr>
                                    <%
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
                        filename: 'versement',
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
                                            text: 'Versement | Gestion Bancaire'
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
    </script>