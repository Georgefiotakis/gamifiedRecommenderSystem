package gr.gfiotakis.imlCloud.model.managementService.impl;

import gr.gfiotakis.imlCloud.model.managementService.UserManagementService;
import gr.gfiotakis.imlCloud.model.persistence.User;
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
}
