package co.grandcircus.FinalProject;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import co.grandcircus.FinalProject.dao.IncidentDao;
import co.grandcircus.FinalProject.entity.Incident;

@Controller
public class DatabaseController {

	@Autowired
	IncidentDao incidentDao;

	@RequestMapping("/")
	public ModelAndView showhome() {
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("states", incidentDao.getStates());
		return mav;
	}
	
	
	@RequestMapping("/selectCity")
	@ResponseBody
	public Set<String> showCities(@RequestParam String state) {
		System.out.println(state);
		Set<String> cities = incidentDao.getCities(state);
		System.out.println(cities);
		return cities;
	}
	
	@RequestMapping("/listresults")
	public ModelAndView showResults(@RequestParam("state") String state, @RequestParam("city") String city) {
		System.out.println("In controller - received - State - " + state + "City- " + city);
		ModelAndView mav = new ModelAndView("listresults");
		mav.addObject("state", state);
		mav.addObject("city", city);
		List<Incident> incidents = incidentDao.byStateAndCity(state, city);
		System.out.println("Result set IN controller - "+incidents);
		mav.addObject("incidents", incidents);
		mav.addObject("back", "/");
		return mav;
	}
	


//	@RequestMapping("/selectCity")
//	public ModelAndView showCities(@RequestParam("state") String state) {
//		System.out.println(state);
//
//		ModelAndView mav = new ModelAndView("home");
////		mav.addObject("states", incidentDao.getStates());
//		mav.addObject("state", state);
//		mav.addObject("cities", incidentDao.getCities(state));
//		return mav;
//	}
//
//	@RequestMapping("/listresults/{state}")
//	public ModelAndView showResults(@PathVariable("state") String state, @RequestParam("city") String city) {
//		System.out.println("State - " + state + "City- " + city);
//		ModelAndView mav = new ModelAndView("listresults");
//		mav.addObject("state", state);
//		mav.addObject("city", city);
//		mav.addObject("incidents", incidentDao.byStateAndCity(state, city));
////		mav.addObject("back", "/");
//		return mav;
//	}

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
		mav.addObject("back", "/");

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
	
	@RequestMapping("/dateSearch/{state}/{city}")
	public ModelAndView searchByDate(	
		@RequestParam("fromDate") String startDate,
		@RequestParam("toDate") String endDate, @PathVariable ("state") String state, @PathVariable("city") String city) throws Exception {
		ModelAndView mav = new ModelAndView("listresults");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date fromDate = sdf.parse(startDate);
		Date toDate = sdf.parse(endDate);
		System.out.println("From Date - "+fromDate);
		System.out.println("To Date - "+toDate);
		List<Incident> matchingDates = incidentDao.byDateAndLocation(fromDate, toDate, state, city);

		mav.addObject("fromDate", fromDate);
		mav.addObject("toDate", toDate);
		mav.addObject("number", matchingDates.size());
		mav.addObject("incidents", matchingDates );
		mav.addObject("back", "/listresults?state="+state+"&city="+city);
		//System.out.println(matchingDates);
		return mav;
	}

	@RequestMapping("/listresultsbyname")
	public ModelAndView showResultsByName() {
		ModelAndView mav = new ModelAndView("listresultsbyname");
		mav.addObject("back", "/");
		return mav;

	}
	
	@RequestMapping("/about")
	public ModelAndView showAbout() {
		ModelAndView mav = new ModelAndView("about");
		mav.addObject("back", "/");
		return mav;

	}
}
