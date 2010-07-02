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
import umk.net.slafs.domain.Pracownik;

privileged aspect PracownikController_Roo_Controller {
    
    @RequestMapping(value = "/pracownik", method = RequestMethod.POST)
    public String PracownikController.create(@Valid Pracownik pracownik, BindingResult result, ModelMap modelMap) {
        if (pracownik == null) throw new IllegalArgumentException("A pracownik is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("pracownik", pracownik);
            return "pracownik/create";
        }
        pracownik.persist();
        return "redirect:/pracownik/" + pracownik.getId();
    }
    
    @RequestMapping(value = "/pracownik/form", method = RequestMethod.GET)
    public String PracownikController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("pracownik", new Pracownik());
        return "pracownik/create";
    }
    
    @RequestMapping(value = "/pracownik/{id}", method = RequestMethod.GET)
    public String PracownikController.show(@PathVariable("id") Long id, ModelMap modelMap) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("pracownik", Pracownik.findPracownik(id));
        return "pracownik/show";
    }
    
    @RequestMapping(value = "/pracownik", method = RequestMethod.GET)
    public String PracownikController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("pracowniks", Pracownik.findPracownikEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Pracownik.countPracowniks() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("pracowniks", Pracownik.findAllPracowniks());
        }
        return "pracownik/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String PracownikController.update(@Valid Pracownik pracownik, BindingResult result, ModelMap modelMap) {
        if (pracownik == null) throw new IllegalArgumentException("A pracownik is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("pracownik", pracownik);
            return "pracownik/update";
        }
        pracownik.merge();
        return "redirect:/pracownik/" + pracownik.getId();
    }
    
    @RequestMapping(value = "/pracownik/{id}/form", method = RequestMethod.GET)
    public String PracownikController.updateForm(@PathVariable("id") Long id, ModelMap modelMap) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("pracownik", Pracownik.findPracownik(id));
        return "pracownik/update";
    }
    
    @RequestMapping(value = "/pracownik/{id}", method = RequestMethod.DELETE)
    public String PracownikController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        Pracownik.findPracownik(id).remove();
        return "redirect:/pracownik?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
