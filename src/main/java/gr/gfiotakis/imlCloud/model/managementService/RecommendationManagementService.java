package gr.gfiotakis.imlCloud.model.managementService;

import gr.gfiotakis.imlCloud.model.persistence.Recommendation;
import gr.gfiotakis.imlCloud.model.persistence.RecommendationAnalytics;

import java.util.List;

public interface RecommendationManagementService {
    Recommendation saveRecommendation(Recommendation recommendation);
    List<Recommendation> getRecommendations();
}
