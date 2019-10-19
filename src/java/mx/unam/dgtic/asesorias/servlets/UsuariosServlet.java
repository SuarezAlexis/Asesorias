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
import mx.unam.dgtic.asesorias.servicios.UsuariosService;
import mx.unam.dgtic.modelo.dto.UsuarioDto;

/**
 *
 * @author JAVA
 */
public class UsuariosServlet extends HttpServlet {

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
        String editarUsername = request.getParameter("editarUsername");
        String borrarUsername = request.getParameter("borrarUsername");
        
        if(editarUsername != null) {
            request.getSession().setAttribute("usuarioDto", UsuariosService.getInstance().obtener(editarUsername));
        } else {
            if(borrarUsername != null) {
                UsuariosService.getInstance().eliminar(borrarUsername);
            } else {
                UsuarioDto u = UsuariosService.validar(request);
                if(u != null) {
                    UsuariosService.getInstance().guardar(u);
                    request.getSession().setAttribute("usuarioDto",null);
                }
            }
        }
        
        response.sendRedirect(response.encodeURL(request.getContextPath() + CONTROLLER_PATH + "?accion=usuarios"));
        
    }

}
