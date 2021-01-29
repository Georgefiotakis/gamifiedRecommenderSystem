package gr.gfiotakis.imlCloud.model.persistence.dao;

import gr.gfiotakis.imlCloud.model.persistence.Recommendation;
import gr.gfiotakis.imlCloud.model.persistence.RecommendationAnalytics;
import jdk.nashorn.internal.runtime.events.RecompilationEvent;

import java.util.List;

public interface RecommendationDAO {
    Recommendation saveRecommendation(Recommendation recommendation);
    List<Recommendation> getRecommendations();
}
