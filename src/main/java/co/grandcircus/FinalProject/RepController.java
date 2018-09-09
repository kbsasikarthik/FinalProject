package co.grandcircus.FinalProject;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import co.grandcircus.FinalProject.dao.IncidentDao;
import co.grandcircus.FinalProject.entity.Incident;
import co.grandcircus.FinalProject.entity.RepResult;

@Controller
public class RepController {
	
	@Autowired
	IncidentDao incidentDao;
	
	@RequestMapping("/")
	public ModelAndView showhome() {
		ModelAndView mav = new ModelAndView("home");
		mav.addObject("states", incidentDao.getStates());
		return mav;
	}

	
	@RequestMapping("/repbyzip")
	public ModelAndView showreps(@RequestParam("zipcode") Integer zipcode, @RequestParam("state") String state) {
		
		System.out.println(zipcode+","+state);
		ModelAndView mav = new ModelAndView("show-rep");
//		String states = "Michigan";
		RestTemplate restTemplate = new RestTemplate();
				
		List<HttpMessageConverter<?>> messageConverters = new ArrayList<HttpMessageConverter<?>>();
		MappingJackson2HttpMessageConverter msgconverter = new MappingJackson2HttpMessageConverter();
		List<MediaType> mediaTypes = new ArrayList<MediaType>();
		mediaTypes.add(MediaType.TEXT_HTML);
		msgconverter.setSupportedMediaTypes(mediaTypes);
		messageConverters.add(msgconverter);
		restTemplate.setMessageConverters(messageConverters);
		

		String url = "https://whoismyrepresentative.com/getall_mems.php?zip="+zipcode+"&output=json";

//		Integer zip = zipcode;
		ResponseEntity<RepResult> response = restTemplate.exchange(url, HttpMethod.GET, null, RepResult.class);
		System.out.println(response);
		RepResult result = response.getBody();
		System.out.println(result.getResults());
		List<Incident> incidents = incidentDao.byState(state);
		System.out.println("In controller"+incidents);
		mav.addObject("incidents", incidents);
		mav.addObject("zipcode", zipcode);
		mav.addObject("represult", result.getResults());
		return mav;
		
	}
	

}
