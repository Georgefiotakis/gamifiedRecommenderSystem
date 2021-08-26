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

    @Override
    @Transactional
    public CategoryOne getCategoryOneLessonsByUserId(Integer userId) {
        return userDAO.getCategoryOneLessonsByUserId(userId);
    }

    @Override
    @Transactional
    public CategoryTwo getCategoryTwoLessonsByUserId(Integer userId) {
        return userDAO.getCategoryTwoLessonsByUserId(userId);
    }

    @Override
    @Transactional
    public CategoryThree getCategoryThreeLessonsByUserId(Integer userId) {
        return userDAO.getCategoryThreeLessonsByUserId(userId);
    }

    @Override
    @Transactional
    public CategoryFour getCategoryFourLessonsByUserId(Integer userId) {
        return userDAO.getCategoryFourLessonsByUserId(userId);
    }

    @Override
    @Transactional
    public void updateCategoryOneLessonOne(Integer userId, Integer lessonCompleted) {
        userDAO.updateCategoryOneLessonOne(userId, lessonCompleted);
    }

    @Override
    @Transactional
    public void updateCategoryOneLessonTwo(Integer userId, Integer lessonCompleted) {
        userDAO.updateCategoryOneLessonTwo(userId,lessonCompleted);
    }

    @Override
    @Transactional
    public void updateCategoryOneLessonThree(Integer userId, Integer lessonCompleted) {
        userDAO.updateCategoryOneLessonThree(userId,lessonCompleted);
    }

    @Override
    @Transactional
    public void updateCategoryTwoLessonOne(Integer userId, Integer lessonCompleted) {
        userDAO.updateCategoryTwoLessonOne(userId, lessonCompleted);
    }

    @Override
    @Transactional
    public void updateCategoryTwoLessonTwo(Integer userId, Integer lessonCompleted) {
        userDAO.updateCategoryTwoLessonTwo(userId, lessonCompleted);
    }

    @Override
    @Transactional
    public void updateCategoryTwoLessonThree(Integer userId, Integer lessonCompleted) {
        userDAO.updateCategoryTwoLessonThree(userId, lessonCompleted);
    }

    @Override
    @Transactional
    public void updateCategoryThreeLessonOne(Integer userId, Integer lessonCompleted) {
        userDAO.updateCategoryThreeLessonOne(userId, lessonCompleted);
    }

    @Override
    @Transactional
    public void updateCategoryThreeLessonTwo(Integer userId, Integer lessonCompleted) {
        userDAO.updateCategoryThreeLessonTwo(userId, lessonCompleted);
    }

    @Override
    @Transactional
    public void updateCategoryThreeLessonThree(Integer userId, Integer lessonCompleted) {
        userDAO.updateCategoryThreeLessonThree(userId, lessonCompleted);
    }

    @Override
    @Transactional
    public void updateCategoryFourLessonOne(Integer userId, Integer lessonCompleted) {
        userDAO.updateCategoryFourLessonOne(userId, lessonCompleted);
    }

    @Override
    @Transactional
    public void updateCategoryFourLessonTwo(Integer userId, Integer lessonCompleted) {
        userDAO.updateCategoryFourLessonTwo(userId, lessonCompleted);
    }

    @Override
    @Transactional
    public void updateCategoryFourLessonThree(Integer userId, Integer lessonCompleted) {
        userDAO.updateCategoryFourLessonThree(userId, lessonCompleted);
    }

    @Override
    @Transactional
    public void updateUserStars(Integer userId) {
        userDAO.updateUserStars(userId);
    }
}
