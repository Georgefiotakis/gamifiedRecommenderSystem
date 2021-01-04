package gr.gfiotakis.imlCloud.controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Locale;

/**
 * Created by pandriopoulos on 5/25/15.
 */
@Controller
public class AuthenticationController {
    private static final Logger logger = LoggerFactory.getLogger(AuthenticationController.class);

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Locale locale, Model model) {
        logger.info("Login controller");

        return "login";
    }

    @RequestMapping(value = "/loginAccessDenied", method = RequestMethod.GET)
    public String loginAccessDenied(Locale locale, Model model) {
        logger.info("Login Access Denied");
        model.addAttribute("errorMsg", "Access denied.");

        return "login";
    }

    @RequestMapping(value = "/loginError", method = RequestMethod.GET)
    public String loginError(Locale locale, Model model) {
        logger.info("Login Error");
        model.addAttribute("errorMsg", "The username and password do not match.");
        return "login";
    }

    @RequestMapping(value = "/j_spring_security_check", method = RequestMethod.GET)
    public String j_spring_security_check(Locale locale, Model model) {
        logger.info("j_spring_security_check Error");
//        model.addAttribute("errorMsg", "The username and password do not match.");
        return "login";
    }

}
