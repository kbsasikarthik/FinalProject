package co.grandcircus.FinalProject;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import co.grandcircus.FinalProject.entity.Representative;

@Controller
public class RepController {

	@Value("${repdata.apikey}")
	private String apikey;

	@RequestMapping("/repbyzip/{latitude}/{longitude}")
	public ModelAndView showreps(@PathVariable("latitude") Double lat, @PathVariable("longitude") Double lon) {
		ModelAndView mav = new ModelAndView("show-rep");
		RestTemplate restTemplate = new RestTemplate();

		String url = "https://openstates.org/api/v1/legislators/geo/?lat=" + lat + "&long=" + lon + "&apikey=" + apikey;
		ResponseEntity<Representative[]> response = restTemplate.exchange(url, HttpMethod.GET, null,
				Representative[].class);
		List<Representative> result = Arrays.asList(response.getBody());
		mav.addObject("reps", result);
		return mav;

	}

}