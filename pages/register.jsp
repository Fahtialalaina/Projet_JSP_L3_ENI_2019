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
    <title>Inscription | Gestion Bancaire</title>
    <link rel="stylesheet" href="../css/index.css">
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
    <link href="../vendors/animate.css/animate.min.css" rel="stylesheet">
    <link href="../build/css/custom.min.css" rel="stylesheet">
</head>
<body class="login">
    <div>
      <a class="hiddenanchor" id="signup"></a>
      <a class="hiddenanchor" id="signin"></a>

      <div class="login_wrapper">
        <div class="animate form login_form">
                <section class="login_content">
                    <form>
                        <h1>Inscription</h1>
                        <div>
                        <input type="text" class="form-control" name="fullname_user" placeholder="Nom Complet" required="" />
                        </div>
                        <div>
                        <input type="text" class="form-control" name="username" placeholder="Pseudo" required="" />
                        </div>
                        <div>
                        <input type="email" class="form-control" name="email_user" placeholder="Email" required="" />
                        </div>
                        <div>
                        <input type="password" class="form-control" name="password_user1" placeholder="Mot de passe" required="" />
                        </div>
                        <div>
                        <input type="password" class="form-control" name="password_user2" placeholder="Confirmer le mot de passe" required="" />
                        </div>
                        <div>
                        <button type="submit" class="btn btn-default submit">S'INSCRIRE</button>
                        </div>
        
                        <div class="clearfix"></div>
        
                        <div class="separator">
                        <p class="change_link">Déjà membre ?
                            <a href="../index.jsp" class="to_register"> Se Connecter </a>
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
String fu = request.getParameter("fullname_user");
String un = request.getParameter("username");
String eu = request.getParameter("email_user");
String pu = request.getParameter("password_user1");
        
if(fu!=null && un!=null && eu!=null && pu!=null){
    String data = "INSERT INTO `users` (`fullname_user`, `username`, `email_user`, `password_user`) VALUES (?,?,?,?)";
    stmt = conn.prepareStatement(data);
    stmt.setString(1,fu);
    stmt.setString(2,un);
    stmt.setString(3,eu);
    stmt.setString(4,pu);
    stmt.executeUpdate();
    response.sendRedirect("../index.jsp");
}
%>