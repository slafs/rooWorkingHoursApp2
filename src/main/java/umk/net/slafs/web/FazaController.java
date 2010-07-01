package umk.net.slafs.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import umk.net.slafs.domain.Faza;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "faza", automaticallyMaintainView = true, formBackingObject = Faza.class)
@RequestMapping("/faza/**")
@Controller
public class FazaController {
}
