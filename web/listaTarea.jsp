<%-- 
    Document   : listaTarea
    Created on : 23-11-2020, 11:37:14 PM
    Author     : ANGELO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.*" %>

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
        <!-- SideBar -->
        <section class="full-box cover dashboard-sideBar">
            <div class="full-box dashboard-sideBar-bg btn-menu-dashboard"></div>
            <div class="full-box dashboard-sideBar-ct">
                <!--SideBar Title -->
                <div class="full-box text-uppercase text-center text-titles dashboard-sideBar-title">
                    SISTEMA  EASYWORK <i class="zmdi zmdi-close btn-menu-dashboard visible-xs"></i>
                </div>
                <!-- SideBar User info -->
                <%------------------------SESSION-------------------------------------%>
                <%if (sesionOK.getAttribute("perfil") != null) {
                %>
                <div class="full-box dashboard-sideBar-UserInfo">
                    <figure class="full-box">
                        <img src="./assets/avatars/AdminMaleAvatar.png" alt="UserIcon">
                        <br>
                        <figcaption class="text-center text-titles">
                            <%out.println("Bienvenido : " + nom);%>
                        </figcaption>
                    </figure>    
                    <ul class="full-box list-unstyled text-center">
                        
                        <li>
                            <a href="" title="Salir del sistema" class="btn-exit-system">
                                <i class="zmdi zmdi-power"></i>
                            </a>
                        </li>
                    </ul>
                </div>
                <!-- SideBar Menu -->
                <ul class="list-unstyled full-box dashboard-sideBar-Menu">
                    <li>
                        <a href="home.jsp">
                            <i class="zmdi zmdi-view-dashboard zmdi-hc-fw"></i> Inicio
                        </a>
                    </li>
                    <li>
                        <a href="registrarProceso.jsp">
                            <i class="zmdi zmdi-view-dashboard zmdi-hc-fw"></i> Tareas Selecionadas
                        </a>
                    </li>
                    <li>
                        <a href="listaTarea.jsp">
                            <i class="zmdi zmdi-view-dashboard zmdi-hc-fw"></i> Gestion Tareas
                        </a>
                    </li>
                    <li>
                        <a href="home.jsp">
                            <i class="zmdi zmdi-view-dashboard zmdi-hc-fw"></i> Listas de Tareas
                        </a>
                    </li>
                    <%
                        }
                    %>
                    <%------------------------SESSION EMPLEADO FIN--------------------------------%>            
                    <%------------------------SESSION ADMIN--------------------------------%> 
                    <%
                        if (sesionOK.getAttribute("perfil") != null && sesionOK.getAttribute("perfil").equals("Admin")) {
                    %>
                    <li>
                        <a href="ServletController?accion=ConsultarProceso">
                            <i class="zmdi zmdi-view-dashboard zmdi-hc-fw"></i> Detalle Tareas
                        </a>
                    </li>
                    <li>
                        <a href="listarUsuario.jsp">
                            <i class="zmdi zmdi-view-dashboard zmdi-hc-fw"></i> Lista Usuarios
                        </a>
                    </li>
                    <%
                        }
                    %> 
                    <%------------------------SESSION FIN--------------------------------%> 
                </ul>
            </div>
        </section>

        <!-- Content page-->
        <section class="full-box dashboard-contentPage">

            <%------------------------SESSION --------------------------------%> 
            <!-- NavBar -->
            <nav class="full-box dashboard-Navbar">
                <ul class="full-box list-unstyled text-right">
                    <li class="pull-left">
                        <a href="#!" class="btn-menu-dashboard"><i class="zmdi zmdi-more-vert"></i></a>
                    </li>

                    <%
                        if (sesionOK.getAttribute("perfil") == null) {
                    %>
                    <li>
                        <a href="loguin.jsp" class="btn-search">Session
                            <i class="zmdi zmdi-search"></i>
                        </a>
                    </li>
                    <% } %> 

                </ul>
            </nav>
            <%------------------------SESSION FIN--------------------------------%> 

            <!-- Content page -->
            <div class="container-fluid">
                <div class="page-header">
                    <h1 class="text-titles"><i class="zmdi zmdi-book-image zmdi-hc-fw"></i> LISTA DE TAREAS PENDIENTES</h1>
                </div>
                <p class="lead">Realizar las Tareas deacuerdo a las opciones Establecidas</p>
            </div>
            <div class="container-fluid text-center">
                <div class="btn-group">
                    <%------------------------SESSION USUARIO--------------------------------%> 
                    <%
                        if (sesionOK.getAttribute("perfil") != null) {
                    %>
                    <a href="home.jsp" class="btn btn-default btn-raised">INICIO</a>
                    <a href="listaTarea.jsp" class="btn btn-default btn-raised">LISTA TAREA</a>
                    <a href="registrarProceso.jsp" class="btn btn-default btn-raised">TAREAS SELECIONADAS</a>
                    <%
                        }
                    %>
                    <%------------------------SESSION USUARIO FIN--------------------------------%> 
                    <%------------------------SESSION ADMIN--------------------------------%> 
                    <%
                        if (sesionOK.getAttribute("perfil") != null && sesionOK.getAttribute("perfil").equals("Admin")) {
                    %>
                    <a href="registrarTarea.jsp" class="btn btn-default btn-raised">AGREGAR TAREA</a>
                    <a href="ServletController?accion=ConsultarProceso" class="btn btn-default btn-raised">DETALLE TAREAS</a>
                    <a href="listarUsuario.jsp" class="btn btn-default btn-raised">LISTA USUARIOS</a>
                    <%
                        }
                    %>
                    <%------------------------SESSION ADMIN  FIN--------------------------------%> 
                </div>
            </div>
        </div>
        <%--a href="registrarTarea.jsp" value="Cancelar" name="btnCancelar" class="btn btn-danger btn-raised btn-sm"> Ver Tareas Selecionadas</a--%>
        <div class="container-fluid">
            <h2 class="text-titles text-center">Lista Completa de Tareas</h2>
            <br>
            <div class="row">
                <div class="col-xs-12">
                    <%
                        ArrayList<Tarea> lista = TareaDB.obtener_Tarea();

                        for (Tarea t : lista) {
                    %>
                    <div class="list-group">
                        <div class="cd-timeline-block">
                            <div class="cd-timeline-img">
                                <img src="assets/avatars/StudetMaleAvatar.png" alt="user-picture">
                            </div>
                            <div class="cd-timeline-content">
                                <div class="list-group-item">
                                    <div class="row-picture">
                                        <img class="circle" src="img/<%= t.getImagen()%>" alt="icon" style="padding-bottom: 1px;margin-bottom: 40px;">
                                    </div>
                                    <div class="row-content">
                                        <h4 class="list-group-item-heading"><%= t.getCodigoTarea()%>. <%= t.getCategoria()%></h4>
                                        <p class="list-group-item-text">
                                            <strong>Tarea: </strong><%= t.getDescripcion()%><br>
                                            <strong>Referencia Usuario: </strong><%= t.getNombre()%><br>
                                            <strong>Tiempo Dias: </strong><%= t.getDias()%><br>
                                            <strong>Fecha: </strong><%= t.getFechaCreacion()%><br>

                                            <a href="verTarea.jsp?id=<%= t.getCodigoTarea()%>" class="btn btn-primary" title="Más información..."><i class="zmdi zmdi-info"></i> VER</a>
                                            <%------------------------SESSION ADMIN--------------------------------%> 
                                            <%
                                                if (sesionOK.getAttribute("perfil") != null && sesionOK.getAttribute("perfil").equals("Admin")) {
                                            %>
                                            <a href="editarTarea.jsp?id=<%= t.getCodigoTarea()%>" class="btn btn-primary" title="Editar Tarea"><i class="zmdi zmdi-wrench"></i> EDITAR</a>
                                            <%
                                                }
                                            %>
                                            <%------------------------SESSION ADMIN  FIN--------------------------------%> 
                                            <a href="anadirTarea.jsp?id=<%= t.getCodigoTarea()%>" class="btn btn-primary" title="Enviar Tarea"><i class="zmdi zmdi-cloud-download"></i> ENVIAR</a>
                                        </p>
                                    </div>
                                </div>

                            </div>                   
                        </div>                   

                        <%
                            }
                        %>

                    </div>
                </div>
            </div>
    </section>

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
