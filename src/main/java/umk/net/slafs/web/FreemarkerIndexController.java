package umk.net.slafs.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/test.html")
public class FreemarkerIndexController {
	
	
	
	@RequestMapping(method = RequestMethod.GET)
	public String ftest(Model model) {
		String hello = "Hello Freemarker";
		model.addAttribute("hello", hello);
		
		return "ftest";
	}
}
