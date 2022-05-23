/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package mvc.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mvc.Controlador.AccionesDocente;
import mvc.Modelo.Persona;

/**
 *
 * @author Jaret
 */
public class actualizarElemento extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            int id = Integer.parseInt(request.getParameter("id2"));
            
            String nom, appat, apmat, sex, fechana, pass, user;
            int num_em;
            
            num_em = Integer.parseInt(request.getParameter("num_em2"));
            nom = request.getParameter("nom2");
            appat = request.getParameter("appat2");
            apmat = request.getParameter("apmat2");
            sex = request.getParameter("sex2");
            fechana = request.getParameter("fechanac2");
            user = request.getParameter("usuario2");
            pass = request.getParameter("password2");
            
            Persona p = new Persona();
            
            p.setPersona_id(id);
            p.setEmpleado_num(num_em);
            p.setPersona_nombre(nom);
            p.setPersona_appat(appat);
            p.setPersona_apmat(apmat);
            p.setPersona_sexo(sex);
            p.setPersona_fechaNacimiento(fechana);
            p.setPersona_user(user);
            p.setPersona_password(pass);
            
            int estatus = AccionesDocente.ActualizarDocente(p);
             
            if(estatus > 0){
                response.sendRedirect("inicio.jsp");
            }else{
                response.sendRedirect("error.jsp");
            }
          
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
