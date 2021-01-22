package gr.gfiotakis.imlCloud.model.managementService.impl;

import gr.gfiotakis.imlCloud.model.managementService.OrangePlanetManagementService;
import gr.gfiotakis.imlCloud.model.persistence.OrangePlanet;
import gr.gfiotakis.imlCloud.model.persistence.dao.OrangePlanetDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

public class OrangePlanetManagementServiceImpl implements OrangePlanetManagementService {
    @Autowired
    private OrangePlanetDAO orangePlanetDAO;

    @Override
    @Transactional
    public void saveOrangePlanetAnswers(OrangePlanet orangePlanet) {
        orangePlanetDAO.saveOrangePlanetAnswers(orangePlanet);
    }
}
