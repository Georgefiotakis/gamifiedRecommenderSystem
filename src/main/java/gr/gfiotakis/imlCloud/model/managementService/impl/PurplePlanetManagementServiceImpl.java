package gr.gfiotakis.imlCloud.model.managementService.impl;

import gr.gfiotakis.imlCloud.model.managementService.PurplePlanetManagementService;
import gr.gfiotakis.imlCloud.model.persistence.PurplePlanet;
import gr.gfiotakis.imlCloud.model.persistence.dao.PurplePlanetDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

public class PurplePlanetManagementServiceImpl implements PurplePlanetManagementService {
    @Autowired
    private PurplePlanetDAO purplePlanetDAO;

    @Override
    @Transactional
    public void savePurplePlanetAnswers(PurplePlanet purplePlanet) {
        purplePlanetDAO.savePurplePlanetAnswers(purplePlanet);
    }
}
