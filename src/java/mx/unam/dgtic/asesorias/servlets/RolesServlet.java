/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.unam.dgtic.asesorias.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mx.unam.dgtic.asesorias.servicios.RolesService;
import mx.unam.dgtic.modelo.dto.RolDto;

/**
 *
 * @author alexis.suarez
 */
public class RolesServlet extends HttpServlet {

    private static final String CONTROLLER_PATH = "/controller";
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
        
        if(request.getParameter("editarId") != null) {
            request.getSession().setAttribute("rolDto", RolesService.getInstance().obtener(Short.parseShort(request.getParameter("editarId"))));
        } else {
            if(request.getParameter("borrarId") != null) {
                RolesService.getInstance().eliminar(Short.parseShort(request.getParameter("borrarId")));
            } else {
                RolDto r = RolesService.validar(request);
                if(r != null) {
                    RolesService.getInstance().guardar(r);
                    request.getSession().setAttribute("rolDto",null);
                }
            }
        }
        
        response.sendRedirect(response.encodeURL(request.getContextPath() + CONTROLLER_PATH + "?accion=roles"));
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
