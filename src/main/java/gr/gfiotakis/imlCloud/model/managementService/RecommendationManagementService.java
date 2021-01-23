package gr.gfiotakis.imlCloud.model.managementService;

import gr.gfiotakis.imlCloud.model.persistence.Recommendation;

import java.util.List;

public interface RecommendationManagementService {
    Recommendation saveRecommendation(Recommendation recommendation);
    List<Recommendation> getRecommendationByUser(Integer userId);
}
