package co.grandcircus.FinalProject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import co.grandcircus.FinalProject.mapentity.SearchLocation;

@Controller
public class MapController {

	@RequestMapping("/")
	public ModelAndView showHomePage() {

		ModelAndView mav = new ModelAndView("home");

		return mav;

	}

	@RequestMapping("/Map")
	public ModelAndView showMapPage(@RequestParam(value = "streetNum", required = false) String streetNum,
			@RequestParam(value = "streetName", required = false) String streetName,
			@RequestParam(value = "city", required = false) String city,
			@RequestParam(value = "state", required = false) String state,
			@RequestParam(value = "zip", required = false) Integer zip) {

		SearchLocation location = new SearchLocation(streetNum, streetName, city, state, zip);

		city = "Detroit";
		state = "Michigan";
		streetNum = "14007";
		streetName = "Coyle";

		ModelAndView mav = new ModelAndView("Map");
		mav.addObject("city", city);
		mav.addObject("state", state);
		mav.addObject("number", streetNum);
		mav.addObject("name", streetName);

//		System.out.println(location);

		return mav;

	}

}
