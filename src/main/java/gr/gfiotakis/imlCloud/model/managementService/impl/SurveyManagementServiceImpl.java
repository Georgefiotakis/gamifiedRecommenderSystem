package gr.gfiotakis.imlCloud.model.managementService.impl;

import gr.gfiotakis.imlCloud.model.managementService.SurveyManagementService;
import gr.gfiotakis.imlCloud.model.persistence.Survey;
import gr.gfiotakis.imlCloud.model.persistence.User;
import gr.gfiotakis.imlCloud.model.persistence.dao.SurveyDAO;
import gr.gfiotakis.imlCloud.model.persistence.dao.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

public class SurveyManagementServiceImpl implements SurveyManagementService {
    @Autowired
    private SurveyDAO surveyDAO;

    @Override
    @Transactional
    public Survey saveSurvey(Survey survey) {
        return surveyDAO.saveSurvey(survey);
    }
}
