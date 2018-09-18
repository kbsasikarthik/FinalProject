package co.grandcircus.FinalProject;

import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import co.grandcircus.FinalProject.dao.ConnectionDao;

@Controller
public class SocialController {

	@Autowired
	ConnectionDao connectionDao;

//	@RequestMapping("/showConnection/{name}/{incidentID}")
//	public ModelAndView showConnections(@RequestParam(value = "name", required = false) String participant,
//			@RequestParam(value = "incidentID") Integer incidentID) {
//		ModelAndView mav = new ModelAndView("participant");
//		mav.addObject("name", participant);
//		mav.addObject("incidentID", incidentID);
//		// get current connections for participant
//		List<Connection> connection = connectionDao.byParticipantAndIncident(participant, incidentID);
//		mav.addObject(connection);
//		return mav;
//	}

	@RequestMapping("/addConnection/{name}")
	public ModelAndView showAddConnectionPage(@PathParam(value = "name") String name) {
//			@PathParam(value = "incidentID") Integer incidentID,
//			@RequestParam(value = "facebook", required = false) String facebook,
//			@RequestParam(value = "twitter", required = false) String twitter,
//			@RequestParam(value = "connectionType", required = false) String connectionType,
//			@RequestParam(value = "participant", required = false) String participantName) {
		System.out.println(name);

		ModelAndView mav = new ModelAndView("participant");
		mav.addObject("person", name);

//		mav.addObject("incidentID", incidentID);
//		Connection connection = new Connection(participantName, facebook, twitter, connectionType, name, incidentID);

		return mav;
	}

}
