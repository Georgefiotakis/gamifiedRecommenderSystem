package gr.gfiotakis.imlCloud.controllers;

import gr.gfiotakis.imlCloud.model.gui.*;
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
	private Integer catOneLesOneCompleted;
	private Integer catOneLesTwoCompleted;
	private Integer catOneLesThreeCompleted;
	private Integer catTwoLesOneCompleted;
	private Integer catTwoLesTwoCompleted;
	private Integer catTwoLesThreeCompleted;
	private Integer catThreeLesOneCompleted;
	private Integer catThreeLesTwoCompleted;
	private Integer catThreeLesThreeCompleted;
	private Integer catFourLesOneCompleted;
	private Integer catFourLesTwoCompleted;
	private Integer catFourLesThreeCompleted;

	private String finalRecommendationPath;
//	String dataScience = "Data Science";
//	String graphicDesigner = "Graphic Designer";
//	String softwareDeveloper = "Software Developer";
//	String networkAdmin = "Network Administrator";
//	String databaseAdmin = "Database Administrator";

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

	@RequestMapping(value = "/leaderboard", method = RequestMethod.GET)
	public String leaderboard(Locale locale, Model model) {

		logger.info("Student has reached the leaderboard page");

		return "leaderboard";
	}

	@RequestMapping(value = "/firstQuiz", method = RequestMethod.GET)
	public String firstQuiz(Locale locale, Model model) {

//		KeycloakAuthenticationToken keycloakAuthenticationToken = (KeycloakAuthenticationToken) principal;
//		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//
//		String studentEmail = ((AccessToken)((RefreshableKeycloakSecurityContext)((SimpleKeycloakAccount)((KeycloakAuthenticationToken)auth).getDetails()).getKeycloakSecurityContext()).getToken()).getEmail();
//		String studentUserName = ((AccessToken)((RefreshableKeycloakSecurityContext)((SimpleKeycloakAccount)((KeycloakAuthenticationToken)auth).getDetails()).getKeycloakSecurityContext()).getToken()).getPreferredUsername();
//
//		model.addAttribute("studentEmail",studentEmail);
//		model.addAttribute("studentUserName",studentUserName);
//
//		currentStudentEmail = studentEmail;
//		currentUsername = studentUserName;
//		currentUserId = userManagementService.getUserbyUsername(studentUserName).get(0).getUserId();


//	if (userManagementService.getUserbyUsername(currentUsername).get(0).getUserId() != null || userManagementService.getUserbyUsername(currentUsername).get(0).getFirstQuizCompleted() != null) {
		if (userManagementService.getUserbyUsername(currentUsername).get(0).getFirstQuizCompleted() != null && userManagementService.getUserbyUsername(currentUsername).get(0).getFirstQuizCompleted() == 1) {
			return "dashboard";
		}
//	}
		return "firstQuiz";
	}

//	@RequestMapping(value = "/greenPlanet", method = RequestMethod.GET)
//	public String greenPlanet(Locale locale, Model model) {
//
//		model.addAttribute("currentUserId",currentUserId);
//		model.addAttribute("currentSurveyId",currentSurveyId);
//
//		return "greenPlanet";
//	}
//
//	@RequestMapping(value = "/purplePlanet", method = RequestMethod.GET)
//	public String purplePlanet(Locale locale, Model model) {
//
//		model.addAttribute("currentUserId",currentUserId);
//		model.addAttribute("currentSurveyId",currentSurveyId);
//
//		return "purplePlanet";
//	}

	@RequestMapping(value = "/achievement", method = RequestMethod.GET)
	public String achievement(Model model) {

		return "achievement";
	}

//	@RequestMapping(value = "/orangePlanet", method = RequestMethod.GET)
//	public String orangePlanet(Locale locale, Model model) {
//
//		model.addAttribute("currentUserId",currentUserId);
//		model.addAttribute("currentSurveyId",currentSurveyId);
//
//		return "orangePlanet";
//	}

//	@RequestMapping(value = "/studentRecommendation", method = RequestMethod.GET)
//	public String studentRecommendation(Locale locale, Model model) {
//		logger.info("Student has reached the recommendation page!", locale);
//
//		model.addAttribute("currentUserId",currentUserId);
//		model.addAttribute("currentSurveyId",currentSurveyId);
//		model.addAttribute("finalRecommendationPath",finalRecommendationPath);
//
//		return "studentRecommendation";
//	}

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

	@RequestMapping(value = "/categoryOneQuizOne", method = RequestMethod.GET)
	public String categoryOneQuizOne(Locale locale, Model model) {

		return "categoryOneQuizOne";
	}

	@RequestMapping(value = "/categoryOneQuizTwo", method = RequestMethod.GET)
	public String categoryOneQuizTwo(Locale locale, Model model) {

		return "categoryOneQuizTwo";
	}

	@RequestMapping(value = "/categoryOneQuizThree", method = RequestMethod.GET)
	public String categoryOneQuizThree(Locale locale, Model model) {

		return "categoryOneQuizThree";
	}

	@RequestMapping(value = "/categoryTwoQuizOne", method = RequestMethod.GET)
	public String categoryTwoQuizOne(Locale locale, Model model) {

		return "categoryTwoQuizOne";
	}

	@RequestMapping(value = "/categoryTwoQuizTwo", method = RequestMethod.GET)
	public String categoryTwoQuizTwo(Locale locale, Model model) {

		return "categoryTwoQuizTwo";
	}

	@RequestMapping(value = "/categoryTwoQuizThree", method = RequestMethod.GET)
	public String categoryTwoQuizThree(Locale locale, Model model) {

		return "categoryTwoQuizThree";
	}

	@RequestMapping(value = "/categoryThreeQuizOne", method = RequestMethod.GET)
	public String categoryThreeQuizOne(Locale locale, Model model) {

		return "categoryThreeQuizOne";
	}

	@RequestMapping(value = "/categoryThreeQuizTwo", method = RequestMethod.GET)
	public String categoryThreeQuizTwo(Locale locale, Model model) {

		return "categoryThreeQuizTwo";
	}

	@RequestMapping(value = "/categoryThreeQuizThree", method = RequestMethod.GET)
	public String categoryThreeQuizThree(Locale locale, Model model) {

		return "categoryThreeQuizThree";
	}

	@RequestMapping(value = "/categoryFourQuizOne", method = RequestMethod.GET)
	public String categoryFourQuizOne(Locale locale, Model model) {

		return "categoryFourQuizOne";
	}

	@RequestMapping(value = "/categoryFourQuizTwo", method = RequestMethod.GET)
	public String categoryFourQuizTwo(Locale locale, Model model) {

		return "categoryFourQuizTwo";
	}

	@RequestMapping(value = "/categoryFourQuizThree", method = RequestMethod.GET)
	public String categoryFourQuizThree(Locale locale, Model model) {

		return "categoryFourQuizThree";
	}

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
			categoryOne.setLessonOne(0);
			categoryOne.setLessonTwo(0);
			categoryOne.setLessonThree(0);
			userManagementService.saveCategoryOne(categoryOne);

			CategoryTwo categoryTwo = new CategoryTwo();
			categoryTwo.setUser(user);
			categoryTwo.setLessonOne(0);
			categoryTwo.setLessonTwo(0);
			categoryTwo.setLessonThree(0);
			userManagementService.saveCategoryTwo(categoryTwo);

			CategoryThree categoryThree = new CategoryThree();
			categoryThree.setUser(user);
			categoryThree.setLessonOne(0);
			categoryThree.setLessonTwo(0);
			categoryThree.setLessonThree(0);
			userManagementService.saveCategoryThree(categoryThree);

			CategoryFour categoryFour = new CategoryFour();
			categoryFour.setUser(user);
			categoryFour.setLessonOne(0);
			categoryFour.setLessonTwo(0);
			categoryFour.setLessonThree(0);
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

	@RequestMapping(value = "/analytics/ageUserAnalytics", method = RequestMethod.GET)
	public @ResponseBody
	UserAgeBarChart[] ageUserAnalytics() {

		List<User> userList = userManagementService.getAllUsers();

		HashMap<Integer,String> usersListMap = new HashMap<>();
		for (int i = 0; i < userList.size(); i++) {
			usersListMap.put(i,userList.get(i).getAge().toString());
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
		UserAgeBarChart[] userAgeBarCharts = new UserAgeBarChart[result.size()];

		for (Map.Entry<String, Integer> entry : result.entrySet()) {
			UserAgeBarChart userAgeBarChart = new UserAgeBarChart();
			userAgeBarChart.setAge(entry.getKey());
			userAgeBarChart.setUsers(entry.getValue());
			userAgeBarCharts[i] = userAgeBarChart;
			i++;
		}

		return userAgeBarCharts;
	}

	@RequestMapping(value = "/getUsersLeaderboard", method = RequestMethod.GET)
	public @ResponseBody
	UserLeaderboard[] getUsersLeaderboard() {

		List<User> userList = userManagementService.getAllUsers();
		List<User> userListAboveZero = new ArrayList<>();
		for (User user : userList) {
			if (user.getCoins() == 0) {
				continue;
			} else {
				userListAboveZero.add(user);
			}
		}

		UserLeaderboard[] userLeaderboards = new UserLeaderboard[userListAboveZero.size()];
		Integer i = 0 ;

		for (User user : userList) {
			if (user.getCoins() == 0) {
				continue;
			}
			UserLeaderboard userLeaderboard = new UserLeaderboard();
			userLeaderboard.setUserName(user.getUsername());
			userLeaderboard.setPoints(user.getCoins());
			userLeaderboard.setHref("https://f0.pngfuel.com/png/427/179/brain-character-illustration-png-clip-art.png");
			userLeaderboards[i] = userLeaderboard;
			i++;
		}

		Arrays.sort(userLeaderboards, (a, b) -> a.getPoints().compareTo(b.getPoints()));

		return userLeaderboards;
	}

	@RequestMapping(value = "/getUserCategoryOneLessons", method = RequestMethod.GET)
	public @ResponseBody CategoryOne getUserCategoryOneLessons(Model model) {

		return userManagementService.getCategoryOneLessonsByUserId(currentUserId);
	}

	@RequestMapping(value = "/getUserCategoryTwoLessons", method = RequestMethod.GET)
	public @ResponseBody CategoryTwo getUserCategoryTwoLessons(Model model) {

		return userManagementService.getCategoryTwoLessonsByUserId(currentUserId);
	}

	@RequestMapping(value = "/getUserCategoryThreeLessons", method = RequestMethod.GET)
	public @ResponseBody CategoryThree getUserCategoryThreeLessons(Model model) {

		//		model.addAttribute("categoryThreeLessonOne",categoryThree.getLessonOne());
//		model.addAttribute("categoryThreeLessonTwo",categoryThree.getLessonTwo());
//		model.addAttribute("categoryThreeLessonThree",categoryThree.getLessonThree());

		return userManagementService.getCategoryThreeLessonsByUserId(currentUserId);
	}

	@RequestMapping(value = "/getUserCategoryFourLessons", method = RequestMethod.GET)
	public @ResponseBody CategoryFour getUserCategoryFourLessons(Model model) {

		//		model.addAttribute("categoryFourLessonOne",categoryFour.getLessonOne());
//		model.addAttribute("categoryFourLessonTwo",categoryFour.getLessonTwo());
//		model.addAttribute("categoryFourLessonThree",categoryFour.getLessonThree());

		return userManagementService.getCategoryFourLessonsByUserId(currentUserId);
	}

	@RequestMapping(value = "/categoryOneLessonOne", method = RequestMethod.GET)
	public @ResponseBody String categoryOneLessonOne(Model model ,
													 @RequestParam(value = "userCoins" , required = false) Integer userCoins,
													 @RequestParam(value = "lessonCompleted" , required = false) Integer lessonCompleted) {

		Integer currentUserXP  = userManagementService.getUserCurrentXP(currentUserId);
		userManagementService.updateCategoryOneLessonOne(currentUserId,lessonCompleted);
		userManagementService.updateUserCoins(currentUserId, userCoins + currentUserXP);

		return "redirect:/dashboard";
	}

	@RequestMapping(value = "/categoryOneLessonTwo", method = RequestMethod.GET)
	public @ResponseBody String categoryOneLessonTwo(Model model ,
													 @RequestParam(value = "userCoins" , required = false) Integer userCoins,
													 @RequestParam(value = "lessonCompleted" , required = false) Integer lessonCompleted) {

		Integer currentUserXP  = userManagementService.getUserCurrentXP(currentUserId);
		userManagementService.updateCategoryOneLessonTwo(currentUserId,lessonCompleted);
		userManagementService.updateUserCoins(currentUserId, userCoins + currentUserXP);

		return "redirect:/dashboard";
	}

	@RequestMapping(value = "/categoryOneLessonThree", method = RequestMethod.GET)
	public @ResponseBody String categoryOneLessonThree(Model model ,
													 @RequestParam(value = "userCoins" , required = false) Integer userCoins,
													 @RequestParam(value = "lessonCompleted" , required = false) Integer lessonCompleted) {

		Integer currentUserXP  = userManagementService.getUserCurrentXP(currentUserId);
		userManagementService.updateCategoryOneLessonThree(currentUserId,lessonCompleted);
		userManagementService.updateUserCoins(currentUserId, userCoins + currentUserXP);

		return "redirect:/dashboard";
	}

	@RequestMapping(value = "/categoryTwoLessonOne", method = RequestMethod.GET)
	public @ResponseBody String categoryTwoLessonOne(Model model ,
													   @RequestParam(value = "userCoins" , required = false) Integer userCoins,
													   @RequestParam(value = "lessonCompleted" , required = false) Integer lessonCompleted) {

		Integer currentUserXP  = userManagementService.getUserCurrentXP(currentUserId);
		userManagementService.updateCategoryTwoLessonOne(currentUserId,lessonCompleted);
		userManagementService.updateUserCoins(currentUserId, userCoins + currentUserXP);

		return "redirect:/dashboard";
	}

	@RequestMapping(value = "/categoryTwoLessonTwo", method = RequestMethod.GET)
	public @ResponseBody String categoryTwoLessonTwo(Model model ,
													 @RequestParam(value = "userCoins" , required = false) Integer userCoins,
													 @RequestParam(value = "lessonCompleted" , required = false) Integer lessonCompleted) {

		Integer currentUserXP  = userManagementService.getUserCurrentXP(currentUserId);
		userManagementService.updateCategoryTwoLessonTwo(currentUserId,lessonCompleted);
		userManagementService.updateUserCoins(currentUserId, userCoins + currentUserXP);

		return "redirect:/dashboard";
	}

	@RequestMapping(value = "/categoryTwoLessonThree", method = RequestMethod.GET)
	public @ResponseBody String categoryTwoLessonThree(Model model ,
													 @RequestParam(value = "userCoins" , required = false) Integer userCoins,
													 @RequestParam(value = "lessonCompleted" , required = false) Integer lessonCompleted) {

		Integer currentUserXP  = userManagementService.getUserCurrentXP(currentUserId);
		userManagementService.updateCategoryTwoLessonThree(currentUserId,lessonCompleted);
		userManagementService.updateUserCoins(currentUserId, userCoins + currentUserXP);

		return "redirect:/dashboard";
	}

	@RequestMapping(value = "/categoryThreeLessonOne", method = RequestMethod.GET)
	public @ResponseBody String categoryThreeLessonOne(Model model ,
													   @RequestParam(value = "userCoins" , required = false) Integer userCoins,
													   @RequestParam(value = "lessonCompleted" , required = false) Integer lessonCompleted) {

		Integer currentUserXP  = userManagementService.getUserCurrentXP(currentUserId);
		userManagementService.updateCategoryThreeLessonOne(currentUserId,lessonCompleted);
		userManagementService.updateUserCoins(currentUserId, userCoins + currentUserXP);

		return "redirect:/dashboard";
	}

	@RequestMapping(value = "/categoryThreeLessonTwo", method = RequestMethod.GET)
	public @ResponseBody String categoryThreeLessonTwo(Model model ,
													   @RequestParam(value = "userCoins" , required = false) Integer userCoins,
													   @RequestParam(value = "lessonCompleted" , required = false) Integer lessonCompleted) {

		Integer currentUserXP  = userManagementService.getUserCurrentXP(currentUserId);
		userManagementService.updateCategoryThreeLessonTwo(currentUserId,lessonCompleted);
		userManagementService.updateUserCoins(currentUserId, userCoins + currentUserXP);

		return "redirect:/dashboard";
	}

	@RequestMapping(value = "/categoryThreeLessonThree", method = RequestMethod.GET)
	public @ResponseBody String categoryThreeLessonThree(Model model ,
													   @RequestParam(value = "userCoins" , required = false) Integer userCoins,
													   @RequestParam(value = "lessonCompleted" , required = false) Integer lessonCompleted) {

		Integer currentUserXP  = userManagementService.getUserCurrentXP(currentUserId);
		userManagementService.updateCategoryThreeLessonThree(currentUserId,lessonCompleted);
		userManagementService.updateUserCoins(currentUserId, userCoins + currentUserXP);

		return "redirect:/dashboard";
	}

	@RequestMapping(value = "/categoryFourLessonOne", method = RequestMethod.GET)
	public @ResponseBody String categoryFourLessonOne(Model model ,
														 @RequestParam(value = "userCoins" , required = false) Integer userCoins,
														 @RequestParam(value = "lessonCompleted" , required = false) Integer lessonCompleted) {

		Integer currentUserXP  = userManagementService.getUserCurrentXP(currentUserId);
		userManagementService.updateCategoryFourLessonOne(currentUserId,lessonCompleted);
		userManagementService.updateUserCoins(currentUserId, userCoins + currentUserXP);

		return "redirect:/dashboard";
	}

	@RequestMapping(value = "/categoryFourLessonTwo", method = RequestMethod.GET)
	public @ResponseBody String categoryFourLessonTwo(Model model ,
													  @RequestParam(value = "userCoins" , required = false) Integer userCoins,
													  @RequestParam(value = "lessonCompleted" , required = false) Integer lessonCompleted) {

		Integer currentUserXP  = userManagementService.getUserCurrentXP(currentUserId);
		userManagementService.updateCategoryFourLessonTwo(currentUserId,lessonCompleted);
		userManagementService.updateUserCoins(currentUserId, userCoins + currentUserXP);

		return "redirect:/dashboard";
	}

	@RequestMapping(value = "/categoryFourLessonThree", method = RequestMethod.GET)
	public @ResponseBody String categoryFourLessonThree(Model model ,
													  @RequestParam(value = "userCoins" , required = false) Integer userCoins,
													  @RequestParam(value = "lessonCompleted" , required = false) Integer lessonCompleted) {

		Integer currentUserXP  = userManagementService.getUserCurrentXP(currentUserId);
		userManagementService.updateCategoryFourLessonThree(currentUserId,lessonCompleted);
		userManagementService.updateUserCoins(currentUserId, userCoins + currentUserXP);

		return "redirect:/dashboard";
	}

	@RequestMapping(value = "/raiseUserStars", method = RequestMethod.GET)
	public @ResponseBody String raiseUserStars(Model model) {

		userManagementService.updateUserStars(currentUserId);

		return "redirect:/dashboard";
	}

	@RequestMapping(value = "/analytics/userPerGender", method = RequestMethod.GET)
	public @ResponseBody UserPerGender[] userPerGender() {
		List<User> userList = userManagementService.getAllUsers();
		HashMap<Integer,String> usersListMap = new HashMap<>();
		for (int i = 0; i < userList.size(); i++) {
			usersListMap.put(i,userList.get(i).getGender());
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
		UserPerGender[] userPerGenders = new UserPerGender[result.size()];
		for (Map.Entry<String, Integer> entry : result.entrySet()) {
			UserPerGender userPerGender = new UserPerGender();
			userPerGender.setGender(entry.getKey());
			userPerGender.setUsers(entry.getValue());
			if (entry.getKey().toLowerCase().equals("male")) {
				userPerGender.setBullet("https://www.amcharts.com/lib/images/faces/C01.png");
				userPerGender.setColor("blue");
			} else {
				userPerGender.setBullet("https://www.amcharts.com/lib/images/faces/FB03.png");
				userPerGender.setColor("pink");
			}
			userPerGenders[i] = userPerGender;
			i++;
		}



		return userPerGenders;
	}
}
