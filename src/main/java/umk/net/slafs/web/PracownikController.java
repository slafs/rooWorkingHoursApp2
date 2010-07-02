package umk.net.slafs.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import umk.net.slafs.domain.Pracownik;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "pracownik", automaticallyMaintainView = true, formBackingObject = Pracownik.class)
@RequestMapping("/pracownik/**")
@Controller
public class PracownikController {
}
