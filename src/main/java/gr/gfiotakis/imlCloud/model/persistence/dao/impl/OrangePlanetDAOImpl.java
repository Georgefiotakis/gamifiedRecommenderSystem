package gr.gfiotakis.imlCloud.model.persistence.dao.impl;

import gr.gfiotakis.imlCloud.model.persistence.OrangePlanet;
import gr.gfiotakis.imlCloud.model.persistence.dao.OrangePlanetDAO;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Repository
@EnableTransactionManagement
public class OrangePlanetDAOImpl implements OrangePlanetDAO {
    private static final Logger logger = LoggerFactory.getLogger(OrangePlanet.class);

    @Autowired
    private SessionFactory sessionFactory;

    private Session getSession() {
        return this.sessionFactory.getCurrentSession();
    }

    @Override
    public void saveOrangePlanetAnswers(OrangePlanet orangePlanet) {
        getSession().save(orangePlanet);
    }
}
