package co.grandcircus.FinalProject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import co.grandcircus.FinalProject.dao.IncidentDetailsDao;

@Controller
public class IncidentController {

	@Autowired
	private IncidentDetailsDao incidentDetailsDao;

	@RequestMapping("/incident/{id}")
	public ModelAndView showIncidentByID(@PathVariable("id") Integer incidentId) {

		ModelAndView mav = new ModelAndView("incident");

		System.out.println("in Controller" + incidentId);

		mav.addObject("incident", incidentDetailsDao.byID(incidentId));
		System.out.println(incidentDetailsDao.byID(incidentId));
		return mav;

	}

}
