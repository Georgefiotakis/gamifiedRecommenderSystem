package gr.gfiotakis.imlCloud.model.persistence.dao.impl;

import gr.gfiotakis.imlCloud.model.persistence.PurplePlanet;
import gr.gfiotakis.imlCloud.model.persistence.dao.PurplePlanetDAO;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Repository
@EnableTransactionManagement
public class PurplePlanetDAOImpl implements PurplePlanetDAO {
    private static final Logger logger = LoggerFactory.getLogger(PurplePlanet.class);

    @Autowired
    private SessionFactory sessionFactory;

    private Session getSession() {
        return this.sessionFactory.getCurrentSession();
    }

    @Override
    public void savePurplePlanetAnswers(PurplePlanet purplePlanet) {
        getSession().save(purplePlanet);
    }
}
