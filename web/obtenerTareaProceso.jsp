<%-- 
    Document   : obtenerTareaProceso
    Created on : 23-11-2020, 04:45:36 PM
    Author     : ANGELO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.*" %>
<%@page import="Modelo.*,java.util.*" %>
<%@page session="true" %>
<%
    //dos variables para mostrar quien ingresos al sistema 
    String usu = "";
    String nom = "";
    //recuperar la variable de sessionOK = para saber si el usuario es correcto
    //si es correcto esta llena con 3 atributos perfil,nombre y apellido
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

        <%
            ArrayList<TareaProceso> lista = TareaProcesoDB.obtener_TareaProceso(Integer.parseInt(request.getParameter("cod")));
            for (int i = 0; i < lista.size(); i++) {
                TareaProceso tp = lista.get(i);
        %>
        <br>
        <div class="list-group">
            <div class="list-group-item">
                <div class="row-picture">

                </div>
                <div class="row-content">
                    <p class="list-group-item-text">
                        <strong>Nro Usuario : </strong><%= tp.getCodigoProceso()%><br>
                        <strong>Nro de Tareas Realizadas : </strong><%= tp.getCodigoTarea()%><br>
                        <strong>Nota de la Tarea : </strong><%= tp.getNota()%><br>
                        <strong>Estado de la Tarea : </strong><%= tp.getEstado()%><br>
                    </p>
                </div>
            </div>
            <div class="list-group-separator"></div>
            <div class="list-group-item"></div>
        </div>
        <%
            }
        %>

        <!--====== Scripts -->
        <script src="./js/jquery-3.1.1.min.js"></script>
        <script src="./js/sweetalert2.min.js"></script>
        <script src="./js/bootstrap.min.js"></script>
        <script src="./js/material.min.js"></script>
        <script src="./js/ripples.min.js"></script>
        <script src="./js/jquery.mCustomScrollbar.concat.min.js"></script>
        <script src="./js/main.js"></script>
        <script>
            $.material.init();
        </script>
    </body>
</html>
