package co.grandcircus.FinalProject;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import co.grandcircus.FinalProject.dao.IncidentDetailsDao;
import co.grandcircus.FinalProject.entity.Incident;

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
		List<String> ages = incident.getAges();
		List<String> gender = incident.getGender();
		List<String> status = incident.getStatus();
		List<String> details = new ArrayList<>();
//		String[][][] test = new String[gender.size()][ages.size()][status.size()];
//		test[0] = (String[]) gender.toArray();
//		test[1] = (String[]) ages.toArray();
//		test[2] = (String[]) status.toArray();
//		
//	        for (int i=0; i<test.length; i++) 
//	            for(int j=0; j<test[i].length; j++) 
//		            for(int k=0; j<test[i].length; k++) 
//		            	details.add(gender.get(i)+" , "+ages.get(j)+" - "+status.get(k));
// 
	 

		
		int maxLength = 0;

		
//        if ((ages.size() > gender.size()) && (ages.size() > status.size())) {
//            maxLength = ages.size();
//        } else if ((gender.size() > ages.size()) && (gender.size() > status.size())) {
//            maxLength = gender.size();
//        } else  {
//            maxLength = status.size();
//        }
//        System.out.println(maxLength);
//        for (int i = 0; i < status.size(); i++) {
//        	
//        	if(i <gender.size()) {
//        		details.add(gender.get(i) + " , " + ages.get(i) + " - " + status.get(i));
//        	} else if (i< ages.size()) {
//        		
//        	} else if (i<status.size()) {
//        		
//        	}else {
//        		details.add(gender.get(i) + " , " + ages.get(i) + " - " + status.get(i));
//        	}



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
		

		for (int i = 0; i < maxLength; i++) {
			try{
				genderValue = gender.get(i)+" , ";
				
			}catch(Exception ex) {
				genderValue = "";
			}
			try{
				agesValue = ages.get(i)+" - ";
			}catch(Exception ex) {
				agesValue = "";
			}
			try{
				statusValue =status.get(i);
			}catch(Exception ex) {
				statusValue = "";
			}
    		details.add(genderValue +agesValue  + statusValue);

		}

		mav.addObject("details", details);
		System.out.println(incidentDetailsDao.byID(incidentId));
		return mav;

	}

}
