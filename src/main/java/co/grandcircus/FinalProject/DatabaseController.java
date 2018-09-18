package co.grandcircus.FinalProject;

import java.text.SimpleDateFormat;
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

	@RequestMapping("/privacy")
	public ModelAndView showPrivacy() {
		ModelAndView mav = new ModelAndView("privacy");
		mav.addObject("back", "/");
		return mav;
	}
	@RequestMapping("/newhome")
	public ModelAndView shownewhome() {
		ModelAndView mav = new ModelAndView("newhome");
		mav.addObject("states", incidentDao.getStates());
		return mav;
	}
	@RequestMapping("/")
	public ModelAndView showhome() {
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("states", incidentDao.getStates());
		return mav;
	}

	@RequestMapping("/selectCity")
	@ResponseBody
	public Set<String> showCities(@RequestParam String state) {
		Set<String> cities = incidentDao.getCities(state);
		return cities;
	}

	@RequestMapping("/stateandcity")
	public ModelAndView stateandcity(@RequestParam String state, @RequestParam String city) {
		ModelAndView mav = new ModelAndView("redirect:/listresults");
		mav.addObject("state", state);
		mav.addObject("city", city);

		return mav;
	}

//	@RequestMapping("/listresults")
//	public ModelAndView showResults @RequestParam("state") String state, @RequestParam("city") String city) {
//		System.out.println("In controller - received - State - " + state + "City- " + city);
//		ModelAndView mav = new ModelAndView("listresults");
//		mav.addObject("state", state);
//		mav.addObject("city", city);
//		List<Incident> incidents = incidentDao.byStateAndCity(state, city);
//		mav.addObject("incidents", incidents);
//		mav.addObject("back", "/");
//		return mav;
//	}

//	@RequestMapping("/listresults")

//	public String list(Model model, Integer offset, Integer maxResults) {

//		model.addAttribute("incidents", incidentDao.byStateAndCity(offset, maxResults));
//		model.addAttribute("count", incidentDao.count());
//		model.addAttribute("offset", offset);
//		return "/listresults";
//	}
//
	@RequestMapping("/listresults")
	public ModelAndView showResults(@RequestParam(value="pageNo", defaultValue="1", required=false) Integer page, @RequestParam("state") String state, @RequestParam("city") String city) {
		System.out.println("State - " + state + "City- " + city);
		
		ModelAndView mav = new ModelAndView("listresults");
		//List<Incident> allIncidents = incidentDao.allByStateAndCity(state, city);

		int lastPageNo=0;
		long totalCount=incidentDao.countByStateAndCity(state, city);
		List<Incident> incidents;
		if(totalCount <=40) {
			incidents = incidentDao.allByStateAndCity(state, city);
			lastPageNo=0;
		}
		else {
			incidents = incidentDao.byStateAndCity(page, state, city);
		
		if(totalCount%40==0)
	
		lastPageNo=(int)(totalCount/40+1);					// get last page No (zero based)
		else
		lastPageNo=(int)(totalCount/40);
		}
		System.out.println(lastPageNo);
		mav.addObject("pageNo", page);
		mav.addObject("lastPageNo", lastPageNo);
		mav.addObject("state", state);
		mav.addObject("city", city);
//		List<Incident> incidents = incidentDao.byStateAndCity(page, state, city);
		mav.addObject("incidents", incidents);
		mav.addObject("back", "/");
		mav.addObject("numberOfItems", totalCount);
		return mav;
	}

	@RequestMapping("/nameSearch")
	public ModelAndView searchNames(@RequestParam("firstName") String firstName,
			@RequestParam("lastName") String lastName) {
		System.out.println(firstName);
		String name = firstName + " " + lastName;

		ModelAndView mav = new ModelAndView("listresultsbyname");
		List<Incident> matchingNames = incidentDao.byName(name);
		mav.addObject("fromDate","2013-01-01");
		mav.addObject("toDate","2018-03-31");
		mav.addObject("name", name);
		mav.addObject("number", matchingNames.size());
		mav.addObject("matchingNames", matchingNames);
		System.out.println(incidentDao.byName(name));
		mav.addObject("back", "/");

		return mav;
	}

	@RequestMapping("/dateSearch/{name}")
	public ModelAndView searchByDateandName(@RequestParam(value="fromDate", defaultValue="2013-01-01") String fromDate,
			@RequestParam(value="toDate", defaultValue="2018-03-31") String toDate, @PathVariable("name") String name) throws Exception {
		ModelAndView mav = new ModelAndView("listresultsbyname");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date from = sdf.parse(fromDate);
		Date to = sdf.parse(toDate);
		System.out.println("From Date - " + from);
		
		System.out.println("To Date - " + to);
		List<Incident> matchingDates = incidentDao.byDateAndName(from, to, name);
		String[] names = null;
		String firstName = "";
		String lastName = "";

		if(name.contains(" ")) {
			names = name.split(" ");
			firstName = names[0];
			lastName = names[1];
		}
		mav.addObject("fromDate", fromDate);
		mav.addObject("toDate", toDate);

//		mav.addObject("fromDate", from);
//		mav.addObject("toDate", to);
		mav.addObject("number", matchingDates.size());
		mav.addObject("matchingNames", matchingDates);
		mav.addObject("back", "/nameSearch?firstName=" + firstName + "&lastName=" + lastName);
		// System.out.println(matchingDates);
		return mav;
	}

	@RequestMapping("/dateSearch/{state}/{city}")
	public ModelAndView searchByDate(@RequestParam("fromDate") String startDate, @RequestParam("toDate") String endDate,
			@PathVariable("state") String state, @PathVariable("city") String city) throws Exception {
		ModelAndView mav = new ModelAndView("listresults");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date fromDate = sdf.parse(startDate);
		Date toDate = sdf.parse(endDate);
		System.out.println("From Date - " + fromDate);
		System.out.println("To Date - " + toDate);
		List<Incident> matchingDates = incidentDao.byDateAndLocation(fromDate, toDate, state, city);

		mav.addObject("fromDate", fromDate);
		mav.addObject("toDate", toDate);
		mav.addObject("number", matchingDates.size());
		mav.addObject("incidents", matchingDates);
		mav.addObject("back", "/listresults?state=" + state + "&city=" + city);
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
