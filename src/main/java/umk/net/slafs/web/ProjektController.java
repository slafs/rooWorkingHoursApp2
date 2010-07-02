package umk.net.slafs.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import umk.net.slafs.domain.Projekt;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "projekt", automaticallyMaintainView = true, formBackingObject = Projekt.class)
@RequestMapping("/projekt/**")
@Controller
public class ProjektController {
}
