/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.unam.dgtic.asesorias.servicios;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import mx.unam.dgtic.modelo.dao.UsuarioDao;
import mx.unam.dgtic.modelo.dao.UsuarioDaoJdbc;
import mx.unam.dgtic.modelo.dto.UsuarioDto;

/**
 *
 * @author JAVA
 */
public class UsuariosService {
    private static UsuarioDao dao;
    private static UsuariosService instance;
    
    private UsuariosService() {
        dao = new UsuarioDaoJdbc();
    }
    
    public static UsuariosService getInstance() {
        if(instance == null) 
            instance = new UsuariosService();
        return instance;
    }
    
    public static UsuarioDto validar(HttpServletRequest request) {
        String errorUsername = "* El campo Nombre de usuario es obligatorio y debe contener menos de 32 caracteres.";
        String errorNombre = "* El campo Nombre es obligatorio y debe contener menos de 32 caracteres.";
        String errorApellidos = "* El campo Apellidos es obligatorio y debe contener menos de 64 caracteres.";
        String errorPassword = "* El campo Contraseña es obligatorio, debe contener menos de 64 caracteres y debe coincidir con la confirmación.";
        String errorEmail = "* El campo E-mail es obligatorio, debe contener menos de 128 caracteres y debe ser una dirección de correo electrónico válida.";
        
        UsuarioDto u = new UsuarioDto();
        u.setUsername(request.getParameter("username"));
        u.setNombre(request.getParameter("nombre"));
        u.setApellidos(request.getParameter("apellidos"));
        u.setPassword(request.getParameter("password"));
        u.setEmail(request.getParameter("email"));
        u.setHabilitado("1".equals(request.getParameter("habilitado").toString()));
        
        boolean error = false;
        
        if( error |= (u.getUsername() == null || u.getUsername().isEmpty() || u.getUsername().length() > 32))
            request.getSession().setAttribute("errorUsername",errorUsername);
        else
            request.getSession().setAttribute("errorUsername",null);
        
        if( error |= (u.getNombre() == null || u.getNombre().isEmpty() || u.getNombre().length() > 32))
            request.getSession().setAttribute("errorNombre",errorNombre);
        else
            request.getSession().setAttribute("errorNombre",null);
            
        if( error |= (u.getApellidos() == null || u.getApellidos().isEmpty() || u.getApellidos().length() > 64))
            request.getSession().setAttribute("errorApellidos",errorApellidos);
        else
            request.getSession().setAttribute("errorApellidos",null);
        
        if( error |= (u.getPassword() == null || u.getPassword().isEmpty() || u.getPassword().length() > 64 || !u.getPassword().equals(request.getParameter("confirmacion").toString())))
            request.getSession().setAttribute("errorPassword",errorPassword);
        else
            request.getSession().setAttribute("errorPassword",null);
        
        if( error |= (u.getEmail() == null || u.getEmail().isEmpty() || u.getEmail().length() > 128 || !u.getEmail().matches("([A-Za-z0-9._-])+@([A-Za-z0-9._-])+\\.([A-Za-z0-9._-]{2,4})")))
            request.getSession().setAttribute("errorEmail",errorEmail);
        else
            request.getSession().setAttribute("errorEmail",null);
        
        if(!error)
            return u;
        else
            return null;
    }
    
    public UsuarioDto guardar(UsuarioDto dto) {
        return dao.guardar(dto);
    }
    
    public UsuarioDto obtener(String username) {
        return dao.obtener(username);
    }
    
    public List<UsuarioDto> obtenerTodos() {
        return dao.obtenerTodos();
    }
    
    public UsuarioDto eliminar(String username) {
        return dao.eliminar(username);
    }
    
}
