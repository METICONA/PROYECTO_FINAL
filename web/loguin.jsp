<%-- 
    Document   : loguin
    Created on : 23-11-2020, 07:45:07 PM
    Author     : ANGELO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%
    String usu = "";
    String nom = "";
    HttpSession sesionOK = request.getSession();

    if (sesionOK.getAttribute("perfil") != null) {
        nom = (String) sesionOK.getAttribute("nom") + " " + (String) sesionOK.getAttribute("ape");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <link rel="stylesheet" href="./css/main.css">
    </head> 
    <body>
        
        <div class="full-box login-container cover">
            <form action="ServletLogueo" method="post" autocomplete="off" class="logInForm">
                <input class="form-control" id="UserName" type="hidden" name="accion" value="loguin">
                <p class="text-center text-muted"><i class="zmdi zmdi-account-circle zmdi-hc-5x"></i></p>
                <p class="text-center text-muted text-uppercase">Inicia sesión con tu cuenta</p>
                <div class="form-group label-floating">
                    <label class="control-label" for="UserName">Usuario</label>
                    <input class="form-control" id="UserName" type="text" name="txtUsu" placeholder="">
                    <p class="help-block">Escribe tú nombre de usuario</p>
                </div>
                <div class="form-group label-floating">
                    <label class="control-label" for="UserPass">Contraseña</label>
                    <input class="form-control" id="UserPass" type="text" name="txtPass" placeholder="">
                    <p class="help-block">Escribe tú contraseña</p>
                </div>
                <div class="form-group text-center">
                    <input type="submit" value="INICIAR" name="btn" class="btn btn-default btn-raised" style="">
                    <a href="index.jsp" class="btn btn-default btn-raised">VER TAREAS</a>
                </div>
                <h4 align="center">
                    <%
                        if (request.getAttribute("msg") != null) {
                            out.println(request.getAttribute("msg"));
                        }
                    %>
                </h4>
            </form>
        </div>

        <!--====== Scripts -->
        <script src="./js/jquery-3.1.1.min.js"></script>
        <script src="./js/bootstrap.min.js"></script>
        <script src="./js/material.min.js"></script>
        <script src="./js/ripples.min.js"></script>
        <script src="./js/sweetalert2.min.js"></script>
        <script src="./js/jquery.mCustomScrollbar.concat.min.js"></script>
        <script src="./js/main.js"></script>
        <script>
            $.material.init();
        </script>
    </body>
</html>
