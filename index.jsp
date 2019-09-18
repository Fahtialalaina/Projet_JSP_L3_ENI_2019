<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ include file="../include/inc.jsp" %>
<%@ include file="../include/connex.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Authentification | Gestion Bancaire</title>
    <link rel="stylesheet" href="css/index.css">
    <link href="vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="vendors/nprogress/nprogress.css" rel="stylesheet">
    <link href="vendors/animate.css/animate.min.css" rel="stylesheet">
    <link href="build/css/custom.min.css" rel="stylesheet">
</head>
<body class="login">
    <div>
      <a class="hiddenanchor" id="signup"></a>
      <a class="hiddenanchor" id="signin"></a>

      <div class="login_wrapper">
        <div class="animate form login_form">
          <section class="login_content">
            <form>
              <h1>Authentification</h1>
              <div>
                <input type="text" class="form-control" name="admName" placeholder="Nom d'utilisateur" required="" />
              </div>
              <div>
                <input type="password" class="form-control" name="admPasswd" placeholder="Mot de passe" required="" />
              </div>
              <div>
                  <button type="submit" class="btn btn-default submit">SE CONNECTER</button>
              </div>

              <div class="clearfix"></div>

              <div class="separator">
                <p class="change_link">Pas encore membre ?
                  <a href="pages/register.jsp" class="to_register"> Créer un compte </a>
                </p>

                <div class="clearfix"></div>
                <br />

                <div>
                  <p>©2019 Tous droits réservés aux Administrateurs</p>
                </div>
              </div>
            </form>
          </section>
        </div>
      </div>
    </div>
  </body>
</html>
<%
String admName = request.getParameter("admName");
String admPasswd = request.getParameter("admPasswd");
        
if(admName!=null && admPasswd!=null){
  ResultSet res4 = null;
  String tncli = "";
  String tpcli = "";

  stat = conn.createStatement();
  String data4 = "SELECT * FROM login_table WHERE nom='"+admName+"' AND password='"+admPasswd+"'";
  res4 = stat.executeQuery(data4);
  while(res4.next()){
    tncli = res4.getString("nom");
    tpcli = res4.getString("password");
  }
  if(tncli != "" && tpcli != ""){
    response.sendRedirect("pages/listeclient.jsp");
  }else{
    response.sendRedirect("index.jsp");
  }
}
%>