package co.grandcircus.FinalProject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

public class DatabaseController {

	@RequestMapping("/listresults")
	public ModelAndView showResults() {
		return new ModelAndView("listresults");
	}
	
	@RequestMapping("/listresultsbyname")
	public ModelAndView showResultsByName() {
		return new ModelAndView("listresultsbyname");
	}
}
