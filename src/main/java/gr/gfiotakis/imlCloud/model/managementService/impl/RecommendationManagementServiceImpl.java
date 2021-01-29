package gr.gfiotakis.imlCloud.model.managementService.impl;

import gr.gfiotakis.imlCloud.model.managementService.RecommendationManagementService;
import gr.gfiotakis.imlCloud.model.persistence.Recommendation;
import gr.gfiotakis.imlCloud.model.persistence.RecommendationAnalytics;
import gr.gfiotakis.imlCloud.model.persistence.dao.RecommendationDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public class RecommendationManagementServiceImpl implements RecommendationManagementService {
    @Autowired
    RecommendationDAO recommendationDAO;

    @Override
    @Transactional
    public Recommendation saveRecommendation(Recommendation recommendation) {
        return recommendationDAO.saveRecommendation(recommendation);
    }

    @Override
    @Transactional
    public List<Recommendation> getRecommendations() {
        return recommendationDAO.getRecommendations();
    }
}
