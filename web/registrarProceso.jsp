<%-- 
    Document   : registrarProceso
    Created on : 22-11-2020, 06:13:48 PM
    Author     : ANGELO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.*"%>
<%@page import="java.util.ArrayList"%>
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
                    <h1 class="text-titles"><i class="zmdi zmdi-account zmdi-hc-fw"></i> LISTAS DE TAREAS<small>Seleccionadas</small></h1>
                </div>
                <p class="lead">Lista de las Tareas que usted Seleciono y que estan Realizadas - Listas para ser enviadas al administrador</p>
            </div>

            

            <!-- Panel nuevo administrador -->
            <div class="container-fluid">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="zmdi zmdi-plus"></i> &nbsp; LISTA DE TAREAS SELECCIONADAS</h3>
                    </div>

                    <div class="panel-body">
                        <fieldset>
                            <legend><i class="zmdi zmdi-account-box"></i> &nbsp; Tareas Selecionadas Listo para su envio al Administrador</legend>
                        </fieldset>
                        <form method="post" action="ServletController">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-4">
                                                <div class="form-group label-floating">
                                                    <i class="zmdi zmdi-assignment-o"></i>&nbsp;EMPLEADO
                                                    <input  class="form-control" type="hidden" name="accion" value="RegistrarProceso">
                                                    <input type="text" name="txtEmpleado" class="form-control" value="<%if (sesionOK.getAttribute("perfil") != null) 
                                                            out.println(nom);%>" readonly=""/>    
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%
                                ArrayList<TareaProceso> lista = (ArrayList<TareaProceso>) session.getAttribute("carrito");

                                if (lista != null) {
                                    for (TareaProceso tp : lista) {
                            %>


                            <br>
                            <br>
                            <div class="list-group">
                                <div class="list-group-item">
                                    <div class="row-picture">
                                        <img class="circle" src="img/<%= tp.getTarea().getImagen()%>" alt="icon">
                                    </div>
                                    <div class="row-content">
                                        <h4 class="list-group-item-heading"><%= tp.getTarea().getCodigoTarea()%>. <%= tp.getTarea().getCategoria()%></h4>
                                        <p class="list-group-item-text">
                                            <strong>Tarea Destinada: </strong><%= tp.getTarea().getNombre()%><br>
                                            <strong>Descripcion Tarea: </strong><%= tp.getTarea().getDescripcion()%><br>
                                            <strong>Prioridad: </strong><%= tp.getTarea().getPrioridad()%><br>
                                            <strong>Dias a Disposicion: </strong><%= tp.getTarea().getDias()%><br>
                                            <strong>Nota: </strong><%= tp.getNota()%><br>
                                            <strong>Estado: </strong><%= tp.getEstado()%><br>
                                            <strong>Fecha: </strong><%= tp.getTarea().getFechaCreacion()%><br>
                                        </p>
                                    </div>
                                </div>
                                <div class="list-group-separator"></div>
                                <div class="list-group-item"></div>
                            </div>
                            <%
                                    }
                                }
                            %>
                            <p class="text-center" style="margin-top: 20px;">
                                <a href="listaTarea.jsp" value="Volver" name="btnVolver" class="btn btn-danger btn-raised btn-sm"> Seguir</a>
                                <a href="ServletLogueo?accion=Cancelar" value="Cancelar Envio Tarea" name="btnCancelar" class="btn btn-danger btn-raised btn-sm">Cancelar las Tareas</a>
                                <button type="submit" class="btn btn-info btn-raised btn-sm"><i class="zmdi zmdi-floppy"></i> Guardar</button>

                            </p>
                        </form>
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
