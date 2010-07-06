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
import umk.net.slafs.domain.Projekt;

privileged aspect ProjektController_Roo_Controller {
    
    @RequestMapping(value = "/projekt", method = RequestMethod.POST)
    public String ProjektController.create(@Valid Projekt projekt, BindingResult result, ModelMap modelMap) {
        if (projekt == null) throw new IllegalArgumentException("A projekt is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("projekt", projekt);
            modelMap.addAttribute("fazas", Faza.findAllFazas());
            modelMap.addAttribute("projekt_term_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("M-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));
            modelMap.addAttribute("projekt_started_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("M-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));
            return "projekt/create";
        }
        projekt.persist();
        return "redirect:/projekt/" + projekt.getId();
    }
    
    @RequestMapping(value = "/projekt/form", method = RequestMethod.GET)
    public String ProjektController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("projekt", new Projekt());
        modelMap.addAttribute("fazas", Faza.findAllFazas());
        modelMap.addAttribute("projekt_term_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("M-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));
        modelMap.addAttribute("projekt_started_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("M-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));
        return "projekt/create";
    }
    
    @RequestMapping(value = "/projekt/{id}", method = RequestMethod.GET)
    public String ProjektController.show(@PathVariable("id") Long id, ModelMap modelMap) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("projekt_term_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("M-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));
        modelMap.addAttribute("projekt_started_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("M-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));
        modelMap.addAttribute("projekt", Projekt.findProjekt(id));
        return "projekt/show";
    }
    
    @RequestMapping(value = "/projekt", method = RequestMethod.GET)
    public String ProjektController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("projekts", Projekt.findProjektEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Projekt.countProjekts() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("projekts", Projekt.findAllProjekts());
        }
        modelMap.addAttribute("projekt_term_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("M-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));
        modelMap.addAttribute("projekt_started_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("M-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));
        return "projekt/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String ProjektController.update(@Valid Projekt projekt, BindingResult result, ModelMap modelMap) {
        if (projekt == null) throw new IllegalArgumentException("A projekt is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("projekt", projekt);
            modelMap.addAttribute("fazas", Faza.findAllFazas());
            modelMap.addAttribute("projekt_term_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("M-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));
            modelMap.addAttribute("projekt_started_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("M-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));
            return "projekt/update";
        }
        projekt.merge();
        return "redirect:/projekt/" + projekt.getId();
    }
    
    @RequestMapping(value = "/projekt/{id}/form", method = RequestMethod.GET)
    public String ProjektController.updateForm(@PathVariable("id") Long id, ModelMap modelMap) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("projekt", Projekt.findProjekt(id));
        modelMap.addAttribute("fazas", Faza.findAllFazas());
        modelMap.addAttribute("projekt_term_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("M-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));
        modelMap.addAttribute("projekt_started_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("M-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));
        return "projekt/update";
    }
    
    @RequestMapping(value = "/projekt/{id}", method = RequestMethod.DELETE)
    public String ProjektController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        Projekt.findProjekt(id).remove();
        return "redirect:/projekt?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
