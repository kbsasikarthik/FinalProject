package co.grandcircus.FinalProject;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import co.grandcircus.FinalProject.dao.IncidentDetailsDao;
import co.grandcircus.FinalProject.entity.Incident;
import co.grandcircus.FinalProject.entity.Representative;

@Controller
public class IncidentController {

	@Autowired
	private IncidentDetailsDao incidentDetailsDao;

	@RequestMapping("/incident/{id}")
	public ModelAndView showIncidentByID(@PathVariable("id") Integer incidentId) {

		ModelAndView mav = new ModelAndView("incident");

		System.out.println("in Controller" + incidentId);
		Incident incident = incidentDetailsDao.byID(incidentId);
		mav.addObject("incident", incident);
		Double lat = incident.getLatitude();
		Double lon = incident.getLongitude();
		
		
		RestTemplate restTemplate = new RestTemplate();	

		String url = "https://openstates.org/api/v1/legislators/geo/?lat="+lat+"&long="+lon+"&apikey=239038b3-30a9-4f08-a887-90bae55dd133";
//		opnstates.org apikey - 239038b3-30a9-4f08-a887-90bae55dd133

		ResponseEntity<Representative[]> response = restTemplate.exchange(url, HttpMethod.GET, null, Representative[].class);
		List<Representative> result = Arrays.asList(response.getBody());
//		List<Representative> listOfReps = result.getRepresentatives();
		System.out.println(result);
		mav.addObject("reps", result);
		List<String> ages = incident.getAges();
		List<String> gender = incident.getGender();
		List<String> status = incident.getStatus();
		List<String> details = new ArrayList<>();

		int maxLength = 0;

		if ((ages.size() > gender.size()) && (ages.size() > status.size())) {
			maxLength = ages.size();
		} else if ((gender.size() > ages.size()) && (gender.size() > status.size())) {
			maxLength = gender.size();
		} else {
			maxLength = status.size();
		}

		String genderValue = "";
		String agesValue = "";
		String statusValue = "";

		System.out.println(maxLength);
		for (int i = 0; i < maxLength; i++) {

			try {
				genderValue = gender.get(i) + " , ";

			} catch (Exception ex) {
				genderValue = "";
			}
			try {
				agesValue = ages.get(i) + " - ";
			} catch (Exception ex) {
				agesValue = "";
			}
			try {
				statusValue = status.get(i);
			} catch (Exception ex) {
				statusValue = "";
			}
			details.add(genderValue + agesValue + statusValue);

		}

		mav.addObject("details", details);
		System.out.println(incidentDetailsDao.byID(incidentId));
		mav.addObject("back", "/listresults?state="+incident.getState()+"&city="+incident.getCity_or_county());

		return mav;

	}

}
