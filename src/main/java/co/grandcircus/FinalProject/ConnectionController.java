package co.grandcircus.FinalProject;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import co.grandcircus.FinalProject.dao.ConnectionDao;
import co.grandcircus.FinalProject.entity.Connection;

@Controller
public class ConnectionController {

	@Autowired
	ConnectionDao connectionDao;
	
	@RequestMapping("/connectionsearch")
	public ModelAndView showSearchOptions () {
		ModelAndView mav = new ModelAndView("connectionsearch");
		return mav;
	}
	
	@RequestMapping("/connectionNameSearch")
	public ModelAndView showNameConnections(
			@RequestParam(value = "connectName", required = false) String connName) {
		ModelAndView mav = new ModelAndView("connectionsresults");
		System.out.println(connName);
		List<Connection> connections = connectionDao.byConnectionName(connName);
		mav.addObject("connections",connections);
		System.out.println(connections);
		return mav;
	}
			
	@RequestMapping("/facebookSearch")
	public ModelAndView showFacebookConnections(
			@RequestParam(value = "facebookName", required = false) String facebookName) {
		ModelAndView mav = new ModelAndView("connectionsresults");
		System.out.println(facebookName);
		List<Connection> connections = connectionDao.byFacebookName(facebookName);
		mav.addObject("connections", connections);
		System.out.println(connections);
		return mav;
	}
		
	@RequestMapping("/twitterSearch")
	public ModelAndView showTwitterConnections(
			@RequestParam(value = "twitterName", required = false) String twitterName) {
		ModelAndView mav = new ModelAndView("connectionsresults");
		List<Connection> connections = connectionDao.byTwitterName(twitterName);
		mav.addObject("connections", connections);
		return mav;
	}
}
