package gr.gfiotakis.imlCloud.controllers;

import com.fasterxml.jackson.core.JsonProcessingException;
import gr.gfiotakis.imlCloud.model.gui.Course;
import gr.gfiotakis.imlCloud.model.gui.RecommendationBarChart;
import gr.gfiotakis.imlCloud.model.gui.UserBarChart;
import gr.gfiotakis.imlCloud.model.managementService.*;
import gr.gfiotakis.imlCloud.model.persistence.*;
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
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.*;
import java.util.stream.Collectors;

import static org.apache.commons.lang3.Range.is;

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
	private String currentStudentEmail;
	private Integer currentAge;
	private String currentGender;
	private String currentCountry;
	private String currentFirstName;
	private String currentStudentGoal;
	private Integer currentUserCoins;
	private Integer currentUserLevel;
	private Boolean catOneLesOneCompleted;
	private Boolean catOneLesTwoCompleted;
	private Boolean catOneLesThreeCompleted;
	private Boolean catTwoLesOneCompleted;
	private Boolean catTwoLesTwoCompleted;
	private Boolean catTwoLesThreeCompleted;
	private Boolean catThreeLesOneCompleted;
	private Boolean catThreeLesTwoCompleted;
	private Boolean catThreeLesThreeCompleted;
	private Boolean catFourLesOneCompleted;
	private Boolean catFourLesTwoCompleted;
	private Boolean catFourLesThreeCompleted;

	private String finalRecommendationPath;
	String dataScience = "Data Science";
	String graphicDesigner = "Graphic Designer";
	String softwareDeveloper = "Software Developer";
	String networkAdmin = "Network Administrator";
	String databaseAdmin = "Database Administrator";

	ArrayList<String> allSelectedPaths = new ArrayList<String>();

	protected HomeController() {
		super();
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The locale is {}.", locale);

		return "dashboard";
	}

	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String dashboard(Principal principal, Model model) {

		KeycloakAuthenticationToken keycloakAuthenticationToken = (KeycloakAuthenticationToken) principal;
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		String studentEmail = ((AccessToken)((RefreshableKeycloakSecurityContext)((SimpleKeycloakAccount)((KeycloakAuthenticationToken)auth).getDetails()).getKeycloakSecurityContext()).getToken()).getEmail();
		String studentUserName = ((AccessToken)((RefreshableKeycloakSecurityContext)((SimpleKeycloakAccount)((KeycloakAuthenticationToken)auth).getDetails()).getKeycloakSecurityContext()).getToken()).getPreferredUsername();

		model.addAttribute("studentEmail",studentEmail);
		model.addAttribute("studentUserName",studentUserName);

		currentStudentEmail = studentEmail;
		currentUsername = studentUserName;
		currentUserId = userManagementService.getUserbyUsername(studentUserName).get(0).getUserId();

//		if (userManagementService.getUserbyUsername(studentUserName).get(0).getFirstQuizCompleted() == null || userManagementService.getUserbyUsername(studentUserName).get(0).getFirstQuizCompleted() == 0) {
		if (userManagementService.getUserbyUsername(currentUsername).get(0).getUserId() == null) {
			return "firstQuiz";
		}

		List<User> userList = userManagementService.getUserbyUsername(currentUsername);
		User user = userList.get(0);

		currentStudentEmail = user.getEmail();
		currentAge = user.getAge();
		currentGender = user.getGender();
		currentCountry = user.getCountry();
		currentFirstName = user.getStudentName();
		currentStudentGoal = user.getStudentGoal();
		currentUserCoins = user.getCoins();
		currentUserLevel = user.getLevel();

		model.addAttribute("currentStudentEmail",currentStudentEmail);
		model.addAttribute("currentAge",currentAge);
		model.addAttribute("currentGender",currentGender);
		model.addAttribute("currentCountry",currentCountry);
		model.addAttribute("currentFirstName",currentFirstName);
		model.addAttribute("currentStudentGoal",currentStudentGoal);
		model.addAttribute("currentUsername",currentUsername);
		model.addAttribute("currentUserCoins",currentUserCoins);
		model.addAttribute("currentUserLevel",currentUserLevel);
		model.addAttribute("currentUserId",currentUserId);
		model.addAttribute("userCoins", currentUserCoins);
		model.addAttribute("catOneLesOneCompleted", catOneLesOneCompleted);
		model.addAttribute("catOneLesTwoCompleted", catOneLesTwoCompleted);
		model.addAttribute("catOneLesThreeCompleted", catOneLesThreeCompleted);
		model.addAttribute("catTwoLesOneCompleted", catTwoLesOneCompleted);
		model.addAttribute("catTwoLesTwoCompleted", catTwoLesTwoCompleted);
		model.addAttribute("catTwoLesThreeCompleted", catTwoLesThreeCompleted);
		model.addAttribute("catThreeLesOneCompleted", catThreeLesOneCompleted);
		model.addAttribute("catThreeLesTwoCompleted", catThreeLesTwoCompleted);
		model.addAttribute("catThreeLesThreeCompleted", catThreeLesThreeCompleted);
		model.addAttribute("catFourLesOneCompleted", catFourLesOneCompleted);
		model.addAttribute("catFourLesTwoCompleted", catFourLesTwoCompleted);
		model.addAttribute("catFourLesThreeCompleted", catFourLesThreeCompleted);

		return "dashboard";
	}

	@RequestMapping(value = "/analytics", method = RequestMethod.GET)
	public String analytics(Locale locale, Model model) {
		logger.info("Student has reached the analytics page!!!", locale);

		model.addAttribute("currentUserId",currentUserId);
		model.addAttribute("currentSurveyId",currentSurveyId);

		return "analytics";
	}

	@RequestMapping(value = "/firstQuiz", method = RequestMethod.GET)
	public String firstQuiz(Locale locale, Model model) {


//	if (userManagementService.getUserbyUsername(currentUsername).get(0).getUserId() != null || userManagementService.getUserbyUsername(currentUsername).get(0).getFirstQuizCompleted() != null) {
		if (userManagementService.getUserbyUsername(currentUsername).get(0).getFirstQuizCompleted() == 1) {
			return "dashboard";
		}
//	}
		return "firstQuiz";
	}

	@RequestMapping(value = "/greenPlanet", method = RequestMethod.GET)
	public String greenPlanet(Locale locale, Model model) {

		model.addAttribute("currentUserId",currentUserId);
		model.addAttribute("currentSurveyId",currentSurveyId);

		return "greenPlanet";
	}

	@RequestMapping(value = "/purplePlanet", method = RequestMethod.GET)
	public String purplePlanet(Locale locale, Model model) {

		model.addAttribute("currentUserId",currentUserId);
		model.addAttribute("currentSurveyId",currentSurveyId);

		return "purplePlanet";
	}

	@RequestMapping(value = "/achievement", method = RequestMethod.GET)
	public String achievement(Model model) {

		return "achievement";
	}

	@RequestMapping(value = "/orangePlanet", method = RequestMethod.GET)
	public String orangePlanet(Locale locale, Model model) {

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

		List<User> userList = userManagementService.getUserbyUsername(currentUsername);
		User user = userList.get(0);

		model.addAttribute("currentUsername",currentUsername);
		model.addAttribute("currentFirstName",user.getStudentName());
		model.addAttribute("currentCountry",user.getCountry());
		model.addAttribute("currentAge",user.getAge());
		model.addAttribute("currentGender",user.getGender());
		model.addAttribute("currentStudentEmail",currentStudentEmail);

		return "userProfile";
	}

	@RequestMapping(value = "/categoryOne", method = RequestMethod.GET)
	public String categoryOne(Locale locale, Model model) {

		return "categoryOne";
	}

	@RequestMapping(value = "/categoryTwo", method = RequestMethod.GET)
	public String categoryTwo(Locale locale, Model model) {

		return "categoryTwo";
	}

	@RequestMapping(value = "/categoryThree", method = RequestMethod.GET)
	public String categoryThree(Locale locale, Model model) {

		return "categoryThree";
	}

	@RequestMapping(value = "/categoryFour", method = RequestMethod.GET)
	public String categoryFour(Locale locale, Model model) {

		return "categoryFour";
	}

//	public User createAndGetTheCreatedUserTest() {
//
//		User userTest = new User();
//		userTest.setUsername("test user");
//		userTest.setStudentName("test test");
//		userTest.setAge(10);
//		userTest.setEmail("test@gmail.com");
//		userManagementService.saveUser(userTest);
//
//		return userManagementService.getUserbyUsername(userTest.getUsername()).get(0);
//	}

	@RequestMapping(value = "/firstQuizAnswers", method = RequestMethod.GET)
	public @ResponseBody
	RedirectView firstQuizAnswers(@RequestParam(value = "studentGender" , required = false) String studentGender,
								  @RequestParam(value = "studentCountry" , required = false) String studentCountry,
								  @RequestParam(value = "studentAge" , required = false) Integer studentAge,
								  @RequestParam(value = "studentName" , required = false) String studentName,
								  @RequestParam(value = "studentGoal" , required = false) String studentGoal) {

		if (userManagementService.getUserbyUsername(currentUsername).get(0).getUserId() == null) {

			User user = new User();
			user.setUsername(currentUsername);
			user.setCountry(studentCountry);
			user.setGender(studentGender);
			user.setAge(studentAge);
			user.setEmail(currentStudentEmail);
			user.setStudentName(studentName);
			user.setLevel(1);
			user.setCoins(0);
			user.setFirstQuizCompleted(1);
			user.setStudentGoal(studentGoal);
			userManagementService.saveUser(user);

			CategoryOne categoryOne = new CategoryOne();
			categoryOne.setUser(user);
			categoryOne.setLessonOne(false);
			categoryOne.setLessonTwo(false);
			categoryOne.setLessonThree(false);
			userManagementService.saveCategoryOne(categoryOne);

			CategoryTwo categoryTwo = new CategoryTwo();
			categoryTwo.setUser(user);
			categoryTwo.setLessonOne(false);
			categoryTwo.setLessonTwo(false);
			categoryTwo.setLessonThree(false);
			userManagementService.saveCategoryTwo(categoryTwo);

			CategoryThree categoryThree = new CategoryThree();
			categoryThree.setUser(user);
			categoryThree.setLessonOne(false);
			categoryThree.setLessonTwo(false);
			categoryThree.setLessonThree(false);
			userManagementService.saveCategoryThree(categoryThree);

			CategoryFour categoryFour = new CategoryFour();
			categoryFour.setUser(user);
			categoryFour.setLessonOne(false);
			categoryFour.setLessonTwo(false);
			categoryFour.setLessonThree(false);
			userManagementService.saveCategoryFour(categoryFour);

			catOneLesOneCompleted = categoryOne.getLessonOne();
			catOneLesTwoCompleted = categoryOne.getLessonTwo();
			catOneLesThreeCompleted = categoryOne.getLessonThree();
			catTwoLesOneCompleted = categoryTwo.getLessonOne();
			catTwoLesTwoCompleted = categoryTwo.getLessonTwo();
			catTwoLesThreeCompleted = categoryTwo.getLessonThree();
			catThreeLesOneCompleted = categoryThree.getLessonOne();
			catThreeLesTwoCompleted = categoryThree.getLessonTwo();
			catThreeLesThreeCompleted = categoryThree.getLessonThree();
			catFourLesOneCompleted = categoryFour.getLessonOne();
			catFourLesTwoCompleted = categoryFour.getLessonTwo();
			catFourLesThreeCompleted = categoryFour.getLessonThree();
		}

		currentAge = studentAge;
		currentGender = studentGender;
		currentCountry = studentCountry;
		currentFirstName = studentName;
		currentStudentGoal = studentGoal;


		return new RedirectView("./dashboard");

	}

//	@RequestMapping(value = "/firstQuizAnswers", method = RequestMethod.GET)
//	public @ResponseBody String firstQuizAnswers(@RequestParam(value = "studentGender" , required = false) String studentGender,
//								 				@RequestParam(value = "studentCountry" , required = false) String studentCountry,
//								 				@RequestParam(value = "studentAge" , required = false) Integer studentAge,
//								 				@RequestParam(value = "studentName" , required = false) String studentName,
//								 				@RequestParam(value = "studentGoal" , required = false) String studentGoal) {
//
//		if (userManagementService.getUserbyUsername(currentUsername).get(0).getUserId() == null) {
//
//			User user = new User();
//			user.setUsername(currentUsername);
//			user.setCountry(studentCountry);
//			user.setGender(studentGender);
//			user.setAge(studentAge);
//			user.setEmail(currentStudentEmail);
//			user.setStudentName(studentName);
//			user.setLevel(1);
//			user.setCoins(0);
//			user.setFirstQuizCompleted(1);
//			user.setStudentGoal(studentGoal);
//			userManagementService.saveUser(user);
//
//			CategoryOne categoryOne = new CategoryOne();
//			categoryOne.setUser(user);
//			categoryOne.setLessonOne(false);
//			categoryOne.setLessonTwo(false);
//			categoryOne.setLessonThree(false);
//			userManagementService.saveCategoryOne(categoryOne);
//
//			CategoryTwo categoryTwo = new CategoryTwo();
//			categoryTwo.setUser(user);
//			categoryTwo.setLessonOne(false);
//			categoryTwo.setLessonTwo(false);
//			categoryTwo.setLessonThree(false);
//			userManagementService.saveCategoryTwo(categoryTwo);
//
//			CategoryThree categoryThree = new CategoryThree();
//			categoryThree.setUser(user);
//			categoryThree.setLessonOne(false);
//			categoryThree.setLessonTwo(false);
//			categoryThree.setLessonThree(false);
//			userManagementService.saveCategoryThree(categoryThree);
//
//			CategoryFour categoryFour = new CategoryFour();
//			categoryFour.setUser(user);
//			categoryFour.setLessonOne(false);
//			categoryFour.setLessonTwo(false);
//			categoryFour.setLessonThree(false);
//			userManagementService.saveCategoryFour(categoryFour);
//
//			catOneLesOneCompleted = categoryOne.getLessonOne();
//			catOneLesTwoCompleted = categoryOne.getLessonTwo();
//			catOneLesThreeCompleted = categoryOne.getLessonThree();
//			catTwoLesOneCompleted = categoryTwo.getLessonOne();
//			catTwoLesTwoCompleted = categoryTwo.getLessonTwo();
//			catTwoLesThreeCompleted = categoryTwo.getLessonThree();
//			catThreeLesOneCompleted = categoryThree.getLessonOne();
//			catThreeLesTwoCompleted = categoryThree.getLessonTwo();
//			catThreeLesThreeCompleted = categoryThree.getLessonThree();
//			catFourLesOneCompleted = categoryFour.getLessonOne();
//			catFourLesTwoCompleted = categoryFour.getLessonTwo();
//			catFourLesThreeCompleted = categoryFour.getLessonThree();
//		}
//
//		currentAge = studentAge;
//		currentGender = studentGender;
//		currentCountry = studentCountry;
//		currentFirstName = studentName;
//		currentStudentGoal = studentGoal;
//
//
//		return "{'msg':'success'}";
//
//	}

	@RequestMapping(value = "/categoryOneLessonOne", method = RequestMethod.GET)
	public @ResponseBody String categoryOneLessonOne(Model model ,
									   @RequestParam(value = "userCoins" , required = false) Integer userCoins,
									   @RequestParam(value = "lessonCompleted" , required = false) Boolean lessonCompleted) {

		Integer currentUserXP  = userManagementService.getUserCurrentXP(currentUserId);
//		userManagementService.updateCategoryOne(currentUserId,lessonCompleted);
		userManagementService.updateUserCoins(currentUserId, userCoins + currentUserXP);

		return "redirect:/dashboard";
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
	UserBarChart[] countryAnalytics() {

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
