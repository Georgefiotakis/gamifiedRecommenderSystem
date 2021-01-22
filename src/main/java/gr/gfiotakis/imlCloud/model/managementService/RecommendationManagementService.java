package gr.gfiotakis.imlCloud.model.managementService;

import gr.gfiotakis.imlCloud.model.persistence.Recommendation;

public interface RecommendationManagementService {
    Recommendation saveRecommendation(Recommendation recommendation);
}
