package gr.gfiotakis.imlCloud.model.persistence.dao.impl;

import gr.gfiotakis.imlCloud.model.persistence.*;
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
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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

    @Override
    public List<User> getAllUsers(){
        CriteriaBuilder builder = getSession().getCriteriaBuilder();
        CriteriaQuery<User> criteria = builder.createQuery(User.class);
        Root<User> rootAsset = criteria.from(User.class);

        List<User> userList = getSession().createQuery(criteria).getResultList();

        return userList;
    }

    @Override
    public void updateCategoryOne(Integer userId, Boolean lessonCompleted) {
        CriteriaBuilder builder = getSession().getCriteriaBuilder();
        CriteriaQuery<CategoryOne> criteria = builder.createQuery(CategoryOne.class);
        Root<CategoryOne> rootAsset = criteria.from(CategoryOne.class);

        criteria.where(builder.and(
                builder.equal(rootAsset.get("user"),userId)
        ));

        List<CategoryOne> categoryOneList = getSession().createQuery(criteria).getResultList();
        categoryOneList.get(0).setLessonOne(lessonCompleted);

        getSession().save(categoryOneList.get(0));
    }

    @Override
    public void updateCategoryTwo(Integer userId, Boolean lessonCompleted) {

    }

    @Override
    public void updateCategoryThree(Integer userId, Boolean lessonCompleted) {

    }

    @Override
    public void updateCategoryFour(Integer userId, Boolean lessonCompleted) {

    }

    @Override
    public void saveCategoryOne(CategoryOne categoryOne) {
        getSession().save(categoryOne);
    }

    @Override
    public void saveCategoryTwo(CategoryTwo categoryTwo) {
        getSession().save(categoryTwo);
    }

    @Override
    public void saveCategoryThree(CategoryThree categoryThree) {
        getSession().save(categoryThree);
    }

    @Override
    public void saveCategoryFour(CategoryFour categoryFour) {
        getSession().save(categoryFour);
    }

    @Override
    public void updateUserCoins(Integer userId, Integer xp) {

        CriteriaBuilder builder = getSession().getCriteriaBuilder();
        CriteriaQuery<User> criteria = builder.createQuery(User.class);
        Root<User> rootAsset = criteria.from(User.class);

        criteria.where(builder.and(
                builder.equal(rootAsset.get("userId"), userId)
        ));

        List<User> userList = getSession().createQuery(criteria).getResultList();
        userList.get(0).setCoins(xp);

        getSession().save(userList.get(0));
    }

    @Override
    public Integer getUserCurrentXP(Integer userId) {

        CriteriaBuilder builder = getSession().getCriteriaBuilder();
        CriteriaQuery<User> criteria = builder.createQuery(User.class);
        Root<User> rootAsset = criteria.from(User.class);

        criteria.where(builder.and(
                builder.equal(rootAsset.get("userId"), userId)
        ));

        User user = getSession().createQuery(criteria).getSingleResult();

        return user.getCoins();
    }
}
