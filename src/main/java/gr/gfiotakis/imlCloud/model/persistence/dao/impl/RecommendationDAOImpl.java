package gr.gfiotakis.imlCloud.model.persistence.dao.impl;

import gr.gfiotakis.imlCloud.model.persistence.Recommendation;
import gr.gfiotakis.imlCloud.model.persistence.RecommendationAnalytics;
import gr.gfiotakis.imlCloud.model.persistence.Survey;
import gr.gfiotakis.imlCloud.model.persistence.User;
import gr.gfiotakis.imlCloud.model.persistence.dao.RecommendationDAO;
import gr.gfiotakis.imlCloud.model.persistence.dao.UserDAO;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Tuple;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.Root;
import java.util.List;

@Repository
@EnableTransactionManagement
public class RecommendationDAOImpl implements RecommendationDAO {

    @PersistenceContext
    EntityManager em;
    private static final Logger logger = LoggerFactory.getLogger(UserDAO.class);

    @Autowired
    private SessionFactory sessionFactory;

    private Session getSession() {
        return this.sessionFactory.getCurrentSession();
    }

    @Override
    public Recommendation saveRecommendation(Recommendation recommendation) {
        getSession().save(recommendation);
        return recommendation;
    }

    @Override
    public List<Recommendation> getRecommendations(){
        CriteriaBuilder builder = getSession().getCriteriaBuilder();
        CriteriaQuery<Recommendation> criteria = builder.createQuery(Recommendation.class);
        Root<Recommendation> rootAsset = criteria.from(Recommendation.class);

        List<Recommendation> recommendationList = getSession().createQuery(criteria).getResultList();

        return recommendationList;
    }
}
