package co.grandcircus.FinalProject;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import co.grandcircus.FinalProject.dao.IncidentDetailsDao;
import co.grandcircus.FinalProject.entity.Incident;

@Controller
public class IncidentController {

	@Autowired
	private IncidentDetailsDao incidentDetailsDao;

	@RequestMapping("/incident/{id}")
	public ModelAndView showIncidentByID(@PathVariable("id") Integer incidentId) {

		ModelAndView mav = new ModelAndView("incident");

		System.out.println("in Controller" + incidentId);
		Incident incident = incidentDetailsDao.byID(incidentId);
		mav.addObject("incident", incident);
		List<String> ages = incident.getAges();
		List<String> gender = incident.getGender();
		List<String> status = incident.getStatus();
		List<String> details = new ArrayList<>();
		int maxLength = 0;
        if ((ages.size() > gender.size()) && (ages.size() > status.size())) {
            maxLength = ages.size();
        } else if ((gender.size() > ages.size()) && (gender.size() > status.size())) {
            maxLength = gender.size();
        } else if ((status.size() > ages.size()) && (status.size() > gender.size())) {
            maxLength = status.size();
        }
        System.out.println(maxLength);
        for (int i = 0; i < maxLength; i++) {
            details.add(gender.get(i) + " , " + ages.get(i) + " - " + status.get(i));
        }


//		for(int i=0; i<gender.size(); i++) {
//			details.add(gender.get(i)+" , "+ages.get(i)+" - "+status.get(i));
//		}
		mav.addObject("details", details);
		System.out.println(incidentDetailsDao.byID(incidentId));
		return mav;

	}

}