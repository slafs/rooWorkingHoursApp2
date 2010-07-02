package umk.net.slafs.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import umk.net.slafs.domain.Developer;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "developer", automaticallyMaintainView = true, formBackingObject = Developer.class)
@RequestMapping("/developer/**")
@Controller
public class DeveloperController {
}
