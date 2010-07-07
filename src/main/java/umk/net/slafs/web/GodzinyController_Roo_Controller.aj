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
import umk.net.slafs.domain.Godziny;
import umk.net.slafs.domain.Pracownik;
import umk.net.slafs.domain.Projekt;

privileged aspect GodzinyController_Roo_Controller {
    
	public Pracownik GodzinyController.getCurrentPracownik() {
		return Pracownik.findPracownik(new Long(14));
	}
	
    @RequestMapping(value = "/godziny", method = RequestMethod.POST)
    public String GodzinyController.create(@Valid Godziny godziny, BindingResult result, ModelMap modelMap) {
        if (godziny == null) throw new IllegalArgumentException("A godziny is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("godziny", godziny);
            modelMap.addAttribute("pracowniks", Pracownik.findAllPracowniks());
            modelMap.addAttribute("projekts", Projekt.findAllProjekts());
            modelMap.addAttribute("godziny_whenWorked_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("M-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));
            return "godziny/create";
        }
        Pracownik currentPrac = getCurrentPracownik();
        godziny.setPracownik(currentPrac);
        godziny.persist();
        return "redirect:/godziny/" + godziny.getId();
    }
    
    @RequestMapping(value = "/godziny/form", method = RequestMethod.GET)
    public String GodzinyController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("godziny", new Godziny());
        modelMap.addAttribute("pracowniks", Pracownik.findAllPracowniks());
        modelMap.addAttribute("projekts", Projekt.findAllProjekts());
        modelMap.addAttribute("godziny_whenWorked_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("M-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));
        return "godziny/create";
    }
    
    @RequestMapping(value = "/godziny/{id}", method = RequestMethod.GET)
    public String GodzinyController.show(@PathVariable("id") Long id, ModelMap modelMap) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("godziny_whenWorked_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("M-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));
        modelMap.addAttribute("godziny", Godziny.findGodziny(id));
        return "godziny/show";
    }
    
    @RequestMapping(value = "/godziny", method = RequestMethod.GET)
    public String GodzinyController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("godzinys", Godziny.findGodzinyEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Godziny.countGodzinys() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("godzinys", Godziny.findAllGodzinys());
        }
        modelMap.addAttribute("godziny_whenWorked_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("M-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));
        return "godziny/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String GodzinyController.update(@Valid Godziny godziny, BindingResult result, ModelMap modelMap) {
        if (godziny == null) throw new IllegalArgumentException("A godziny is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("godziny", godziny);
            modelMap.addAttribute("pracowniks", Pracownik.findAllPracowniks());
            modelMap.addAttribute("projekts", Projekt.findAllProjekts());
            modelMap.addAttribute("godziny_whenWorked_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("M-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));
            return "godziny/update";
        }
        Pracownik currentPrac = getCurrentPracownik();
        godziny.setPracownik(currentPrac);

        godziny.merge();
        return "redirect:/godziny/" + godziny.getId();
    }
    
    @RequestMapping(value = "/godziny/{id}/form", method = RequestMethod.GET)
    public String GodzinyController.updateForm(@PathVariable("id") Long id, ModelMap modelMap) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("godziny", Godziny.findGodziny(id));
        modelMap.addAttribute("pracowniks", Pracownik.findAllPracowniks());
        modelMap.addAttribute("projekts", Projekt.findAllProjekts());
        modelMap.addAttribute("godziny_whenWorked_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("M-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));
        return "godziny/update";
    }
    
    @RequestMapping(value = "/godziny/{id}", method = RequestMethod.DELETE)
    public String GodzinyController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        Godziny.findGodziny(id).remove();
        return "redirect:/godziny?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
