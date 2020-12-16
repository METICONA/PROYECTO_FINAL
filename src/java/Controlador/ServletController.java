package Controlador;

import Modelo.Proceso;
import Modelo.ProcesoDB;
import Modelo.Tarea;
import Modelo.TareaDB;
import Modelo.TareaProceso;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ANGELO
 */
@WebServlet(name = "ServletController", urlPatterns = {"/ServletController"})
public class ServletController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        if (accion.equals("AnadirTarea")) {
            this.anadirTarea(request, response);
       }else if (accion.equals("ModificarTarea")) {
            this.modificarTarea(request, response);
        }else if (accion.equals("RegistrarTarea")) {
            this.registrarTarea(request, response);
        }else if (accion.equals("RegistrarProceso")) {
            this.registrarProceso(request, response);
        }else if (accion.equals("ConsultarProceso")) {
            this.consultarProceso(request, response);
        }
    }
    
    private void consultarProceso(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ArrayList<Proceso> lista=new ArrayList<>();
        lista=ProcesoDB.obtener_Proceso();
        request.setAttribute("lista",lista);
        request.getRequestDispatcher("consultarProceso.jsp").forward(request, response);
    }

    private void anadirTarea(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.print("cantidad-->");
        HttpSession sesion = request.getSession();
        ArrayList<TareaProceso> carrito;

        if (sesion.getAttribute("carrito") == null) {
            carrito = new ArrayList<TareaProceso>();
        } else {
            carrito = (ArrayList<TareaProceso>) sesion.getAttribute("carrito");
        }
        Tarea t = TareaDB.obtener_TareaId(Integer.parseInt(request.getParameter("txtCodigo")));

        TareaProceso tp = new TareaProceso();
        tp.setCodigoTarea(Integer.parseInt(request.getParameter("txtCodigo")));
        tp.setTarea(t);
        tp.setNota((request.getParameter("txtNota")));
        tp.setEstado((request.getParameter("txtEstado")));

        int indice = -1;
        for (int i = 0; i < carrito.size(); i++) {
            TareaProceso det = carrito.get(i);
            if (det.getCodigoTarea() == t.getCodigoTarea()) {
                indice = i;
                break;
            }
        }
        if (indice == -1) {
            carrito.add(tp);
        }
        sesion.setAttribute("carrito", carrito);
        response.sendRedirect("registrarProceso.jsp");
    }

    private void modificarTarea(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Tarea t = new Tarea(Integer.parseInt(request.getParameter("txtCodigo")),
                request.getParameter(("txtCategoria").toString()),
                request.getParameter(("txtNombre").toString()),
                request.getParameter(("txtDescripcion").toString()),
                request.getParameter(("txtPrioridad").toString()),
                Integer.parseInt(request.getParameter("txtDias")));

        boolean rpta = TareaDB.actualizar_Tarea(t);
        if (rpta) {
            response.sendRedirect("listaTarea.jsp");
        } else {
            response.sendRedirect("editarTarea.jsp");
        }
        //response.sendRedirect("FormularioPago.jsp?total="+total);
    }

    private void registrarTarea(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String ca = request.getParameter("txtCategoria");
        String nom = request.getParameter("txtNombre");
        String des = request.getParameter("txtDescripcion");
        String pri = request.getParameter("txtPrioridad");
        Integer dia = Integer.parseInt(request.getParameter("txtDias"));
        String img = request.getParameter("txtImagen");

        Tarea t = new Tarea(ca, nom, des, pri, dia, img);
        boolean rpta = TareaDB.insertar_Tarea(t);
        if (rpta) {
            response.sendRedirect("listaTarea.jsp");
        } else {
            response.sendRedirect("registrarTarea.jsp");
        }
    }

    private void registrarProceso(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        Proceso p = new Proceso();
        p.setEmpleado(request.getParameter("txtEmpleado").toUpperCase());
        ArrayList<TareaProceso> detalle = (ArrayList<TareaProceso>) sesion.getAttribute("carrito");
        boolean rpta = ProcesoDB.insertar_Proceso(p, detalle);

        if (rpta) {
            request.getSession().removeAttribute("carrito");
            response.sendRedirect("home.jsp");
        } else {
            response.sendRedirect("registrarProceso.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
