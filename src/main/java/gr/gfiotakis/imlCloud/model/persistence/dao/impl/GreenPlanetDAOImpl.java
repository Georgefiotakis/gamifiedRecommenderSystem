package gr.gfiotakis.imlCloud.model.persistence.dao.impl;

import gr.gfiotakis.imlCloud.model.persistence.GreenPlanet;
import gr.gfiotakis.imlCloud.model.persistence.dao.GreenPlanetDAO;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Repository
@EnableTransactionManagement
public class GreenPlanetDAOImpl implements GreenPlanetDAO {
    private static final Logger logger = LoggerFactory.getLogger(GreenPlanet.class);

    @Autowired
    private SessionFactory sessionFactory;

    private Session getSession() {
        return this.sessionFactory.getCurrentSession();
    }

    @Override
    public void saveGreenPlanetAnswers(GreenPlanet greenPlanet) {
        getSession().save(greenPlanet);
    }
}
