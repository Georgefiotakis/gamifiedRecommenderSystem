package gr.gfiotakis.imlCloud.model.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.security.web.util.matcher.RequestMatcher;

import javax.servlet.http.HttpServletRequest;
import java.util.regex.Pattern;

/**
 * Created by pandriopoulos on 17/02/17.
 */
public class CsrfSecurityRequestMatcher implements RequestMatcher {
    private static final Logger logger = LoggerFactory.getLogger(CsrfSecurityRequestMatcher.class);

    // Always allow the HTTP GET method
    private Pattern allowedMethods = Pattern.compile("^GET$");
//    private Pattern allowedMethods2 = Pattern.compile("^POST$");

    // Disable CSFR protection on the following urls:
    private AntPathRequestMatcher[] requestMatchers = {
//            new AntPathRequestMatcher("/login"),
//            new AntPathRequestMatcher("/logout"),
//            new AntPathRequestMatcher("/verify/**")
            new AntPathRequestMatcher("/services/**")
    };

    @Override
    public boolean matches(HttpServletRequest request) {
        // Skip allowed methods
        if (allowedMethods.matcher(request.getMethod()).matches()) {
            return false;
        }

//        if (allowedMethods2.matcher(request.getMethod()).matches()) {
//            return false;
//        }

        // If the request match one url the CSFR protection will be disabled
        for (AntPathRequestMatcher rm : requestMatchers) {
            if (rm.matches(request)) { return false; }
        }

        return true;
    } // method matches
}
