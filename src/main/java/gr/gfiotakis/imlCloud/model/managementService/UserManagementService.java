package gr.gfiotakis.imlCloud.model.managementService;

import gr.gfiotakis.imlCloud.model.persistence.User;

import java.util.List;

public interface UserManagementService {
    void saveUser(User user);
    public List<User> getUserbyUsername(String username);
    List<User> getAllUsers();
}
