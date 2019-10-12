/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.unam.dgtic.asesorias.servlets;

import java.util.List;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import mx.unam.dgtic.modelo.dto.UrlItem;
import mx.unam.dgtic.asesorias.servicios.CatalogosService;

/**
 *
 * @author JAVA
 */
public class CatalogosServlet extends HttpServlet {
    
    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        List<UrlItem> urlItems = CatalogosService.getInstance().getUrlItems();
        config.getServletContext().setAttribute("urlItems", urlItems);
    }    

}
