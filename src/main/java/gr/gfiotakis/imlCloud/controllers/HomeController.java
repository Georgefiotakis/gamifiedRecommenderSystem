package gr.gfiotakis.imlCloud.controllers;

import com.fasterxml.jackson.core.JsonProcessingException;
import gr.gfiotakis.imlCloud.model.gui.Course;
import gr.gfiotakis.imlCloud.model.gui.ProsumerInformation;
import org.keycloak.AuthorizationContext;
import org.keycloak.KeycloakSecurityContext;
import org.keycloak.adapters.RefreshableKeycloakSecurityContext;
import org.keycloak.adapters.springsecurity.account.SimpleKeycloakAccount;
import org.keycloak.adapters.springsecurity.token.KeycloakAuthenticationToken;
import org.keycloak.representations.AccessToken;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import sun.java2d.pipe.SpanShapeRenderer;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.*;

/**
 * View Controller that handles requests for the application home page.
 */
@Controller
public class HomeController {	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	public static final Map<Long, Course> userClaimsMap = new LinkedHashMap<Long, Course>();
    /**
	 * View Handler for the home page of the application.
	 * @param locale locale settings
	 * @param model object used to carry data object into the view layer
	 * @return string with name of the view (e.g. jsp) to be rendered (resolved into Apache Tile name)
	 */

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The locale is {}.", locale);

		return "redirect:/userProfile";
	}

	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String dashboard(Locale locale, Model model) {
		logger.info("Welcome home! The locale is {}.", locale);

		return "dashboard";
	}

	@RequestMapping(value = "/userProfile", method = RequestMethod.GET)
	public String userProfile(Principal principal,Locale locale, Model model, HttpServletRequest request) {
		logger.info("============== User Successfully logged in!! ====================");
		logger.info("Welcome to User Profile Page!");

		KeycloakAuthenticationToken keycloakAuthenticationToken = (KeycloakAuthenticationToken) principal;
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		auth.getPrincipal();
		auth.getCredentials();
		auth.getDetails();
		auth.getPrincipal();

		String userToken;
		userToken = ((RefreshableKeycloakSecurityContext) ((SimpleKeycloakAccount) ((KeycloakAuthenticationToken) auth).getDetails()).getKeycloakSecurityContext()).getTokenString();
		String userRealm;
		userRealm = keycloakAuthenticationToken.getAccount().getKeycloakSecurityContext().getRealm();

		String studentFirstName = ((AccessToken)((RefreshableKeycloakSecurityContext)((SimpleKeycloakAccount)((KeycloakAuthenticationToken)auth).getDetails()).getKeycloakSecurityContext()).getToken()).getGivenName();
		String studentLastName = ((AccessToken)((RefreshableKeycloakSecurityContext)((SimpleKeycloakAccount)((KeycloakAuthenticationToken)auth).getDetails()).getKeycloakSecurityContext()).getToken()).getFamilyName();
		String studentEmail = ((AccessToken)((RefreshableKeycloakSecurityContext)((SimpleKeycloakAccount)((KeycloakAuthenticationToken)auth).getDetails()).getKeycloakSecurityContext()).getToken()).getEmail();
		String studentId = ((AccessToken)((RefreshableKeycloakSecurityContext)((SimpleKeycloakAccount)((KeycloakAuthenticationToken)auth).getDetails()).getKeycloakSecurityContext()).getToken()).getId();
		String studentUserName = ((AccessToken)((RefreshableKeycloakSecurityContext)((SimpleKeycloakAccount)((KeycloakAuthenticationToken)auth).getDetails()).getKeycloakSecurityContext()).getToken()).getPreferredUsername();

		model.addAttribute("studentId",studentId);
		model.addAttribute("studentFirstName",studentFirstName);
		model.addAttribute("studentLastName",studentLastName);
		model.addAttribute("studentEmail",studentEmail);
		model.addAttribute("studentUserName",studentUserName);

		Map<String, Object> attributesMap = new HashMap<String, Object>();
		attributesMap = ((SimpleKeycloakAccount) ((KeycloakAuthenticationToken) auth).getDetails()).getKeycloakSecurityContext().getIdToken().getOtherClaims();

		String userClaims = "";
		String userAttributes = "";

		for (Map.Entry<String, Object> entry : attributesMap.entrySet()) {
			System.out.println(entry.getKey() + " : " + entry.getValue());
			logger.info(entry.getKey() + " : " + entry.getValue());
			userClaims = userClaims + entry.getKey() + "_" + entry.getValue() + "-";
//			userClaims = userClaims + entry.getValue() + "-";
			userAttributes = userClaims.substring(0, userClaims.length() - 1);
		}

		String[] splittedUserAttributes = userAttributes.split("-");

		String studentAge = "";
		String studentSchoolName = "";

		for (int i = 0; i < splittedUserAttributes.length; i++) {

			if (splittedUserAttributes[i].toLowerCase().contains("age")) {
				studentAge = splittedUserAttributes[i].split("_")[1];
			}

			if (splittedUserAttributes[i].toLowerCase().contains("school")) {
				studentSchoolName = splittedUserAttributes[i].split("_")[1];
			}
		}

		model.addAttribute("studentAge",studentAge);
		model.addAttribute("studentSchoolName",studentSchoolName);

		return "userProfile";
	}


	@RequestMapping(value = "/prosumerInfo", method = RequestMethod.GET)
	public String prosumerInfo(Principal principal, Locale locale, Model model,HttpServletRequest request) {
		logger.info("Welcome to prosumerInfo page!");

		return "prosumerInfo";
	}

	@RequestMapping(value = "/getProsumersByCountry", method = RequestMethod.GET)
	public @ResponseBody
	List<ProsumerInformation> mapResponse(@RequestParam(value = "country_id") int country_id) {

		List<ProsumerInformation> pinfo = new ArrayList<>();

		ProsumerInformation prosumerInformation = new ProsumerInformation();
		prosumerInformation.setLongtitude("23.756862");
		prosumerInformation.setLatitude("38.018748");
		prosumerInformation.setProsumerName("GFio");

		prosumerInformation.setProsumerType("Residential");

		prosumerInformation.setProsumerDeviceMeteringType("res1");
		prosumerInformation.setValue("1600");
		prosumerInformation.setTimestamp("12/08/2020");
		pinfo.add(prosumerInformation);

		ProsumerInformation prosumerInformation1 = new ProsumerInformation();
		prosumerInformation1.setLongtitude("23.764471");
		prosumerInformation1.setLatitude("37.983805");
		prosumerInformation1.setProsumerType("Residential");
		prosumerInformation1.setProsumerName("KV");
		prosumerInformation1.setProsumerDeviceMeteringType("res2");
		prosumerInformation1.setValue("4600");
		prosumerInformation1.setTimestamp("12/08/2020");
		pinfo.add(prosumerInformation1);

		ProsumerInformation prosumerInformation2 = new ProsumerInformation();
		prosumerInformation2.setLongtitude("23.697650");
		prosumerInformation2.setLatitude("38.008486");
		prosumerInformation2.setProsumerType("Commercial");
		prosumerInformation2.setProsumerName("KV");
		prosumerInformation2.setProsumerDeviceMeteringType("res3");
		prosumerInformation2.setValue("3200");
		prosumerInformation2.setTimestamp("12/08/2020");
		pinfo.add(prosumerInformation2);

		ProsumerInformation prosumerInformation3 = new ProsumerInformation();
		prosumerInformation3.setLongtitude("23.720311");
		prosumerInformation3.setLatitude("37.988688");
		prosumerInformation3.setProsumerType("Commercial");
		prosumerInformation3.setProsumerName("KV");
		prosumerInformation3.setProsumerDeviceMeteringType("res4");
		prosumerInformation3.setValue("4800");
		prosumerInformation3.setTimestamp("12/08/2020");
		pinfo.add(prosumerInformation3);

		ProsumerInformation prosumerInformation4 = new ProsumerInformation();
		prosumerInformation4.setLongtitude("23.733295");
		prosumerInformation4.setLatitude("37.998559");
		prosumerInformation4.setProsumerType("Commercial");
		prosumerInformation4.setProsumerName("KV");
		prosumerInformation4.setProsumerDeviceMeteringType("res5");
		prosumerInformation4.setValue("5600");
		prosumerInformation4.setTimestamp("12/08/2020");
		pinfo.add(prosumerInformation4);

		ProsumerInformation prosumerInformation5 = new ProsumerInformation();
		prosumerInformation5.setLongtitude("23.741466");
		prosumerInformation5.setLatitude("37.992307");
		prosumerInformation5.setProsumerType("Residential");
		prosumerInformation5.setProsumerName("Gourgio");
		prosumerInformation5.setProsumerDeviceMeteringType("res6");
		prosumerInformation5.setValue("2500");
		prosumerInformation5.setTimestamp("12/08/2020");
		pinfo.add(prosumerInformation5);
		return pinfo;
	}
}
