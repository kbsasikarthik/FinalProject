package co.grandcircus.FinalProject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SocialController {

	@RequestMapping("/showConnection")
	public ModelAndView showConnections(
			@PathVariable(value = "name", required = false) String name) {
		ModelAndView mav = new ModelAndView("participant");
		// get current connections for participant
		return mav;
	}
			
		@RequestMapping("/addConnection")
		public ModelAndView showMapPage(
			@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "social", required = false) String social,
			@RequestParam(value = "connectionType", required = false) String connectionType) {
			ModelAndView mav = new ModelAndView("participant");
		return mav;
		}
}
