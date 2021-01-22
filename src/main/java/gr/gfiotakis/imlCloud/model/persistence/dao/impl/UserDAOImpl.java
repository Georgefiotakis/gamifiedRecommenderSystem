package gr.gfiotakis.imlCloud.model.persistence.dao.impl;

import gr.gfiotakis.imlCloud.model.persistence.User;
import gr.gfiotakis.imlCloud.model.persistence.dao.UserDAO;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;

@Repository
@EnableTransactionManagement
public class UserDAOImpl implements UserDAO {
    private static final Logger logger = LoggerFactory.getLogger(UserDAO.class);

    @Autowired
    private SessionFactory sessionFactory;

    private Session getSession() {
        return this.sessionFactory.getCurrentSession();
    }

    @Override
    public void saveUser(User user) {
        getSession().save(user);
    }

    @Override
    public List<User> getUserbyUsername(String username) {

        CriteriaBuilder builder = getSession().getCriteriaBuilder();
        CriteriaQuery<User> criteria = builder.createQuery(User.class);
        Root<User> rootUser = criteria.from(User.class);

        criteria.where(builder.and(
                builder.equal(rootUser.get("username"), username)
                )
        );

        List<User> userList = getSession().createQuery(criteria).getResultList();
        if(userList.isEmpty()) {
            User user = new User();
            user.setUserId(null);
            user.setUsername(null);
            userList.add(user);
        }

        return userList;
    }
}
