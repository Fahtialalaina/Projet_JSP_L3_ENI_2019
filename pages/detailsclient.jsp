<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ include file="../include/inc.jsp" %>
<jsp:include page="../include/header.jsp" />
<title>Détails du Client | Gestion Bancaire</title>
<jsp:include page="../include/menu.jsp" />
<%@ include file="../include/connex.jsp" %>

<div class="right_col" role="main">
        <div class="">
          <div class="page-title">
            <div class="title_left">
              <h3>Détails du Client | <small>Gestion Bancaire</small></h3>
            </div>
    
            <div class="title_right">
                
                    <div class="col-md-3 col-sm-3 col-xs-12 form-group pull-right">
                            <div class="input-group">
                                <button type="button" class="btn btn-default btn-sm btnrefresh" id="btnclear"><i class="fa fa-refresh" aria-hidden="true"></i> Actualiser</button>
                          </div>
                          
                    </div>

                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right">
                            <%
                            ResultSet res0 = null;
                            stat = conn.createStatement();
                            String data0 = "SELECT * FROM client";
                            res0 = stat.executeQuery(data0);
                            %>
                            <select class="form-control form-control-sm col-md-7 col-xs-12">
                                    <option value="">-- Choisissez un client --</option>
                                    <%
                                    while(res0.next()){
                                    %>
                                    <option value='detailsclient.jsp?m=<%=res0.getString("cb")%>'>
                                        <%= res0.getString("nom") %>
                                    </option>
                                    <%
                                    }
                                    %>
                            </select>
                  
                </div>    
              </div>
              
          </div>
          
        <!-- page content -->
        <%
        stat = conn.createStatement();
        String m = "";
        m = request.getParameter("m");
        %>
    
              <div class="clearfix"></div>
    
              <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                  <div class="x_panel">
                    <div class="x_title">
                      <h2>Tous les versements et les retraits</h2>
                      <div class="clearfix"></div>
                    </div>
                    <div class="title_left">
                            <div class="col-md-4 pull-left">
                                    <%
                                    ResultSet res5 = null;
                                    String data5 = "";
                                      data5 = "SELECT * FROM client WHERE cb = '" + m + "'";
                                    res5 = stat.executeQuery(data5);
                                    while(res5.next()){
                                    %>
                                
                                <label>N°Compte Bancaire :</label> <%=res5.getString("cb")%>
                                <br/>
                                <label>Nom Complet :</label> <%=res5.getString("nom")%>
                                <br/>
                                <label>Adresse :</label> <%=res5.getString("adresse")%>
                                <br/>
                                <label>N°Téléphone :</label> <%=res5.getString("phone")%>
                                <br/>
                                <label>Solde Actuel :</label> <%=res5.getString("solde")%>
                                <br/>
                                <label>Début du Compte :</label> <%=res5.getString("debut")%>
                                <br/>
                                <%
                                  }
                                %>
                              </div>
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
                                        <th>Date</th>
                                        <th>Type</th>
                                        <th>N°Operation</th>
                                        <th>N°Compte Bancaire</th>
                                        <th>Montant</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                    String data9 = "";
                                    if(m != null){
                                        data9 = "select type, nve as no, cb, montant, date from versement where cb = '" + m + "' union select type, nr as no, cb, montant, date from retrait where cb = '" + m + "'";
                                    }
                                    else {
                                        data9 = "select type, nve as no, cb, montant, date from versement union select type, nr as no, cb, montant, date from retrait";
                                    }
                                    res = stat.executeQuery(data9);
                                    while(res.next()){
                                    %>
                                    <tr>
                                        <td><%=res.getString("date")%></td>
                                        <td><%=res.getString("type")%></td>
                                        <td><%=res.getString("no")%></td>
                                        <td><%=res.getString("cb")%></td>
                                        <td><%=res.getString("montant")%></td>
                                    </tr>
                                    <%
                                    }
                                    %>
                                </tbody>
                            </table>
                    </div>
                </div>
            </div>

            <!-- page content -->
    
            <div class="clearfix"></div>
    
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Tous les virements</h2>
                    <div class="clearfix"></div>
                  </div>
                </div>
                  <div class="x_content">
                    <table id="datatable2" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                                <th>Date du Virement</th>
                                <th>N°Virement</th>
                                <th>N°Compte Émetteur</th>
                                <th>Nom d'Émetteur</th>
                                <th>N°Compte Récepteur</th>
                                <th>Nom du Récepteur</th>
                                <th>Montant Viré</th>
                                  </tr>
                              </thead>
                              <tbody>
                                  <%
                                  ResultSet res2 = null;
                                  String data2 = "";
                                  if(m != null){
                                    data2 = "SELECT * FROM virement INNER JOIN client ON cbe = cb WHERE cbe = '" + m + "' OR cbr = '" + m + "'";
                                  }
                                  else{
                                    data2 = "SELECT * FROM virement INNER JOIN client ON cbe = cb";
                                  }
                                  res2 = stat.executeQuery(data2);
                                  while(res2.next()){
                                  %>
                                  <tr>
                                        <td><%=res2.getString("date")%></td>
                                        <td><%=res2.getString("nvi")%></td>
                                        <td><%=res2.getString("cbe")%></td>
                                        <td><%=res2.getString("nom")%></td>
                                        <td><%=res2.getString("cbr")%></td>
                                        <td><%=res2.getString("nomr")%></td>
                                        <td><%=res2.getString("montant")%></td>
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
    $('select').change(function(){
        var url = $(this).val();
        window.location = url;
    });

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
                    filename: 'versement_retrait',
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
                                        text: 'Versement et Retrait | Gestion Bancaire'
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

    table2 = $('#datatable2').DataTable({
    "order": [[ 0, "desc" ]],
    "dom": 'flBrtip',
            "buttons": [
                {
                    text: '<i class="fa fa-print" aria-hidden="true"></i> Imprimer',
                    extend: 'pdfHtml5',
                    filename: 'virement',
                    orientation: 'portrait',
                    pageSize: 'A4', //A3 , A5 , A6 , legal , letter
                    exportOptions: {
                        columns: [ 0, 1, 2, 3, 4, 5, 6 ],
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
                                        text: 'Virement | Gestion Bancaire'
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
    var createdAt = data[0] || 0;

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
    table2.draw();
    });

    $('#my-table_filter').hide();

    $('.input-daterange input').each(function() {
    $(this).datepicker('clearDates');
    });

    $('#btnclear').click(function(){
    $('input[type="text"]').val('');
    table2.draw();
    table.draw();
    });
</script>