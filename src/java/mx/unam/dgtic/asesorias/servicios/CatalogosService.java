/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.unam.dgtic.asesorias.servicios;

import java.util.List;
import mx.unam.dgtic.modelo.dao.UrlItemDao;
import mx.unam.dgtic.modelo.dao.UrlItemDaoJdbc;
import mx.unam.dgtic.modelo.dto.UrlItem;

/**
 *
 * @author JAVA
 */
public class CatalogosService {
    private static UrlItemDao urlDao;
    private static CatalogosService instance;
    
    private CatalogosService() {
        urlDao = new UrlItemDaoJdbc();
    }
    
    public static CatalogosService getInstance() {
        if(instance == null)
            instance = new CatalogosService();
        return instance;
    }
    
    public List<UrlItem> getUrlItems() {
        return urlDao.obtenerHabilitados();
    }
}
