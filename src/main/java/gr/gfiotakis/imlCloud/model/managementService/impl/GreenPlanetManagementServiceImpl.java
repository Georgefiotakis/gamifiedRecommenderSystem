package gr.gfiotakis.imlCloud.model.managementService.impl;

import gr.gfiotakis.imlCloud.model.managementService.GreenPlanetManagementService;
import gr.gfiotakis.imlCloud.model.persistence.GreenPlanet;
import gr.gfiotakis.imlCloud.model.persistence.dao.GreenPlanetDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

public class GreenPlanetManagementServiceImpl implements GreenPlanetManagementService {
    @Autowired
    private GreenPlanetDAO greenPlanetDAO;

    @Override
    @Transactional
    public void saveGreenPlanetAnswers(GreenPlanet greenPlanet) {
        greenPlanetDAO.saveGreenPlanetAnswers(greenPlanet);
    }
}
