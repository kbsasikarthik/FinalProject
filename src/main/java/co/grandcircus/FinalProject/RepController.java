package co.grandcircus.FinalProject;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import co.grandcircus.FinalProject.entity.RepResult;
import co.grandcircus.FinalProject.entity.Representative;
import co.grandcircus.FinalProject.entity.RepresentativeResult;

@Controller
public class RepController {
	

//	
//	@RequestMapping("/repbyzip")
//	public ModelAndView showreps(@RequestParam("zipcode") Integer zipcode, @RequestParam("state") String state) {
////	public ModelAndView showdetails(@RequestParam("state") String state) {	
////		System.out.println(zipcode+","+state);
//		ModelAndView mav = new ModelAndView("show-rep");
////		String states = "Michigan";
//		RestTemplate restTemplate = new RestTemplate();
//				
//		List<HttpMessageConverter<?>> messageConverters = new ArrayList<HttpMessageConverter<?>>();
//		MappingJackson2HttpMessageConverter msgconverter = new MappingJackson2HttpMessageConverter();
//		List<MediaType> mediaTypes = new ArrayList<MediaType>();
//		mediaTypes.add(MediaType.TEXT_HTML);
//		msgconverter.setSupportedMediaTypes(mediaTypes);
//		messageConverters.add(msgconverter);
//		restTemplate.setMessageConverters(messageConverters);
////		
//
//		String url = "https://whoismyrepresentative.com/getall_mems.php?zip="+zipcode+"&output=json";
////		String url = "https://openstates.org/api/v1/legislators/geo/?lat="+lat+"&long="+lan+"&apikey=239038b3-30a9-4f08-a887-90bae55dd133";
////		opnstates.org apikey - 239038b3-30a9-4f08-a887-90bae55dd133
//
////		Integer zip = zipcode;
//		ResponseEntity<RepResult> response = restTemplate.exchange(url, HttpMethod.GET, null, RepResult.class);
//		System.out.println(response);
//		RepResult result = response.getBody();
//		System.out.println(result.getResults());
////		List<Incident> incidents = incidentDao.byState(state);
//		System.out.println("In controller"+incidents);
//		mav.addObject("incidents", incidents);
//		mav.addObject("zipcode", zipcode);
//		mav.addObject("represult", result.getResults());
//		return mav;
//		
//	}
	
	@RequestMapping("/repbyzip/{latitude}/{longitude}")
	public ModelAndView showreps(@PathVariable("latitude") Double lat, @PathVariable("longitude") Double lon) {
		ModelAndView mav = new ModelAndView("show-rep");
		RestTemplate restTemplate = new RestTemplate();	

		String url = "https://openstates.org/api/v1/legislators/geo/?lat="+lat+"&long="+lon+"&apikey=239038b3-30a9-4f08-a887-90bae55dd133";
//		opnstates.org apikey - 239038b3-30a9-4f08-a887-90bae55dd133

		ResponseEntity<Representative[]> response = restTemplate.exchange(url, HttpMethod.GET, null, Representative[].class);
		List<Representative> result = Arrays.asList(response.getBody());
//		List<Representative> listOfReps = result.getRepresentatives();
		System.out.println(result);
		mav.addObject("reps", result);
		return mav;
		
	}
	

}
