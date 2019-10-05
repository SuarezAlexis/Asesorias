/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.unam.dgtic.asesorias.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import mx.unam.dgtic.modelo.dto.UsuarioDto;

/**
 *
 * @author JAVA
 */
public class LoginServlet extends HttpServlet {
    
    private static final String LOGIN_PATH = "/login/login.jsp";
    private static final String CONTROLLER_PATH = "/controller";
    private static final String PARAM_NAME = "accion";
    
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
        String accion = request.getParameter(PARAM_NAME);
        if(accion != null && ! accion.isEmpty()) {
            
        } else {
            request.getRequestDispatcher(LOGIN_PATH).forward(request,response);
        }
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
        //Validación de datos
        Map<String, Object> resultado = validaLogin(request);
        
        if (resultado.get("Usuario") != null) {
            request.getSession().setAttribute("usuario", resultado.get("Usuario"));
            response.sendRedirect(response.encodeURL(request.getContextPath() + CONTROLLER_PATH));
        } else {
            request.getSession().setAttribute("errorUsername", resultado.get("errorUsername"));
            request.getSession().setAttribute("errorPassword", resultado.get("errorPassword"));
            response.sendRedirect(response.encodeURL(request.getContextPath() + LOGIN_PATH));
        }
        
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
    
    
    private Map<String, Object> validaLogin(HttpServletRequest request) {
        Map<String, Object> r = new HashMap<>();
        UsuarioDto u = null;
        String errorUsername = "* El nombre de usuario es incorrecto.";
        String errorPassword = "* La contraseña es incorrecta.";
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if(username != null && !username.isEmpty())
        {
            if(username.equals("java"))
            {
                if(password != null && !password.isEmpty())
                {
                    if(password.equals("123"))
                    {
                        u = new UsuarioDto();
                        u.setUsername(username);
                        u.setPassword(password);
                        r.put("Usuario",u);
                    } else { r.put("errorPassword", errorPassword); }
                } else { r.put("errorPassword", errorPassword); }
            } else { r.put("errorUsername", errorUsername); }
        } else {
            r.put("errorUsername", errorUsername);
        }
        
        return r;
    }

}
