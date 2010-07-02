package umk.net.slafs.domain;

import umk.net.slafs.domain.Pracownik;
import umk.net.slafs.domain.Projekt;

privileged aspect Developer_Roo_JavaBean {
    
    public Pracownik Developer.getPracownik() {
        return this.pracownik;
    }
    
    public void Developer.setPracownik(Pracownik pracownik) {
        this.pracownik = pracownik;
    }
    
    public Projekt Developer.getProjekt() {
        return this.projekt;
    }
    
    public void Developer.setProjekt(Projekt projekt) {
        this.projekt = projekt;
    }
    
}
