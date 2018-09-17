package co.grandcircus.FinalProject;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import co.grandcircus.FinalProject.dao.ConnectionDao;
import co.grandcircus.FinalProject.dao.IncidentDao;
import co.grandcircus.FinalProject.entity.Connection;

@Controller
public class SocialController {

	@Autowired
	ConnectionDao connectionDao;
	
	@RequestMapping("/showConnection/{name}/{incidentID}")
	public ModelAndView showConnections(
			@RequestParam(value = "name", required = false) String participant,
			@RequestParam(value = "incidentID") Integer incidentID) {
		ModelAndView mav = new ModelAndView("participant");
		mav.addObject("name", participant);
		mav.addObject("incidentID", incidentID);
		// get current connections for participant
		List<Connection> connection = connectionDao.byParticipantAndIncident(participant, incidentID);
		mav.addObject(connection);
		return mav;
	}
			
		@RequestMapping("/addConnection/{participant}/{incidentID}")
		public ModelAndView showMapPage(
			@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "facebook", required = false) String facebook,
			@RequestParam(value = "twitter", required = false) String twitter,
			@RequestParam(value = "connectionType", required = false) String connectionType,
			@RequestParam(value = "participant", required = false) String participant,
			@RequestParam(value = "incidentID") Integer incidentID)  {
			ModelAndView mav = new ModelAndView("participant");
			mav.addObject("name", participant);
			mav.addObject("incidentID", incidentID);
			Connection connection = new Connection(name, facebook, twitter, connectionType, participant, incidentID);
			
		return mav;
		}
}
