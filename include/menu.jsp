


<%@page contentType="text/html" pageEncoding="UTF-8" %>


<body class="hold-transition sidebar-mini layout-fixed">









<div class="wrapper">

<!-- Navbar -->
<nav class="main-header navbar navbar-expand navbar-white navbar-light">
<!-- Left navbar links -->
<ul class="navbar-nav">
<li class="nav-item">
<a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
</li>
<li class="nav-item d-none d-sm-inline-block">
<a href="../pages/homepage.jsp" class="nav-link">Home</a>
</li>
<li class="nav-item d-none d-sm-inline-block">
<a href="#" class="nav-link">Contact</a>
</li>
</ul>

<!-- SEARCH FORM -->
<form class="form-inline ml-3">
<div class="input-group input-group-sm">
<input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
<div class="input-group-append">
<button class="btn btn-navbar" type="submit">
<i class="fas fa-search"></i>
</button>
</div>
</div>
</form>

<!-- Right navbar links -->
<ul class="navbar-nav ml-auto">
<!-- Messages Dropdown Menu -->
<li class="nav-item dropdown">
<a class="nav-link" data-toggle="dropdown" href="#">
<i class="far fa-comments"></i>
<span class="badge badge-danger navbar-badge">3</span>
</a>
<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
<a href="#" class="dropdown-item">
<!-- Message Start -->
<div class="media">
<img src="../Template/dist/img/user1-128x128.jpg" alt="User Avatar" class="img-size-50 mr-3 img-circle">
<div class="media-body">
<h3 class="dropdown-item-title">
Brad Diesel
<span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span>
</h3>
<p class="text-sm">Call me whenever you can...</p>
<p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
</div>
</div>
<!-- Message End -->
</a>
<div class="dropdown-divider"></div>
<a href="#" class="dropdown-item">
<!-- Message Start -->
<div class="media">
<img src="../Template/dist/img/user8-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
<div class="media-body">
<h3 class="dropdown-item-title">
John Pierce
<span class="float-right text-sm text-muted"><i class="fas fa-star"></i></span>
</h3>
<p class="text-sm">I got your message bro</p>
<p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
</div>
</div>
<!-- Message End -->
</a>
<div class="dropdown-divider"></div>
<a href="#" class="dropdown-item">
<!-- Message Start -->
<div class="media">
<img src="../Template/dist/img/user3-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
<div class="media-body">
<h3 class="dropdown-item-title">
Nora Silvester
<span class="float-right text-sm text-warning"><i class="fas fa-star"></i></span>
</h3>
<p class="text-sm">The subject goes here</p>
<p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
</div>
</div>
<!-- Message End -->
</a>
<div class="dropdown-divider"></div>
<a href="#" class="dropdown-item dropdown-footer">See All Messages</a>
</div>
</li>
<!-- Notifications Dropdown Menu -->
<li class="nav-item dropdown">
<a class="nav-link" data-toggle="dropdown" href="#">
<i class="far fa-bell"></i>
<span class="badge badge-warning navbar-badge">15</span>
</a>
<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
<span class="dropdown-item dropdown-header">15 Notifications</span>
<div class="dropdown-divider"></div>
<a href="#" class="dropdown-item">
<i class="fas fa-envelope mr-2"></i> 4 new messages
<span class="float-right text-muted text-sm">3 mins</span>
</a>
<div class="dropdown-divider"></div>
<a href="#" class="dropdown-item">
<i class="fas fa-users mr-2"></i> 8 friend requests
<span class="float-right text-muted text-sm">12 hours</span>
</a>
<div class="dropdown-divider"></div>
<a href="#" class="dropdown-item">
<i class="fas fa-file mr-2"></i> 3 new reports
<span class="float-right text-muted text-sm">2 days</span>
</a>
<div class="dropdown-divider"></div>
<a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
</div>
</li>
<li class="nav-item">
<a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#">
<i class="fas fa-th-large"></i>
</a>
</li>
</ul>
</nav>
<!-- /.navbar -->

<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
<!-- Brand Logo -->
<a href="../pages/homepage.jsp" class="brand-link">
<img src="../Template/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
style="opacity: .8">
<span class="brand-text font-weight-light">GPB | L3 ENI</span>
</a>

<!-- Sidebar -->
<div class="sidebar">
<!-- Sidebar user panel (optional) -->
<!-- <div class="user-panel mt-3 pb-3 mb-3 d-flex">
<div class="image">
<img src="../Template/dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
</div>
<div class="info">
<a href="#" class="d-block">Alexander Pierce</a>
</div>
</div> -->

<!-- Sidebar Menu -->
<nav class="mt-2">
<ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
<!-- Add icons to the links using the .nav-icon class
with font-awesome or any other icon font library -->

<li class="nav-item">
<a href="../pages/homepage.jsp" class="nav-link">
<i class="nav-icon far fa-image"></i>
<p>
Accueil
</p>
</a>
</li>
<li class="nav-item">
  <a href="../pages/listeclient.jsp" class="nav-link">
  <i class="nav-icon far fa-image"></i>
  <p>
  Clients
  </p>
  </a>
  </li>
<li class="nav-item">
<a href="../pages/listbanque.jsp" class="nav-link">
<i class="nav-icon far fa-image"></i>
<p>
Banque
</p>
</a>
</li>
<li class="nav-item">
<a href="../pages/listepret.jsp" class="nav-link">
<i class="nav-icon far fa-image"></i>
<p>
Pret
</p>
</a>
</li>



<!-- 

<li class="nav-item has-treeview menu-open">
<a href="#" class="nav-link active">
<i class="nav-icon fas fa-tachometer-alt"></i>
<p>
Dashboard
<i class="right fas fa-angle-left"></i>
</p>
</a>
<ul class="nav nav-treeview">
<li class="nav-item">
<a href="./index.html" class="nav-link active">
<i class="far fa-circle nav-icon"></i>
<p>Dashboard v1</p>
</a>
</li>
<li class="nav-item">
<a href="./index2.html" class="nav-link">
<i class="far fa-circle nav-icon"></i>
<p>Dashboard v2</p>
</a>
</li>
<li class="nav-item">
<a href="./index3.html" class="nav-link">
<i class="far fa-circle nav-icon"></i>
<p>Dashboard v3</p>
</a>
</li>
</ul>
</li>
<li class="nav-item">
<a href="pages/widgets.html" class="nav-link">
<i class="nav-icon fas fa-th"></i>
<p>
Widgets
<span class="right badge badge-danger">New</span>
</p>
</a>
</li>
<li class="nav-item has-treeview">
<a href="#" class="nav-link">
<i class="nav-icon fas fa-copy"></i>
<p>
Layout Options
<i class="fas fa-angle-left right"></i>
<span class="badge badge-info right">6</span>
</p>
</a>
<ul class="nav nav-treeview">
<li class="nav-item">
<a href="pages/layout/top-nav.html" class="nav-link">
<i class="far fa-circle nav-icon"></i>
<p>Top Navigation</p>
</a>
</li>
<li class="nav-item">
<a href="pages/layout/boxed.html" class="nav-link">
<i class="far fa-circle nav-icon"></i>
<p>Boxed</p>
</a>
</li>
<li class="nav-item">
<a href="pages/layout/fixed-sidebar.html" class="nav-link">
<i class="far fa-circle nav-icon"></i>
<p>Fixed Sidebar</p>
</a>
</li>
<li class="nav-item">
<a href="pages/layout/fixed-topnav.html" class="nav-link">
<i class="far fa-circle nav-icon"></i>
<p>Fixed Navbar</p>
</a>
</li>
<li class="nav-item">
<a href="pages/layout/fixed-footer.html" class="nav-link">
<i class="far fa-circle nav-icon"></i>
<p>Fixed Footer</p>
</a>
</li>
<li class="nav-item">
<a href="pages/layout/collapsed-sidebar.html" class="nav-link">
<i class="far fa-circle nav-icon"></i>
<p>Collapsed Sidebar</p>
</a>
</li>
</ul>
</li>
<li class="nav-item has-treeview">
<a href="#" class="nav-link">
<i class="nav-icon fas fa-chart-pie"></i>
<p>
Charts
<i class="right fas fa-angle-left"></i>
</p>
</a>
<ul class="nav nav-treeview">
<li class="nav-item">
<a href="pages/charts/chartjs.html" class="nav-link">
<i class="far fa-circle nav-icon"></i>
<p>ChartJS</p>
</a>
</li>
<li class="nav-item">
<a href="pages/charts/flot.html" class="nav-link">
<i class="far fa-circle nav-icon"></i>
<p>Flot</p>
</a>
</li>
<li class="nav-item">
<a href="pages/charts/inline.html" class="nav-link">
<i class="far fa-circle nav-icon"></i>
<p>Inline</p>
</a>
</li>
</ul>
</li>
<li class="nav-item has-treeview">
<a href="#" class="nav-link">
<i class="nav-icon fas fa-tree"></i>
<p>
UI Elements
<i class="fas fa-angle-left right"></i>
</p>
</a>
<ul class="nav nav-treeview">
<li class="nav-item">
<a href="pages/UI/general.html" class="nav-link">
<i class="far fa-circle nav-icon"></i>
<p>General</p>
</a>
</li>
<li class="nav-item">
<a href="pages/UI/icons.html" class="nav-link">
<i class="far fa-circle nav-icon"></i>
<p>Icons</p>
</a>
</li>
<li class="nav-item">
<a href="pages/UI/buttons.html" class="nav-link">
<i class="far fa-circle nav-icon"></i>
<p>Buttons</p>
</a>
</li>
<li class="nav-item">
<a href="pages/UI/sliders.html" class="nav-link">
<i class="far fa-circle nav-icon"></i>
<p>Sliders</p>
</a>
</li>
<li class="nav-item">
<a href="pages/UI/modals.html" class="nav-link">
<i class="far fa-circle nav-icon"></i>
<p>Modals & Alerts</p>
</a>
</li>
<li class="nav-item">
<a href="pages/UI/navbar.html" class="nav-link">
<i class="far fa-circle nav-icon"></i>
<p>Navbar & Tabs</p>
</a>
</li>
<li class="nav-item">
<a href="pages/UI/timeline.html" class="nav-link">
<i class="far fa-circle nav-icon"></i>
<p>Timeline</p>
</a>
</li>
<li class="nav-item">
<a href="pages/UI/ribbons.html" class="nav-link">
<i class="far fa-circle nav-icon"></i>
<p>Ribbons</p>
</a>
</li>
</ul>
</li>
<li class="nav-item has-treeview">
<a href="#" class="nav-link">
<i class="nav-icon fas fa-edit"></i>
<p>
Forms
<i class="fas fa-angle-left right"></i>
</p>
</a>
<ul class="nav nav-treeview">
<li class="nav-item">
<a href="pages/forms/general.html" class="nav-link">
<i class="far fa-circle nav-icon"></i>
<p>General Elements</p>
</a>
</li>
<li class="nav-item">
<a href="pages/forms/advanced.html" class="nav-link">
<i class="far fa-circle nav-icon"></i>
<p>Advanced Elements</p>
</a>
</li>
<li class="nav-item">
<a href="pages/forms/editors.html" class="nav-link">
<i class="far fa-circle nav-icon"></i>
<p>Editors</p>
</a>
</li>
</ul>
</li>
<li class="nav-item has-treeview">
<a href="#" class="nav-link">
<i class="nav-icon fas fa-table"></i>
<p>
Tables
<i class="fas fa-angle-left right"></i>
</p>
</a>
<ul class="nav nav-treeview">
<li class="nav-item">
<a href="pages/tables/simple.html" class="nav-link">
<i class="far fa-circle nav-icon"></i>
<p>Simple Tables</p>
</a>
</li>
<li class="nav-item">
<a href="pages/tables/data.html" class="nav-link">
<i class="far fa-circle nav-icon"></i>
<p>DataTables</p>
</a>
</li>
<li class="nav-item">
<a href="pages/tables/jsgrid.html" class="nav-link">
<i class="far fa-circle nav-icon"></i>
<p>jsGrid</p>
</a>
</li>
</ul>
</li>
<li class="nav-header">EXAMPLES</li>
<li class="nav-item">
<a href="pages/calendar.html" class="nav-link">
<i class="nav-icon far fa-calendar-alt"></i>
<p>
Calendar
<span class="badge badge-info right">2</span>
</p>
</a>
</li>
<li class="nav-item">
<a href="pages/gallery.html" class="nav-link">
<i class="nav-icon far fa-image"></i>
<p>
Gallery
</p>
</a>
</li>
<li class="nav-item has-treeview">
<a href="#" class="nav-link">
<i class="nav-icon far fa-envelope"></i>
<p>
Mailbox
<i class="fas fa-angle-left right"></i>
</p>
</a>
<ul class="nav nav-treeview">
<li class="nav-item">
<a href="pages/mailbox/mailbox.html" class="nav-link">
<i class="far fa-circle nav-icon"></i>
<p>Inbox</p>
</a>
</li>
<li class="nav-item">
<a href="pages/mailbox/compose.html" class="nav-link">
<i class="far fa-circle nav-icon"></i>
<p>Compose</p>
</a>
</li>
<li class="nav-item">
<a href="pages/mailbox/read-mail.html" class="nav-link">
<i class="far fa-circle nav-icon"></i>
<p>Read</p>
</a>
</li>
</ul>
</li>
<li class="nav-item has-treeview">
<a href="#" class="nav-link">
<i class="nav-icon fas fa-book"></i>
<p>
Pages
<i class="fas fa-angle-left right"></i>
</p>
</a>
<ul class="nav nav-treeview">
<li class="nav-item">
<a href="pages/examples/invoice.html" class="nav-link">
<i class="far fa-circle nav-icon"></i>
<p>Invoice</p>
</a>
</li>
<li class="nav-item">
<a href="pages/examples/profile.html" class="nav-link">
<i class="far fa-circle nav-icon"></i>
<p>Profile</p>
</a>
</li>
<li class="nav-item">
<a href="pages/examples/e_commerce.html" class="nav-link">
<i class="far fa-circle nav-icon"></i>
<p>E-commerce</p>
</a>
</li>
<li class="nav-item">
<a href="pages/examples/projects.html" class="nav-link">
<i class="far fa-circle nav-icon"></i>
<p>Projects</p>
</a>
</li>
<li class="nav-item">
<a href="pages/examples/project_add.html" class="nav-link">
<i class="far fa-circle nav-icon"></i>
<p>Project Add</p>
</a>
</li>
<li class="nav-item">
<a href="pages/examples/project_edit.html" class="nav-link">
<i class="far fa-circle nav-icon"></i>
<p>Project Edit</p>
</a>
</li>
<li class="nav-item">
<a href="pages/examples/project_detail.html" class="nav-link">
<i class="far fa-circle nav-icon"></i>
<p>Project Detail</p>
</a>
</li>
<li class="nav-item">
<a href="pages/examples/contacts.html" class="nav-link">
<i class="far fa-circle nav-icon"></i>
<p>Contacts</p>
</a>
</li>
</ul>
</li>
<li class="nav-item has-treeview">
<a href="#" class="nav-link">
<i class="nav-icon far fa-plus-square"></i>
<p>
Extras
<i class="fas fa-angle-left right"></i>
</p>
</a>
<ul class="nav nav-treeview">
<li class="nav-item">
<a href="pages/examples/login.html" class="nav-link">
<i class="far fa-circle nav-icon"></i>
<p>Login</p>
</a>
</li>
<li class="nav-item">
<a href="pages/examples/register.html" class="nav-link">
<i class="far fa-circle nav-icon"></i>
<p>Register</p>
</a>
</li>
<li class="nav-item">
<a href="pages/examples/lockscreen.html" class="nav-link">
<i class="far fa-circle nav-icon"></i>
<p>Lockscreen</p>
</a>
</li>
<li class="nav-item">
<a href="pages/examples/legacy-user-menu.html" class="nav-link">
<i class="far fa-circle nav-icon"></i>
<p>Legacy User Menu</p>
</a>
</li>
<li class="nav-item">
<a href="pages/examples/language-menu.html" class="nav-link">
<i class="far fa-circle nav-icon"></i>
<p>Language Menu</p>
</a>
</li>
<li class="nav-item">
<a href="pages/examples/404.html" class="nav-link">
<i class="far fa-circle nav-icon"></i>
<p>Error 404</p>
</a>
</li>
<li class="nav-item">
<a href="pages/examples/500.html" class="nav-link">
<i class="far fa-circle nav-icon"></i>
<p>Error 500</p>
</a>
</li>
<li class="nav-item">
<a href="pages/examples/blank.html" class="nav-link">
<i class="far fa-circle nav-icon"></i>
<p>Blank Page</p>
</a>
</li>
<li class="nav-item">
<a href="starter.html" class="nav-link">
<i class="far fa-circle nav-icon"></i>
<p>Starter Page</p>
</a>
</li>
</ul>
</li>
<li class="nav-header">MISCELLANEOUS</li>
<li class="nav-item">
<a href="https://adminlte.io/docs/3.0" class="nav-link">
<i class="nav-icon fas fa-file"></i>
<p>Documentation</p>
</a>
</li>
<li class="nav-header">LABELS</li>
<li class="nav-item">
<a href="#" class="nav-link">
<i class="nav-icon far fa-circle text-danger"></i>
<p class="text">Important</p>
</a>
</li>
<li class="nav-item">
<a href="#" class="nav-link">
<i class="nav-icon far fa-circle text-warning"></i>
<p>Warning</p>
</a>
</li>
<li class="nav-item">
<a href="#" class="nav-link">
<i class="nav-icon far fa-circle text-info"></i>
<p>Informational</p>
</a>
</li> -->
</ul>
</nav>
<!-- /.sidebar-menu -->
</div>
<!-- /.sidebar -->
</aside>



















<!-- <div class="container body">
<div class="main_container">
<div class="col-md-3 left_col">
<div class="left_col scroll-view">
<div class="navbar nav_title" style="border: 0;">
<a href="index.html" class="site_title"><i class="fa fa-bank"></i> <span>Gestion Bancaire</span></a>
</div>

<div class="clearfix"></div>

<br /> -->

<!-- sidebar menu -->
<!-- <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
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
</div> -->
<!-- /sidebar menu -->

<!-- /menu footer buttons -->
<!-- <div class="sidebar-footer hidden-small">
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
</div> -->
<!-- /menu footer buttons -->
<!-- </div>
</div> -->

<!-- top navigation -->
<!-- <div class="top_nav">
<div class="nav_menu">
<nav>
<div class="nav toggle">
<a id="menu_toggle"><i class="fa fa-bars"></i></a>
</div>
</nav>
</div>
</div> -->

