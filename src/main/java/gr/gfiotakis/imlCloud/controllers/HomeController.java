package gr.gfiotakis.imlCloud.controllers;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import gr.gfiotakis.imlCloud.model.gui.Course;
import gr.gfiotakis.imlCloud.model.gui.RecommendationBarChart;
import gr.gfiotakis.imlCloud.model.gui.UserBarChart;
import gr.gfiotakis.imlCloud.model.managementService.*;
import gr.gfiotakis.imlCloud.model.persistence.*;
import org.json.simple.JSONObject;
import org.keycloak.adapters.RefreshableKeycloakSecurityContext;
import org.keycloak.adapters.springsecurity.account.SimpleKeycloakAccount;
import org.keycloak.adapters.springsecurity.token.KeycloakAuthenticationToken;
import org.keycloak.representations.AccessToken;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

/**
 * View Controller that handles requests for the application home page.
 */
@Controller
public class HomeController {	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	public static final Map<Long, Course> userClaimsMap = new LinkedHashMap<Long, Course>();

	@Autowired
	UserManagementService userManagementService;
	@Autowired
	SurveyManagementService surveyManagementService;
	@Autowired
	GreenPlanetManagementService greenPlanetManagementService;
	@Autowired
	PurplePlanetManagementService purplePlanetManagementService;
	@Autowired
	OrangePlanetManagementService orangePlanetManagementService;
	@Autowired
	RecommendationManagementService recommendationManagementService ;

	private Integer currentSurveyId;
	private Integer currentUserId;
	private String currentUsername;
	private String finalRecommendationPath;
	String dataScience = "Data Science";
	String graphicDesigner = "Graphic Designer";
	String softwareDeveloper = "Software Developer";
	String networkAdmin = "Network Administrator";
	String databaseAdmin = "Database Administrator";

	ArrayList<String> allSelectedPaths = new ArrayList<String>();

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The locale is {}.", locale);

		return "redirect:/userProfile";
	}

	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String dashboard(Locale locale, Model model) {
		logger.info("The student has reached the dashboard page.", locale);

		return "dashboard";
	}

	@RequestMapping(value = "/analytics", method = RequestMethod.GET)
	public String analytics(Locale locale, Model model) {
		logger.info("Student has reached the analytics page!!!", locale);

		model.addAttribute("currentUserId",currentUserId);
		model.addAttribute("currentSurveyId",currentSurveyId);

		return "analytics";
	}

	@RequestMapping(value = "/greenPlanet", method = RequestMethod.GET)
	public String greenPlanet(Locale locale, Model model) {
		logger.info("Student has reached the green planet!!!", locale);

		model.addAttribute("currentUserId",currentUserId);
		model.addAttribute("currentSurveyId",currentSurveyId);

		return "greenPlanet";
	}

	@RequestMapping(value = "/purplePlanet", method = RequestMethod.GET)
	public String purplePlanet(Locale locale, Model model) {
		logger.info("Student has reached the purple planet!!!", locale);

		model.addAttribute("currentUserId",currentUserId);
		model.addAttribute("currentSurveyId",currentSurveyId);

		return "purplePlanet";
	}

	@RequestMapping(value = "/orangePlanet", method = RequestMethod.GET)
	public String orangePlanet(Locale locale, Model model) {
		logger.info("Student has reached the orange planet!!!", locale);

		model.addAttribute("currentUserId",currentUserId);
		model.addAttribute("currentSurveyId",currentSurveyId);

		return "orangePlanet";
	}

	@RequestMapping(value = "/studentRecommendation", method = RequestMethod.GET)
	public String studentRecommendation(Locale locale, Model model) {
		logger.info("Student has reached the recommendation page!", locale);

		model.addAttribute("currentUserId",currentUserId);
		model.addAttribute("currentSurveyId",currentSurveyId);
		model.addAttribute("finalRecommendationPath",finalRecommendationPath);

		return "studentRecommendation";
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
		String studentCountry = "";

		for (int i = 0; i < splittedUserAttributes.length; i++) {

			if (splittedUserAttributes[i].toLowerCase().contains("age")) {
				studentAge = splittedUserAttributes[i].split("_")[1];
			}

			if (splittedUserAttributes[i].toLowerCase().contains("country")) {
				studentCountry = splittedUserAttributes[i].split("_")[1];
			}
		}

		model.addAttribute("studentAge",studentAge);
		model.addAttribute("studentCountry",studentCountry);

		model.addAttribute("studentId",studentId);
		model.addAttribute("studentFirstName",studentFirstName);
		model.addAttribute("studentLastName",studentLastName);
		model.addAttribute("studentEmail",studentEmail);
		model.addAttribute("studentUserName",studentUserName);

		if (userManagementService.getUserbyUsername(studentUserName).get(0).getUserId() == null) {
			User user = new User();
			user.setUsername(studentUserName);
			user.setCountry(studentCountry);
			userManagementService.saveUser(user);

			Survey survey = new Survey();
			survey.setUser(user);
			surveyManagementService.saveSurvey(survey);
			Survey savedSurvey = surveyManagementService.saveSurvey(survey);
			currentSurveyId = savedSurvey.getSurveyId();
		} else {
			Survey survey = new Survey();
			survey.setUser(userManagementService.getUserbyUsername(studentUserName).get(0));
			Survey savedSurvey = surveyManagementService.saveSurvey(survey);
			currentSurveyId = savedSurvey.getSurveyId();
		}

		currentUsername = studentUserName;
		currentUserId = userManagementService.getUserbyUsername(studentUserName).get(0).getUserId();
//		model.addAttribute("currentUserId",userManagementService.getUserbyUsername(studentUserName).get(0).getUserId());
//		model.addAttribute("currentSurveyId",currentSurveyId);



		return "userProfile";
	}

	@RequestMapping(value = "/greenPlanet/greenAnswers", method = RequestMethod.GET)
	public @ResponseBody void greenAnswers(Locale locale, Model model,
										   @RequestParam(value = "questionOne") String questionOne,
										   @RequestParam(value = "questionTwo") String questionTwo,
										   @RequestParam(value = "questionThree") String questionThree,
										   @RequestParam(value = "questionFour") String questionFour,
										   @RequestParam(value = "questionFive") String questionFive,
										   @RequestParam(value = "currentUserId") String currentUserId,
										   @RequestParam(value = "currentSurveyId") String currentSurveyId) {

		allSelectedPaths.clear();
		//Converting Strings to Integers
		int userIdtoInteger;
		userIdtoInteger = Integer.parseInt(currentUserId);
		int surveyIdtoInteger;
		surveyIdtoInteger = Integer.parseInt(currentSurveyId);

		//Checking the Answers of Question One
		if (questionOne.equals("1")) {
			allSelectedPaths.add(graphicDesigner);
		}

		if (questionOne.equals("2")) {
			allSelectedPaths.add(databaseAdmin);
		}

		if (questionOne.equals("3")) {
			allSelectedPaths.add(networkAdmin);
		}

		if (questionOne.equals("4")) {
			allSelectedPaths.add(softwareDeveloper);
		}

		if (questionOne.equals("5")) {
			allSelectedPaths.add(dataScience);
		}

		//Checking the Answers of Question Two
		if (questionTwo.equals("1")) {
			allSelectedPaths.add(graphicDesigner);
		}

		if (questionTwo.equals("2")) {
			allSelectedPaths.add(databaseAdmin);
		}

		if (questionTwo.equals("3")) {
			allSelectedPaths.add(networkAdmin);
		}

		if (questionTwo.equals("4")) {
			allSelectedPaths.add(dataScience);
		}

		if (questionTwo.equals("5")) {
			allSelectedPaths.add(softwareDeveloper);
		}

		//Checking the Answers of Question Three
		if (questionThree.equals("1")) {
			allSelectedPaths.add(dataScience);
		}

		if (questionThree.equals("2")) {
			allSelectedPaths.add(networkAdmin);
		}

		if (questionThree.equals("3")) {
			allSelectedPaths.add(graphicDesigner);
		}

		if (questionThree.equals("4")) {
			allSelectedPaths.add(softwareDeveloper);
		}

		if (questionThree.equals("5")) {
			allSelectedPaths.add(databaseAdmin);
		}

		//Checking the Answers of Question Four
		if (questionFour.equals("1")) {
			allSelectedPaths.add(graphicDesigner);
		}

		if (questionFour.equals("2")) {
			allSelectedPaths.add(networkAdmin);
		}

		if (questionFour.equals("3")) {
			allSelectedPaths.add(softwareDeveloper);
		}

		if (questionFour.equals("4")) {
			allSelectedPaths.add(dataScience);
		}

		if (questionFour.equals("5")) {
			allSelectedPaths.add(databaseAdmin);
		}

		//Checking the Answers of Question Five
		if (questionFive.equals("1")) {
			allSelectedPaths.add(graphicDesigner);
		}

		if (questionFive.equals("2")) {
			allSelectedPaths.add(dataScience);
		}

		if (questionFive.equals("3")) {
			allSelectedPaths.add(softwareDeveloper);
		}

		if (questionFive.equals("4")) {
			allSelectedPaths.add(databaseAdmin);
		}

		if (questionFive.equals("5")) {
			allSelectedPaths.add(networkAdmin);
		}

		//Initializing the GreenPlanet object in order to save the answers from the client's Ajax request.
		GreenPlanet greenPlanet = new GreenPlanet();

		greenPlanet.setQuestionOne(questionOne);
		greenPlanet.setQuestionTwo(questionTwo);
		greenPlanet.setQuestionThree(questionThree);
		greenPlanet.setQuestionFour(questionFour);
		greenPlanet.setQuestionFive(questionFive);
		User user = new User();
		user.setUserId(userIdtoInteger);
		user.setUsername(currentUsername);
		Survey survey = new Survey();
		survey.setSurveyId(surveyIdtoInteger);
		survey.setUser(user);
		greenPlanet.setSurvey(survey);
		greenPlanet.setUser(user);

		greenPlanetManagementService.saveGreenPlanetAnswers(greenPlanet);

	}

	@RequestMapping(value = "/purplePlanet/purpleAnswers", method = RequestMethod.GET)
	public @ResponseBody void purpleAnswers(Locale locale, Model model,
										   @RequestParam(value = "questionOne") String questionOne,
										   @RequestParam(value = "questionTwo") String questionTwo,
										   @RequestParam(value = "questionThree") String questionThree,
										   @RequestParam(value = "questionFour") String questionFour,
										   @RequestParam(value = "questionFive") String questionFive,
										   @RequestParam(value = "currentUserId") String currentUserId,
										   @RequestParam(value = "currentSurveyId") String currentSurveyId) {

		//Converting Strings to Integers
		int userIdtoInteger;
		userIdtoInteger = Integer.parseInt(currentUserId);
		int surveyIdtoInteger;
		surveyIdtoInteger = Integer.parseInt(currentSurveyId);

		//Checking the Answers of Question One
		if (questionOne.equals("1")) {
			allSelectedPaths.add(softwareDeveloper);
		}

		if (questionOne.equals("2")) {
			allSelectedPaths.add(networkAdmin);
		}

		if (questionOne.equals("3")) {
			allSelectedPaths.add(databaseAdmin);
		}

		if (questionOne.equals("4")) {
			allSelectedPaths.add(graphicDesigner);
		}

		if (questionOne.equals("5")) {
			allSelectedPaths.add(dataScience);
		}

		//Checking the Answers of Question Two
		if (questionTwo.equals("1")) {
			allSelectedPaths.add(graphicDesigner);
		}

		if (questionTwo.equals("2")) {
			allSelectedPaths.add(softwareDeveloper);
		}

		if (questionTwo.equals("3")) {
			allSelectedPaths.add(dataScience);
		}

		if (questionTwo.equals("4")) {
			allSelectedPaths.add(databaseAdmin);
		}

		if (questionTwo.equals("5")) {
			allSelectedPaths.add(networkAdmin);
		}

		//Checking the Answers of Question Three
		if (questionThree.equals("1")) {
			allSelectedPaths.add(networkAdmin);
		}

		if (questionThree.equals("2")) {
			allSelectedPaths.add(graphicDesigner);
		}

		if (questionThree.equals("3")) {
			allSelectedPaths.add(databaseAdmin);
		}

		if (questionThree.equals("4")) {
			allSelectedPaths.add(softwareDeveloper);
		}

		if (questionThree.equals("5")) {
			allSelectedPaths.add(dataScience);
		}

		//Checking the Answers of Question Four
		if (questionFour.equals("1")) {
			allSelectedPaths.add(dataScience);
		}

		if (questionFour.equals("2")) {
			allSelectedPaths.add(databaseAdmin);
		}

		if (questionFour.equals("3")) {
			allSelectedPaths.add(networkAdmin);
		}

		if (questionFour.equals("4")) {
			allSelectedPaths.add(softwareDeveloper);
		}

		if (questionFour.equals("5")) {
			allSelectedPaths.add(graphicDesigner);
		}

		//Checking the Answers of Question Five
		if (questionFive.equals("1")) {
			allSelectedPaths.add(dataScience);
		}

		if (questionFive.equals("2")) {
			allSelectedPaths.add(databaseAdmin);
		}

		if (questionFive.equals("3")) {
			allSelectedPaths.add(networkAdmin);
		}

		if (questionFive.equals("4")) {
			allSelectedPaths.add(softwareDeveloper);
		}

		if (questionFive.equals("5")) {
			allSelectedPaths.add(graphicDesigner);
		}

		//Initializing the GreenPlanet object in order to save the answers from the client's Ajax request.
		PurplePlanet purplePlanet = new PurplePlanet();

		purplePlanet.setQuestionOne(questionOne);
		purplePlanet.setQuestionTwo(questionTwo);
		purplePlanet.setQuestionThree(questionThree);
		purplePlanet.setQuestionFour(questionFour);
		purplePlanet.setQuestionFive(questionFive);
		User user = new User();
		user.setUserId(userIdtoInteger);
		user.setUsername(currentUsername);
		Survey survey = new Survey();
		survey.setSurveyId(surveyIdtoInteger);
		survey.setUser(user);
		purplePlanet.setSurvey(survey);
		purplePlanet.setUser(user);

		purplePlanetManagementService.savePurplePlanetAnswers(purplePlanet);

	}

	@RequestMapping(value = "/orangePlanet/orangeAnswers", method = RequestMethod.GET)
	public @ResponseBody void orangeAnswers(Locale locale, Model model,
											@RequestParam(value = "questionOne") String questionOne,
											@RequestParam(value = "questionTwo") String questionTwo,
											@RequestParam(value = "questionThree") String questionThree,
											@RequestParam(value = "questionFour") String questionFour,
											@RequestParam(value = "questionFive") String questionFive,
											@RequestParam(value = "currentUserId") String currentUserId,
											@RequestParam(value = "currentSurveyId") String currentSurveyId) throws JsonProcessingException {

		//Converting Strings to Integers
		int userIdtoInteger;
		userIdtoInteger = Integer.parseInt(currentUserId);
		int surveyIdtoInteger;
		surveyIdtoInteger = Integer.parseInt(currentSurveyId);

		//Checking the Answers of Question One
		if (questionOne.equals("1")) {
			allSelectedPaths.add(databaseAdmin);
		}

		if (questionOne.equals("2")) {
			allSelectedPaths.add(networkAdmin);
		}

		if (questionOne.equals("3")) {
			allSelectedPaths.add(dataScience);
		}

		if (questionOne.equals("4")) {
			allSelectedPaths.add(graphicDesigner);
		}

		if (questionOne.equals("5")) {
			allSelectedPaths.add(softwareDeveloper);
		}

		//Checking the Answers of Question Two
		if (questionTwo.equals("1")) {
			allSelectedPaths.add(graphicDesigner);
		}

		if (questionTwo.equals("2")) {
			allSelectedPaths.add(networkAdmin);
		}

		if (questionTwo.equals("3")) {
			allSelectedPaths.add(databaseAdmin);
		}

		if (questionTwo.equals("4")) {
			allSelectedPaths.add(softwareDeveloper);
		}

		if (questionTwo.equals("5")) {
			allSelectedPaths.add(dataScience);
		}

		//Checking the Answers of Question Three
		if (questionThree.equals("1")) {
			allSelectedPaths.add(databaseAdmin);
		}

		if (questionThree.equals("2")) {
			allSelectedPaths.add(networkAdmin);
		}

		if (questionThree.equals("3")) {
			allSelectedPaths.add(softwareDeveloper);
		}

		if (questionThree.equals("4")) {
			allSelectedPaths.add(graphicDesigner);
		}

		if (questionThree.equals("5")) {
			allSelectedPaths.add(dataScience);
		}

		//Checking the Answers of Question Four
		if (questionFour.equals("1")) {
			allSelectedPaths.add(graphicDesigner);
		}

		if (questionFour.equals("2")) {
			allSelectedPaths.add(dataScience);
		}

		if (questionFour.equals("3")) {
			allSelectedPaths.add(databaseAdmin);
		}

		if (questionFour.equals("4")) {
			allSelectedPaths.add(softwareDeveloper);
		}

		if (questionFour.equals("5")) {
			allSelectedPaths.add(networkAdmin);
		}

		//Checking the Answers of Question Five
		if (questionFive.equals("1")) {
			allSelectedPaths.add(databaseAdmin);
		}

		if (questionFive.equals("2")) {
			allSelectedPaths.add(dataScience);
		}

		if (questionFive.equals("3")) {
			allSelectedPaths.add(softwareDeveloper);
		}

		if (questionFive.equals("4")) {
			allSelectedPaths.add(networkAdmin);
		}

		if (questionFive.equals("5")) {
			allSelectedPaths.add(graphicDesigner);
		}

		//Initializing the GreenPlanet object in order to save the answers from the client's Ajax request.
		OrangePlanet orangePlanet = new OrangePlanet();

		orangePlanet.setQuestionOne(questionOne);
		orangePlanet.setQuestionTwo(questionTwo);
		orangePlanet.setQuestionThree(questionThree);
		orangePlanet.setQuestionFour(questionFour);
		orangePlanet.setQuestionFive(questionFive);
		User user = new User();
		user.setUserId(userIdtoInteger);
		user.setUsername(currentUsername);
		Survey survey = new Survey();
		survey.setSurveyId(surveyIdtoInteger);
		survey.setUser(user);
		orangePlanet.setSurvey(survey);
		orangePlanet.setUser(user);

		orangePlanetManagementService.saveOrangePlanetAnswers(orangePlanet);

		Map<String, Long> recommendationsMap = allSelectedPaths.stream().collect(Collectors.groupingBy(e -> e.toString(),Collectors.counting()));
		System.out.println(recommendationsMap);

		LinkedHashMap<String, Long> sortedRecommendationsMap = new LinkedHashMap<>();

		//Use Comparator.reverseOrder() for reverse ordering
		recommendationsMap.entrySet()
				.stream()
				.sorted(Map.Entry.comparingByValue(Comparator.reverseOrder()))
				.forEachOrdered(x -> sortedRecommendationsMap.put(x.getKey(), x.getValue()));

		Map.Entry<String,Long> entry = sortedRecommendationsMap.entrySet().iterator().next();
		finalRecommendationPath = entry.getKey();
		System.out.println("Reverse Sorted Map   : " + sortedRecommendationsMap);

		//Saving the recommendation into the Database
		Recommendation recommendation = new Recommendation();
		recommendation.setUser(user);
		recommendation.setTitle(finalRecommendationPath);

		//Save the title into the recommendation table
		recommendationManagementService.saveRecommendation(recommendation);

	}

	@RequestMapping(value = "/analytics/recommendationAnalytics", method = RequestMethod.GET)
	public @ResponseBody
	RecommendationBarChart[] recommendationAnalytics()
	{

		List<Recommendation> recommendationList = recommendationManagementService.getRecommendations();

		HashMap<Integer,String> recommendationListMap = new HashMap<>();
		for (int i = 0; i < recommendationList.size(); i++) {
			recommendationListMap.put(i,recommendationList.get(i).getTitle());
		}

		Map<String, Integer> result = new TreeMap<String, Integer>();
		for (Map.Entry<Integer, String> entry : recommendationListMap.entrySet()) {
			String value = entry.getValue();
			Integer count = result.get(value);
			if (count == null)
				result.put(value, new Integer(1));
			else
				result.put(value, new Integer(count+1));
		}

		Integer i = 0;
		RecommendationBarChart[] recommendationBarChartsArray = new RecommendationBarChart[result.size()];

		for (Map.Entry<String, Integer> entry : result.entrySet()) {
			RecommendationBarChart recommendationBarChart = new RecommendationBarChart();
			recommendationBarChart.setTitle(entry.getKey());
			recommendationBarChart.setUsers(entry.getValue());
			recommendationBarChartsArray[i] = recommendationBarChart;
			i++;
		}


		return recommendationBarChartsArray;
	}

	@RequestMapping(value = "/analytics/countryAnalytics", method = RequestMethod.GET)
	public @ResponseBody
	UserBarChart[] countryAnalytics()
	{

		List<User> userList = userManagementService.getAllUsers();

		HashMap<Integer,String> usersListMap = new HashMap<>();
		for (int i = 0; i < userList.size(); i++) {
			usersListMap.put(i,userList.get(i).getCountry());
		}

		Map<String, Integer> result = new TreeMap<String, Integer>();
		for (Map.Entry<Integer, String> entry : usersListMap.entrySet()) {

			String value = entry.getValue();
			Integer count = result.get(value);
			if (count == null)
				result.put(value, new Integer(1));
			else
				result.put(value, new Integer(count+1));
		}

		Integer i = 0;
		UserBarChart[] userBarChartsArray = new UserBarChart[result.size()];

		for (Map.Entry<String, Integer> entry : result.entrySet()) {
			UserBarChart userBarChart = new UserBarChart();
			userBarChart.setCountry(entry.getKey());
			userBarChart.setUsers(entry.getValue());
			userBarChartsArray[i] = userBarChart;
			i++;
		}

		return userBarChartsArray;
	}

}
