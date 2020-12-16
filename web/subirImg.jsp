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

<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.*" %>
<%@ page import="java.io.*" %>
<%
        FileItemFactory file_factory = new DiskFileItemFactory();
        ServletFileUpload servlet_up = new ServletFileUpload(file_factory);
        List items = servlet_up.parseRequest(request);
        String img="";
        for(int i=0;i<items.size();i++){
            FileItem item = (FileItem) items.get(0);
            if (!item.isFormField()){
		File archivo_server = new File
                       // ("E:\\Escritorio\\Curso Carrito JSP\\ultimo\\CarritoJSP\\CarritoJSP\\web\\img\\"+item.getName());
                        //("C:\\Users\\ANGELO\\Documents\\NetBeansProjects\\CarritoJSP\\GesTareaJSP\\web\\img\\"+item.getName());
                        ("C:\\Users\\MAXIMUS\\Documents\\NetBeansProjects\\TareaJSP\\GesTareaJSP\\web\\img\\"+item.getName());
        		try{
                 item.write(archivo_server);
                }catch(Exception e){}
                img=item.getName();
            }
        }
%>
<jsp:forward page="registrarTarea2.jsp">
    <jsp:param name="img" value="<%=img%>"></jsp:param>
</jsp:forward>
