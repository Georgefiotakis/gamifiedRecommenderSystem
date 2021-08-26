package gr.gfiotakis.imlCloud.model.persistence.dao;

import gr.gfiotakis.imlCloud.model.persistence.*;

import java.util.List;

public interface UserDAO {

    void saveUser(User user);
    public List<User> getUserbyUsername(String username);
    List<User> getAllUsers();
    void updateCategoryOneLessonOne(Integer userId, Integer lessonCompleted);
    void updateCategoryOneLessonTwo(Integer userId, Integer lessonCompleted);
    void updateCategoryOneLessonThree(Integer userId, Integer lessonCompleted);
    void updateCategoryTwoLessonOne(Integer userId, Integer lessonCompleted);
    void updateCategoryTwoLessonTwo(Integer userId, Integer lessonCompleted);
    void updateCategoryTwoLessonThree(Integer userId, Integer lessonCompleted);
    void updateCategoryThreeLessonOne(Integer userId, Integer lessonCompleted);
    void updateCategoryThreeLessonTwo(Integer userId, Integer lessonCompleted);
    void updateCategoryThreeLessonThree(Integer userId, Integer lessonCompleted);
    void updateCategoryFourLessonOne(Integer userId, Integer lessonCompleted);
    void updateCategoryFourLessonTwo(Integer userId, Integer lessonCompleted);
    void updateCategoryFourLessonThree(Integer userId, Integer lessonCompleted);
    void saveCategoryOne(CategoryOne categoryOne);
    void saveCategoryTwo(CategoryTwo categoryTwo);
    void saveCategoryThree(CategoryThree categoryThree);
    void saveCategoryFour(CategoryFour categoryFour);
    void updateUserCoins(Integer userId , Integer xp);
    Integer getUserCurrentXP(Integer userId);
    CategoryOne getCategoryOneLessonsByUserId(Integer userId);
    CategoryTwo getCategoryTwoLessonsByUserId(Integer userId);
    CategoryThree getCategoryThreeLessonsByUserId(Integer userId);
    CategoryFour getCategoryFourLessonsByUserId(Integer userId);
    void updateUserStars(Integer userId);
}
