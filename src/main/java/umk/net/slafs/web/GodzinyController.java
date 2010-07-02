package umk.net.slafs.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import umk.net.slafs.domain.Godziny;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "godziny", automaticallyMaintainView = true, formBackingObject = Godziny.class)
@RequestMapping("/godziny/**")
@Controller
public class GodzinyController {
}
