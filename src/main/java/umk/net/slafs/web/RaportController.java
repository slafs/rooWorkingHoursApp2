package umk.net.slafs.web;

import java.util.Calendar;
import java.util.Date;

import javax.validation.Valid;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import umk.net.slafs.domain.Pracownik;
import umk.net.slafs.domain.utils.Raport;

@Controller
@RequestMapping("/raport/**")
public class RaportController {
	
	protected Pracownik getCurrentPracownik() {
		User u = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return Pracownik.findPracownikByUsername(u.getUsername());
	}
	
	protected void prepareMap(ModelMap map) {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DAY_OF_MONTH, 1);
		
		Date from = cal.getTime();
		int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		cal.set(Calendar.DAY_OF_MONTH, lastDay);
		Date to = cal.getTime();
		
		map.addAttribute("raport", new Raport(getCurrentPracownik(), from, to));	
	}
	
	@RequestMapping(value = "/raport", method = RequestMethod.GET)
	public String raport(ModelMap map) {
		prepareMap(map);
		return "raport/form";
	}
	
	
	@RequestMapping(value = "/raport/result", method = RequestMethod.POST)
	public String result(@Valid Raport raport, BindingResult result, ModelMap modelMap) {
		if (result.hasErrors()) {
			prepareMap(modelMap);
			return "raport/form";
		}
		
		if (raport.getPracownik() == null)
			raport.setPracownik(getCurrentPracownik());
		Raport r = raport.makeReport();
		
		modelMap.addAttribute("raport", r);
		return "raport/result";
	}
	
	@RequestMapping(value = "/raport/result", method = RequestMethod.GET)
	public String noResult( ModelMap modelMap) {
		int a = 1/0;
		return "redirect:/raport";
	}
}
