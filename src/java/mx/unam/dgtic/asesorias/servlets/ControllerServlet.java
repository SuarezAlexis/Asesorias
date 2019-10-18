/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.unam.dgtic.asesorias.servlets;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mx.unam.dgtic.asesorias.servicios.UsuariosService;
import mx.unam.dgtic.modelo.dto.UrlItem;

/**
 *
 * @author JAVA
 */
public class ControllerServlet extends HttpServlet {
    
    private static final String MAIN_PATH = "/site/webapp.jsp";
    private static final String LOGIN_PATH = "/login";
    private static final String PARAM_NAME = "accion";
    
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
        String accion = request.getParameter(PARAM_NAME);
        if(request.getSession().getAttribute("usuario") != null) {
            if(accion != null && !accion.isEmpty()) {
                switch(accion) {
                    case "usuarios":
                        request.setAttribute("usuarios", UsuariosService.getInstance().obtenerTodos());
                        break;
                }
            }
            request.getRequestDispatcher(MAIN_PATH).forward(request, response);
        }
        else
            request.getRequestDispatcher(LOGIN_PATH).forward(request, response);
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
