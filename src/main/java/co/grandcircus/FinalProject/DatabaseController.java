package co.grandcircus.FinalProject;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import co.grandcircus.FinalProject.dao.IncidentDao;
import co.grandcircus.FinalProject.entity.Incident;

@Controller
public class DatabaseController {

	@Autowired
	IncidentDao incidentDao;

	@RequestMapping("/")
	public ModelAndView showhome() {
		ModelAndView mav = new ModelAndView("home");
		mav.addObject("states", incidentDao.getStates());
		return mav;
	}

	@RequestMapping("/selectCity")
	public ModelAndView showCities(@RequestParam("state") String state) {
		System.out.println(state);

		ModelAndView mav = new ModelAndView("home");
//		mav.addObject("states", incidentDao.getStates());
		mav.addObject("state", state);
		mav.addObject("cities", incidentDao.getCities(state));
		return mav;
	}

	@RequestMapping("/listresults/{state}")
	public ModelAndView showResults(@PathVariable("state") String state, @RequestParam("city") String city) {
		System.out.println("State - " + state + "City- " + city);
		ModelAndView mav = new ModelAndView("listresults");
		mav.addObject("incidents", incidentDao.byStateAndCity(state, city));
		return mav;
	}

	@RequestMapping("/nameSearch")
	public ModelAndView searchNames(@RequestParam("firstName") String firstName,
			@RequestParam("lastName") String lastName) {
		System.out.println(firstName);
		String name = firstName + " " + lastName;

		ModelAndView mav = new ModelAndView("listresultsbyname");
		List<Incident> matchingNames = incidentDao.byName(name);
		mav.addObject("name", name);
		mav.addObject("number", matchingNames.size());
		mav.addObject("matchingNames", matchingNames);
		System.out.println(incidentDao.byName(name));
		return mav;
	}

	@RequestMapping("/dateSearch")
	public ModelAndView searchByDate(@RequestParam("fromDate") LocalDate fromDate,
			@RequestParam("toDate") LocalDate toDate) {
		System.out.println(fromDate + " " + toDate);
		ModelAndView mav = new ModelAndView("listresultsbyname");
		List<Incident> matchingDates = incidentDao.byDateRange(fromDate, toDate);
		mav.addObject("fromDate", fromDate);
		mav.addObject("toDate", toDate);
		mav.addObject("number", matchingDates.size());
		mav.addObject("matchingDates", matchingDates);
		System.out.println(matchingDates);
		return mav;
	}

	@RequestMapping("/listresultsbyname")
	public ModelAndView showResultsByName() {
		return new ModelAndView("listresultsbyname");
	}
}
