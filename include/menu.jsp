<%@page contentType="text/html" pageEncoding="UTF-8" %>
</head>

<body class="nav-md">
  <div class="container body">
    <div class="main_container">
      <div class="col-md-3 left_col">
        <div class="left_col scroll-view">
          <div class="navbar nav_title" style="border: 0;">
            <a href="index.html" class="site_title"><i class="fa fa-bank"></i> <span>Gestion Bancaire</span></a>
          </div>

          <div class="clearfix"></div>

          <br />

          <!-- sidebar menu -->
          <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
            <div class="menu_section">
              <ul class="nav side-menu">
                <li><a href="../pages/homepage.jsp"><i class="fa fa-home"></i> Accueil </a></li>
                <li><a><i class="fa fa-users"></i> Clients <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu">
                    <li><a href="../pages/listeclient.jsp">Liste de clients</a></li>
                    <li><a href="../pages/detailsclient.jsp">Détails de clients</a></li> 
                  </ul>
                </li>
                <li><a href="../pages/listbanque.jsp"><i class="fa fa-home"></i> Banque </a></li>  
                <li><a href="../pages/listepret.jsp"><i class="fa fa-home"></i> Pret </a></li>  
                <li><a><i class="fa fa-retweet"></i> Opérations <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu">
                    <li><a href="../pages/versement.jsp">Versement</a></li>
                    <li><a href="../pages/retrait.jsp">Retrait</a></li>
                    <li><a href="../pages/virement.jsp">Virement</a></li>
                  </ul>
                </li>
                <li><a><i class="fa fa-bar-chart-o"></i> Mouvement Bancaire <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu">
                    <li><a href="../pages/mvtbancaire.jsp">Tous les opérations</a></li>
                    <li><a href="../pages/bilan.jsp">Bilan</a></li>
                  </ul>
                </li>
              </ul>
            </div>
          </div>
          <!-- /sidebar menu -->

          <!-- /menu footer buttons -->
          <div class="sidebar-footer hidden-small">
            <a data-toggle="tooltip" data-placement="top" title="Utilisateur">
              <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="Paramètres">
              <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="À Propos">
              <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="Déconnexion" href="../index.jsp">
              <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
            </a>
          </div>
          <!-- /menu footer buttons -->
        </div>
      </div>

      <!-- top navigation -->
      <div class="top_nav">
        <div class="nav_menu">
          <nav>
            <div class="nav toggle">
              <a id="menu_toggle"><i class="fa fa-bars"></i></a>
            </div>
          </nav>
        </div>
      </div>
      <!-- /top navigation -->