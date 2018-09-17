package co.grandcircus.FinalProject;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.web.bind.annotation.PathVariable;
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
		Set<String> cities = incidentDao.getCities(state);
		return cities;
	}
	@RequestMapping("/stateandcity")
	public ModelAndView stateandcity(@RequestParam String state, @RequestParam String city) {
		ModelAndView mav = new ModelAndView("redirect:/listresults");
		mav.addObject("state",state);
		mav.addObject("city",city);
		
		return mav;
	}
//	
//	@RequestMapping("/listresults")
//	public ModelAndView showResults(@RequestParam(required=false) Integer page, @RequestParam("state") String state, @RequestParam("city") String city) {
//		System.out.println("In controller - received - State - " + state + "City- " + city);
//		ModelAndView mav = new ModelAndView("listresults");
//		mav.addObject("state", state);
//		mav.addObject("city", city);
//		List<Incident> incidents = incidentDao.byStateAndCity(state, city);
//		mav.addObject("incidents", incidents);
//		mav.addObject("back", "/");
//		
////		 PagedListHolder<Incident> pagedListHolder = new PagedListHolder<>(incidents);
////	        pagedListHolder.setPageSize(100);
////	        mav.addObject("maxPages", pagedListHolder.getPageCount());
////
////	        if(page==null || page < 1 || page > pagedListHolder.getPageCount())page=1;
////
////	        mav.addObject("page", page);
////	        if(page == null || page < 1 || page > pagedListHolder.getPageCount()){
////	            pagedListHolder.setPage(0);
////	            mav.addObject("incidents", pagedListHolder.getPageList());
////	        }
////	        else if(page <= pagedListHolder.getPageCount()) {
////	            pagedListHolder.setPage(page-1);
////	            mav.addObject("incidents", pagedListHolder.getPageList());
////	        }
//		return mav;
//	}
	
	private static final int PAGE_SIZE = 10;			// Number of rows to contain per page
	private long totalIncidentCount;
	
	private PageRequest gotoPage(int page)
	{
		PageRequest request = new PageRequest(page,PAGE_SIZE,Sort.Direction.DESC,"id");
		return request;
	}

	@RequestMapping("/listresults")
	public ModelAndView showResults(@RequestParam(required=false) Integer page, @RequestParam("state") String state,
			@RequestParam("city") String city,@RequestParam(value="pageNo", required=false, defaultValue = "0") String pageNo) {
		System.out.println("In controller - received - State - " + state + "City- " + city+"Page NUmber- "+pageNo);
		ModelAndView mav = new ModelAndView("listresults");
		int lastPageNo;
		int gotoPageNo=Integer.parseInt(pageNo);
		mav.addObject("state", state);
		mav.addObject("city", city);
		List<Incident> incidents = new ArrayList<>();

		for(Incident i:incidentDao.byStateAndCity(gotoPage(gotoPageNo),state, city))			// fetches rows from DB as per Page No
		{
			incidents.add(i);
		}


		totalIncidentCount=incidents.size(); 			//total no of Incidents
		if(totalIncidentCount%PAGE_SIZE!=0)
		lastPageNo=(int)(totalIncidentCount/PAGE_SIZE)+1;					// get last page No (zero based)
		else
		lastPageNo=(int)(totalIncidentCount/PAGE_SIZE);

		System.out.println("Last page number - "+lastPageNo);

		mav.addObject("lastPageNo",lastPageNo);					
//		mav.addAttribute("users",allUsers);
//		return "index";
//		List<Incident> incidents = incidentDao.byStateAndCity(state, city);
		mav.addObject("incidents", incidents);
		mav.addObject("back", "/");
		
//		 PagedListHolder<Incident> pagedListHolder = new PagedListHolder<>(incidents);
//	        pagedListHolder.setPageSize(100);
//	        mav.addObject("maxPages", pagedListHolder.getPageCount());
//
//	        if(page==null || page < 1 || page > pagedListHolder.getPageCount())page=1;
//
//	        mav.addObject("page", page);
//	        if(page == null || page < 1 || page > pagedListHolder.getPageCount()){
//	            pagedListHolder.setPage(0);
//	            mav.addObject("incidents", pagedListHolder.getPageList());
//	        }
//	        else if(page <= pagedListHolder.getPageCount()) {
//	            pagedListHolder.setPage(page-1);
//	            mav.addObject("incidents", pagedListHolder.getPageList());
//	        }
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

//	@RequestMapping("/dateSearch")
//	public ModelAndView searchByDate(@RequestParam("fromDate") String fromDate,
//			@RequestParam("toDate") String toDate) {
//		System.out.println(fromDate + " " + toDate);
//		ModelAndView mav = new ModelAndView("listresultsbyname");
//		List<Incident> matchingDates = incidentDao.byDateRange(fromDate, toDate);
//		mav.addObject("fromDate", fromDate);
//		mav.addObject("toDate", toDate);
//		mav.addObject("number", matchingDates.size());
//		mav.addObject("matchingDates", matchingDates);
//		System.out.println(matchingDates);
//		return mav;
//	}
//	
	
	@RequestMapping("/dateSearch/{name}")
	public ModelAndView searchByDateandName(	
		@RequestParam("fromDate") String startDate,
		@RequestParam("toDate") String endDate, @PathVariable ("name") String name) throws Exception {
		ModelAndView mav = new ModelAndView("listresultsbyname");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date fromDate = sdf.parse(startDate);
		Date toDate = sdf.parse(endDate);
		System.out.println("From Date - "+fromDate);
		System.out.println("To Date - "+toDate);
		List<Incident> matchingDates = incidentDao.byDateAndName(fromDate, toDate, name);
		String[] names=name.split(" ");
		String firstName=names[0];
		String lastName = names[1];
		mav.addObject("fromDate", fromDate);
		mav.addObject("toDate", toDate);
		mav.addObject("number", matchingDates.size());
		mav.addObject("matchingNames", matchingDates );
		mav.addObject("back", "/nameSearch?firstName="+firstName+"&lastName="+lastName);
		//System.out.println(matchingDates);
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
