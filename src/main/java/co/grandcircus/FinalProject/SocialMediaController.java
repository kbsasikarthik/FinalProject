package co.grandcircus.FinalProject;

import java.util.Arrays;
import java.util.List;

import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import co.grandcircus.FinalProject.entity.Representative;

@Controller
public class SocialMediaController {

	@RequestMapping("/twitter{id}")
	public ModelAndView showreps(@PathVariable("incidentId") Integer incidentId) {
		ModelAndView mav = new ModelAndView("show-rep");
		RestTemplate restTemplate = new RestTemplate();

		String url = null;// TODO "https://openstates.org/api/v1/legislators/geo/?lat=" + lat + "&long=" + lon + "&apikey=" + apikey;
//        opnstates.org apikey - 239038b3-30a9-4f08-a887-90bae55dd133

		ResponseEntity<Representative[]> response = restTemplate.exchange(url, HttpMethod.GET, null,
				Representative[].class);
		List<Representative> result = Arrays.asList(response.getBody());
//        List<Representative> listOfReps = result.getRepresentatives();
		System.out.println(result);
		mav.addObject("reps", result);
		return mav;

	}

}
