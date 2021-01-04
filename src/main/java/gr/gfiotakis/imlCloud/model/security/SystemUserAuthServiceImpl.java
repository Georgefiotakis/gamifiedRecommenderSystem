package gr.gfiotakis.imlCloud.model.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by pandriopoulos on 13/02/17.
 */
@Component
@Scope("session")
public class SystemUserAuthServiceImpl implements UserDetailsService {
    private static final Logger logger = LoggerFactory.getLogger(SystemUserAuthServiceImpl.class);

//    @Autowired
//    private SystemUserManagementService systemUserManagementService;


    @Override
    @Transactional(readOnly=true)
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        logger.info("--------- Load User By Username ---------");
//        SystemUser systemUser = null;

//        List<GrantedAuthority> authorities = buildUserAuthority(systemUser.getSystemUserRole());
//        return new org.springframework.security.core.userdetails.User(systemUser.getUsername(),systemUser.getPassword(),systemUser.isActive(),true, true, true, authorities);
        return null;
    }

    private List<GrantedAuthority> buildUserAuthority() {
//    private List<GrantedAuthority> buildUserAuthority(SystemUserRole userRole) {

        Set<GrantedAuthority> setAuths = new HashSet<GrantedAuthority>();

        // Build user's authorities
//        setAuths.add(new SimpleGrantedAuthority(userRole.getName()));

        List<GrantedAuthority> Result = new ArrayList<GrantedAuthority>(setAuths);

        return Result;
    }
}
