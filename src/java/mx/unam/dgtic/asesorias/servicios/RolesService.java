/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.unam.dgtic.asesorias.servicios;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import mx.unam.dgtic.modelo.dao.RolDao;
import mx.unam.dgtic.modelo.dao.RolDaoJdbc;
import mx.unam.dgtic.modelo.dto.RolDto;

/**
 *
 * @author JAVA
 */
public class RolesService {
    private static RolDao dao;
    private static RolesService instance;
    
    private RolesService() {
        dao = new RolDaoJdbc();
    }
    
    public static RolesService getInstance() {
        if(instance == null)
            instance = new RolesService();
        return instance;
    }
    
    public static RolDto obtener(HttpServletRequest request) {
        RolDto rol = new RolDto();
        rol.setId(Short.parseShort(request.getParameter("id")));
        rol.setNombre(request.getParameter("nombre"));
        rol.setDescripcion(request.getParameter("descripcion"));
        rol.setHabilitado("on".equals(request.getParameter("habilitado")));
        return rol;
    }
    
    public static RolDto validar(HttpServletRequest request) {
        return obtener(request);
    }
    
    public RolDto guardar(RolDto rol) {
        return dao.guardar(rol);
    }
    
    public RolDto obtener(short id) {
        return dao.obtener(id);
    }
    
    public List<RolDto> obtenerTodos() {
        return dao.obtenerTodos();
    }
    
    public RolDto eliminar(short id) {
        return dao.eliminar(id);
    }
}
