package gr.gfiotakis.imlCloud.model.persistence.dao;

import gr.gfiotakis.imlCloud.model.persistence.Recommendation;

public interface RecommendationDAO {
    Recommendation saveRecommendation(Recommendation recommendation);
}
