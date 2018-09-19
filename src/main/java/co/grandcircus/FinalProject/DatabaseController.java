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
//		mav.addObject("back", "/");
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

	@RequestMapping("/listresults")
	public ModelAndView showResults(@RequestParam(value="pageNo", defaultValue="1", required=false) Integer page, @RequestParam("state") String state, @RequestParam("city") String city) {
	
		ModelAndView mav = new ModelAndView("listresults");
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
				lastPageNo=(int)(totalCount/40+1);	
			else
				lastPageNo=(int)(totalCount/40);
		}
		mav.addObject("pageNo", page);
		mav.addObject("lastPageNo", lastPageNo);
		mav.addObject("state", state);
		mav.addObject("city", city);
		mav.addObject("incidents", incidents);
//		mav.addObject("back", "/");
		mav.addObject("numberOfItems", totalCount);
		mav.addObject("fromDate", "2013-01-01");
		mav.addObject("toDate", "2018-03-31");
		mav.addObject("url", "/listresults?state="+state+"&city="+city+"&pageNo=");
		return mav;
	}
	

	@RequestMapping("/dateSearch/{state}/{city}")
	public ModelAndView searchByDate(
			@RequestParam(value="pageNo", defaultValue="1", required=false) Integer page,
			@RequestParam(value = "fromDate", defaultValue = "2013-01-01") String fromDate,
			@RequestParam(value = "toDate", defaultValue = "2018-03-31") String toDate,
			@PathVariable("state") String state, @PathVariable("city") String city) throws Exception {
		ModelAndView mav = new ModelAndView("listresults");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date from = sdf.parse(fromDate);
		Date to = sdf.parse(toDate);
		int lastPageNo=0;
		long totalCount=incidentDao.countByLocationAndDate(from, to, state, city);
		List<Incident> matchingDates;
		if(totalCount <=40) {
			matchingDates = incidentDao.allByDateAndLocation(from, to, state, city);			
			lastPageNo=0;
		}
		else {
			matchingDates = incidentDao.byDateAndLocation(page, from, to, state, city);			
			if(totalCount%40==0)
				lastPageNo=(int)(totalCount/40+1);	
			else
				lastPageNo=(int)(totalCount/40);
		}

		mav.addObject("fromDate", fromDate);
		mav.addObject("toDate", toDate);
		mav.addObject("pageNo", page);
		mav.addObject("lastPageNo", lastPageNo);
		mav.addObject("number", totalCount);
		mav.addObject("incidents", matchingDates);
//		mav.addObject("back", "/listresults?state=" + state + "&city=" + city);
		mav.addObject("url", "/dateSearch/"+state+"/"+city+"?pageNo=");
		return mav;
	}

	@RequestMapping("/nameSearch")
	public ModelAndView searchNames(@RequestParam(value="pageNo", defaultValue="1", required=false) Integer page,
			@RequestParam("firstName") String firstName,
			@RequestParam("lastName") String lastName) {
		
		String name = firstName + " " + lastName;
		ModelAndView mav = new ModelAndView("listresultsbyname");
		List<Incident> matchingNames;
		int lastPageNo=0;
		long totalCount=incidentDao.countByName(name);
		
		if(totalCount <=40) {
			matchingNames = incidentDao.allByName(name);
			lastPageNo=0;
		}else {
			matchingNames = incidentDao.byName(page, name);
			if(totalCount%40==0)
				lastPageNo=(int)(totalCount/40+1);					
			else
				lastPageNo=(int)(totalCount/40);
		}

		mav.addObject("number", totalCount);
		mav.addObject("firstName", firstName);
		mav.addObject("lastName", lastName);
		mav.addObject("fromDate", "2013-01-01");
		mav.addObject("toDate", "2018-03-31");
		mav.addObject("name", name);
		mav.addObject("pageNo", page);
		mav.addObject("lastPageNo", lastPageNo);
		mav.addObject("matchingNames", matchingNames);
//		mav.addObject("back", "/");
		mav.addObject("numberOfItems", totalCount);
		mav.addObject("url", "/nameSearch?firstName="+firstName+"&lastName="+lastName+"&pageNo=");
		return mav;
	}

	@RequestMapping("/dateSearch/{name}")
	public ModelAndView searchByDateandName(
			@RequestParam(value="pageNo", defaultValue="1", required=false) Integer page,
			@RequestParam(value = "fromDate", defaultValue = "2013-01-01") String fromDate,
			@RequestParam(value = "toDate", defaultValue = "2018-03-31") String toDate,
			@PathVariable("name") String name) throws Exception {
		ModelAndView mav = new ModelAndView("listresultsbyname");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date from = sdf.parse(fromDate);
		Date to = sdf.parse(toDate);
		int lastPageNo=0;
		long totalCount=incidentDao.countByNameAndDate(from, to, name);
		List<Incident> matchingDates;
		if(totalCount <=40) {
			matchingDates = incidentDao.allByDateAndName(from, to, name);
			lastPageNo=0;
		}
		else {
			matchingDates = incidentDao.byDateAndName(page, from, to, name);			
			if(totalCount%40==0)
				lastPageNo=(int)(totalCount/40+1);	
			else
				lastPageNo=(int)(totalCount/40);
		}
		String[] names = null;
		String firstName = "";
		String lastName = "";

		if (name.contains(" ")) {
			names = name.split(" ");
			firstName = names[0];
			lastName = names[1];
		}
		mav.addObject("fromDate", fromDate);
		mav.addObject("toDate", toDate);
		mav.addObject("number", totalCount);
		mav.addObject("pageNo", page);
		mav.addObject("lastPageNo", lastPageNo);
		mav.addObject("matchingNames", matchingDates);
//		mav.addObject("back", "/nameSearch?firstName=" + firstName + "&lastName=" + lastName);
		mav.addObject("url", "/dateSearch/"+name+"?pageNo=");

		return mav;
	}


	@RequestMapping("/about")
	public ModelAndView showAbout() {
		ModelAndView mav = new ModelAndView("about");
//		mav.addObject("back", "/");
		return mav;

	}

}
