package co.grandcircus.FinalProject;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import co.grandcircus.FinalProject.dao.ConnectionDao;
import co.grandcircus.FinalProject.entity.Connection;

@Controller
public class SocialController {

	@Autowired
	ConnectionDao connectionDao;

//	@RequestMapping("/showConnection/{name}/{incidentID}")
//	public ModelAndView showConnections(
//			@PathVariable(value = "name", required = false) String participant,
//			@PathVariable(value = "incidentId") Integer incidentId) {
//		ModelAndView mav = new ModelAndView("participant");
//		mav.addObject("name", participant);
//		mav.addObject("incidentID", incidentID);
//		System.out.println("showConnection Method" + participant);
//		// get current connections for participant
//		List<Connection> connections = connectionDao.byParticipantAndIncident(participant, incidentID);
//		mav.addObject("connections", connections);
//		return mav;
//	}

	@RequestMapping("/addConnection/{name}/{id}")
	public ModelAndView showAddConnectionPage(@PathVariable(value = "name") String participantName,
			@PathVariable(value = "id") Integer incidentId) {
		System.out.println("AddConnection" + participantName + incidentId);
		ModelAndView mav = new ModelAndView("participant");
		mav.addObject("person", participantName);
		mav.addObject("id", incidentId);
		List<Connection> connections = connectionDao.byParticipantAndIncident(participantName, incidentId);
		mav.addObject("connections", connections);
		return mav;
	}

	@RequestMapping(value = "/addConnection/create/{person}/{id}")
	public ModelAndView submitConnectioneForm(@PathVariable(value = "person") String participantName,
			@PathVariable(value = "id") Integer incidentId,
			@RequestParam(value = "facebook", required = false) String facebook,
			@RequestParam(value = "twitter", required = false) String twitter,
			@RequestParam(value = "connectionType", required = false) String connectionType,
			@RequestParam(value = "name", required = false) String connectionName) {

		Connection newConnection = new Connection(participantName, facebook, twitter, connectionType, connectionName,
				incidentId);
		connectionDao.create(newConnection);
		System.out.println(incidentId);

		return new ModelAndView("redirect:/incident/{id}");
	}

}
