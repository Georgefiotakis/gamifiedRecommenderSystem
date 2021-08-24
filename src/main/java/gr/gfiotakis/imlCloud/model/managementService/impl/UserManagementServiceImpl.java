package gr.gfiotakis.imlCloud.model.managementService.impl;

import gr.gfiotakis.imlCloud.model.managementService.UserManagementService;
import gr.gfiotakis.imlCloud.model.persistence.*;
import gr.gfiotakis.imlCloud.model.persistence.dao.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public class UserManagementServiceImpl implements UserManagementService {
    @Autowired
    private UserDAO userDAO;

    @Override
    @Transactional
    public void saveUser(User user) {
        userDAO.saveUser(user);
    }

    @Override
    @Transactional
    public List<User> getUserbyUsername(String username) {
        return userDAO.getUserbyUsername(username);
    }

    @Override
    @Transactional
    public List<User> getAllUsers() {
        return userDAO.getAllUsers();
    }

    @Override
    public void updateCategoryOne(Integer userId, Boolean lessonCompleted) {
        userDAO.updateCategoryOne(userId, lessonCompleted);
    }

    @Override
    public void updateCategoryTwo(Integer userId, Boolean lessonCompleted) {
        userDAO.updateCategoryTwo(userId, lessonCompleted);
    }

    @Override
    public void updateCategoryThree(Integer userId, Boolean lessonCompleted) {
        userDAO.updateCategoryThree(userId, lessonCompleted);
    }

    @Override
    public void updateCategoryFour(Integer userId, Boolean lessonCompleted) {
        userDAO.updateCategoryFour(userId, lessonCompleted);
    }

    @Override
    @Transactional
    public void saveCategoryOne(CategoryOne categoryOne) {
        userDAO.saveCategoryOne(categoryOne);
    }

    @Override
    @Transactional
    public void saveCategoryTwo(CategoryTwo categoryTwo) {
        userDAO.saveCategoryTwo(categoryTwo);
    }

    @Override
    @Transactional
    public void saveCategoryThree(CategoryThree categoryThree) {
        userDAO.saveCategoryThree(categoryThree);
    }

    @Override
    @Transactional
    public void saveCategoryFour(CategoryFour categoryFour) {
        userDAO.saveCategoryFour(categoryFour);
    }

    @Override
    @Transactional
    public void updateUserCoins(Integer userId, Integer xp) {
        userDAO.updateUserCoins(userId, xp);
    }

    @Override
    @Transactional
    public Integer getUserCurrentXP(Integer userId) {
        return userDAO.getUserCurrentXP(userId);
    }
}
