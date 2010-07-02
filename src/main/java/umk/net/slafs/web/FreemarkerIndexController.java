package umk.net.slafs.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import umk.net.slafs.domain.Faza;

@Controller
@RequestMapping("/test.html")
public class FreemarkerIndexController {
	
	@RequestMapping(method = RequestMethod.GET)
	public String ftest(Model model) {
		String hello = "Hello Freemarker";
		model.addAttribute("hello", hello);

		model.addAttribute("faza", new Faza());
		
		return "ftest";
	}
	@RequestMapping(method = RequestMethod.POST)
	public String submit(@ModelAttribute("faza") Faza faza, Model model) {
		System.out.println(faza.getName() + " -=-=-=-=-=-=-=\n\n\n\n ");
		String hello = "Hello Freemarker";
		model.addAttribute("hello", hello);
		
		model.addAttribute("faza", new Faza());
		
		return "ftest";
	}

}
