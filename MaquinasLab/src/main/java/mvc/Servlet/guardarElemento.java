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
import mvc.Controlador.AccionesPersona;
import mvc.Modelo.Persona;

/**
 *
 * @author Jaret
 */
public class guardarElemento extends HttpServlet {

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
            
            String nom, appat, apmat, sex, fechana, pass, user;
            int num_em, rol, privilegio, grupo;
            
            num_em = Integer.parseInt(request.getParameter("num_empleado"));
            nom = request.getParameter("nombre");
            appat = request.getParameter("appat");
            apmat = request.getParameter("apmat");
            sex = request.getParameter("sexo");
            fechana = request.getParameter("fecha_nac");
            user = request.getParameter("usuario");
            pass = request.getParameter("password");
            rol = Integer.parseInt(request.getParameter("rol"));
            grupo = Integer.parseInt(request.getParameter("grupo"));
                                    
            
            Persona p = new Persona();
            
            p.setEmpleado_num(num_em);
            p.setPersona_nombre(nom);
            p.setPersona_appat(appat);
            p.setPersona_apmat(apmat);
            p.setPersona_sexo(sex);
            p.setPersona_fechaNacimiento(fechana);
            p.setPersona_user(user);
            p.setPersona_password(pass);
            p.setGrupo_id(grupo);
            p.setRol_id(rol);
            
            
            if(rol == 1 ){
                p.setPrivilegio_id(privilegio = 1);
            }else if(rol == 2){
                p.setPrivilegio_id(privilegio = 3);
            }else if(rol == 3){
                p.setPrivilegio_id(privilegio = 5);
            }else if(rol == 4){
                p.setPrivilegio_id(privilegio = 7);
            }
            
            
            //ejecuto la querry
            
            int estatus = AccionesPersona.registrarDocente(p);
            
            if(estatus > 0){
                response.sendRedirect("index.html");
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
