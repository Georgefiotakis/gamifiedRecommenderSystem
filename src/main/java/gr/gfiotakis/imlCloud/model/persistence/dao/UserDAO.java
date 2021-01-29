package gr.gfiotakis.imlCloud.model.persistence.dao;

import gr.gfiotakis.imlCloud.model.persistence.Recommendation;
import gr.gfiotakis.imlCloud.model.persistence.User;

import java.util.List;

public interface UserDAO {

    void saveUser(User user);
    public List<User> getUserbyUsername(String username);
    List<User> getAllUsers();
}
