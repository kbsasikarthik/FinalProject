package co.grandcircus.FinalProject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import co.grandcircus.FinalProject.dao.IncidentDetailsDao;

@Controller
public class IncidentController {

	@Autowired
	private IncidentDetailsDao incidentDetailsDao;

	@RequestMapping("/incident")
	public ModelAndView showIncidentByDate(@RequestParam(value = "date", required = false) String date,
			@RequestParam(value = "n_killed", required = false) Integer n_killed,
			@RequestParam(value = "n_injured", required = false) Integer n_injured,
			@RequestParam(value = "notes", required = false) String notes,
			@RequestParam(value = "source_url", required = false) String source_url,
			@RequestParam(value = "sources", required = false) String sources,
			@RequestParam(value = "participant_name", required = false) String participant_name,
			@RequestParam(value = "participant_age", required = false) String participant_age,
			@RequestParam(value = "participant_gender", required = false) String participant_gender,
			@RequestParam(value = "participant_status", required = false) String participant_status) {
		ModelAndView mav = new ModelAndView("incident");

		date = "1/21/56";
		n_killed = 22;
		n_injured = 10;
		notes = "notes for whatever";
		source_url = "source";
		sources = "sources plural";
		participant_name = "Bob";
		participant_age = "21";
		participant_gender = "male";
		participant_status = "alive";

		System.out.println("in Controller" + date);

		mav.addObject("date", date);
		mav.addObject("n_killed", n_killed);
		mav.addObject("n_injured", n_injured);
		mav.addObject("notes", notes);
		mav.addObject("source_url", source_url);
		mav.addObject("sources", sources);
		mav.addObject("name", participant_name);
		mav.addObject("age", participant_age);
		mav.addObject("gender", participant_gender);
		mav.addObject("status", participant_status);

		return mav;

	}

}
