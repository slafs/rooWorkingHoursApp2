package umk.net.slafs.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/freemarker.html")
public class FreemarkerIndexController {
	
	@RequestMapping(method = RequestMethod.GET)
	public void freemarker() {
		
	}
}
