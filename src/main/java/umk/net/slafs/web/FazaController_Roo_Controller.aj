package umk.net.slafs.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import umk.net.slafs.domain.Faza;

privileged aspect FazaController_Roo_Controller {
    
    @RequestMapping(value = "/faza", method = RequestMethod.POST)
    public String FazaController.create(@Valid Faza faza, BindingResult result, ModelMap modelMap) {
        if (faza == null) throw new IllegalArgumentException("A faza is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("faza", faza);
            return "faza/create";
        }
        faza.persist();
        return "redirect:/faza/" + faza.getId();
    }
    
    @RequestMapping(value = "/faza/form", method = RequestMethod.GET)
    public String FazaController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("faza", new Faza());
        return "faza/create";
    }
    
    @RequestMapping(value = "/faza/{id}", method = RequestMethod.GET)
    public String FazaController.show(@PathVariable("id") Long id, ModelMap modelMap) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("faza", Faza.findFaza(id));
        return "faza/show";
    }
    
    @RequestMapping(value = "/faza", method = RequestMethod.GET)
    public String FazaController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("fazas", Faza.findFazaEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Faza.countFazas() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("fazas", Faza.findAllFazas());
        }
        return "faza/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String FazaController.update(@Valid Faza faza, BindingResult result, ModelMap modelMap) {
        if (faza == null) throw new IllegalArgumentException("A faza is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("faza", faza);
            return "faza/update";
        }
        faza.merge();
        return "redirect:/faza/" + faza.getId();
    }
    
    @RequestMapping(value = "/faza/{id}/form", method = RequestMethod.GET)
    public String FazaController.updateForm(@PathVariable("id") Long id, ModelMap modelMap) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("faza", Faza.findFaza(id));
        return "faza/update";
    }
    
    @RequestMapping(value = "/faza/{id}", method = RequestMethod.DELETE)
    public String FazaController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        Faza.findFaza(id).remove();
        return "redirect:/faza?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
