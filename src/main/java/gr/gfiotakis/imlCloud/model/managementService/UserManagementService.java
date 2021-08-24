package gr.gfiotakis.imlCloud.model.managementService;

import gr.gfiotakis.imlCloud.model.persistence.*;

import java.util.List;

public interface UserManagementService {
    void saveUser(User user);
    public List<User> getUserbyUsername(String username);
    List<User> getAllUsers();
    void updateCategoryOne(Integer userId, Boolean lessonCompleted);
    void updateCategoryTwo(Integer userId, Boolean lessonCompleted);
    void updateCategoryThree(Integer userId, Boolean lessonCompleted);
    void updateCategoryFour(Integer userId, Boolean lessonCompleted);
    void saveCategoryOne(CategoryOne categoryOne);
    void saveCategoryTwo(CategoryTwo categoryTwo);
    void saveCategoryThree(CategoryThree categoryThree);
    void saveCategoryFour(CategoryFour categoryFour);
    void updateUserCoins(Integer userId , Integer xp);
    Integer getUserCurrentXP(Integer userId);
}
