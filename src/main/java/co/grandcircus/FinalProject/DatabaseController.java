package co.grandcircus.FinalProject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import co.grandcircus.FinalProject.dao.IncidentDao;

@Controller
public class DatabaseController {

	
	@Autowired
	IncidentDao incidentDao;
	
	@RequestMapping("/")
	public ModelAndView showhome() {
		ModelAndView mav = new ModelAndView("home");
		mav.addObject("states", incidentDao.getStates());
//		mav.addObject("test", incidentDao.byStateAndCity("Michigan", "Detroit"));
		return mav;
	}
	
	@RequestMapping("/selectCity")
	public ModelAndView showCities(
		@RequestParam("state") String state) {
		System.out.println(state);

		ModelAndView mav = new ModelAndView("home");
//		mav.addObject("states", incidentDao.getStates());
		mav.addObject("state", state);
		mav.addObject("cities", incidentDao.getCities(state));
		return mav;
	}

	@RequestMapping("/listresults/{state}")
	public ModelAndView showResults(@PathVariable("state") String state, @RequestParam("city") String city) {
//	(@RequestParam("state") String state, @RequestParam("city") String city) {
		System.out.println("State - "+state+"City- " +city);
		ModelAndView mav = new ModelAndView("listresults");
		mav.addObject("incidents", incidentDao.byStateAndCity(state, city));
		return mav;
	}
	
	@RequestMapping("/listresultsbyname")
	public ModelAndView showResultsByName() {
		return new ModelAndView("listresultsbyname");
	}
}
