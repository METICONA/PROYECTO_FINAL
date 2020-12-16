<%-- 
    Document   : anadirTarea
    Created on : 21-11-2020, 06:48:29 PM
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
            <%
                Tarea t = TareaDB.obtener_TareaId(Integer.parseInt(request.getParameter("id")));
            %>
            <!-- Content page -->
            <div class="container-fluid">
                <div class="page-header">
                    <h1 class="text-titles"><i class="zmdi zmdi-male-alt zmdi-hc-fw"></i> AÑADIR <small> Tareas</small></h1>
                </div>
                <p class="lead">La Tarea selecionada se añadira a la lista de tareas que luego sera enviada junta con el resto de las tareas acabas o no cabadas</p>
            </div>


            <!-- Panel nuevo cliente -->
            <div class="container-fluid">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="zmdi zmdi-plus"></i> &nbsp; TAREA NRO <%= t.getCodigoTarea()%></h3>
                    </div>
                    <div class="panel-body">
                        <form method="post" action="ServletController">
                            <fieldset>
                                <legend><i class="zmdi zmdi-account-box"></i> &nbsp; Información de la Tarea</legend>
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-2">
                                            <div class="form-group label-floating">
                                                <label class="control-label">Nro Tarea</label>
                                                <input class="form-control" type="text" name="txtCodigo" value="<%= t.getCodigoTarea()%>" readonly maxlength="30">
                                            </div>
                                        </div>
                                        <div class="col-xs-12">
                                            <div class="form-group label-floating">
                                                <label class="control-label">Descripcion Tarea</label>
                                                <textarea name="txtDescripcion" value="" class="form-control" rows="2" maxlength="1000" readonly><%= t.getDescripcion()%></textarea>
                                            </div>
                                        </div>                
                                        <div class="col-xs-12 col-sm-6">
                                            <div class="form-group label-floating">
                                                <label class="control-label">Categoria Tarea</label>
                                                <input  class="form-control" type="text" name="txtCategoria" value="<%= t.getCategoria()%>" readonly maxlength="30">
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6">
                                            <div class="form-group label-floating">
                                                <label class="control-label">Fecha Tarea</label>
                                                <input  class="form-control" type="text" name="txtFechaCreacion" value="<%= t.getFechaCreacion()%>" readonly maxlength="30">
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6">
                                            <div class="form-group label-floating">
                                                <label class="control-label">Prioridad</label>
                                                <input  class="form-control" type="text" name="txtPrioridad"  value="<%= t.getPrioridad()%>" readonly maxlength="">
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6">
                                            <div class="form-group label-floating">
                                                <label class="control-label">Dias</label>
                                                <input  class="form-control" type="text" name="txtDias" value="<%= t.getDias()%>" readonly maxlength="">
                                            </div>
                                        </div>
                                        <legend><i class="zmdi zmdi-account-box"></i> &nbsp; Nota - Describir si la Tarea se realizo </legend>                
                                        <div class="col-xs-12">
                                            <div class="form-group label-floating">
                                                <label class="control-label">Nota</label>
                                                <textarea name="txtNota" value="" class="form-control" rows="3" required maxlength="1000"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </fieldset>

                            <fieldset>
                                <legend><i class="zmdi zmdi-star"></i> &nbsp; Selecione el Proceso de la Tarea</legend>
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-6">
                                            <p class="text-left">
                                            <div class="label label-success">Nivel 1</div> Tarea Completa con Exito
                                            </p>
                                            <p class="text-left">
                                            <div class="label label-primary">Nivel 2</div> Tarea en Proceso
                                            </p>
                                            <p class="text-left">
                                            <div class="label label-info">Nivel 3</div> Tarea No Concluida
                                            </p>
                                        </div>
                                        <div class="col-xs-12 col-sm-6">
                                            <div class="radio radio-primary">
                                                <label>
                                                    <input type="radio" name="txtEstado" id="optionsRadios1" value="Completado"required>
                                                    <i class="zmdi zmdi-star"></i> &nbsp; Nivel 1
                                                </label>
                                            </div>
                                            <div class="radio radio-primary">
                                                <label>
                                                    <input type="radio" name="txtEstado" id="optionsRadios2" value="Proceso"required>
                                                    <i class="zmdi zmdi-star"></i> &nbsp; Nivel 2
                                                </label>
                                            </div>
                                            <div class="radio radio-primary">
                                                <label>
                                                    <input type="radio" name="txtEstado" id="optionsRadios3" value="Fallido"required>
                                                    <i class="zmdi zmdi-star"></i> &nbsp; Nivel 3
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </fieldset>
                            <p class="text-center" style="margin-top: 20px;">
                                <a href="listaTarea.jsp" value="Cancelar" name="btnCancelar" class="btn btn-danger btn-raised btn-sm"> Cancelar</a>
                                <button type="submit" value="Añadir" name="btnAnadir" class="btn btn-info btn-raised btn-sm"><i class="zmdi zmdi-floppy"></i> Enviar</button>

                            </p>

                            <input  class="form-control" type="hidden" name="accion" value="AnadirTarea"  maxlength="30">
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
