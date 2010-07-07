package umk.net.slafs.domain;

import java.lang.Integer;
import java.util.Date;
import umk.net.slafs.domain.Pracownik;
import umk.net.slafs.domain.Projekt;

privileged aspect Godziny_Roo_JavaBean {
    
    public Pracownik Godziny.getPracownik() {
        return this.pracownik;
    }
    
    public void Godziny.setPracownik(Pracownik pracownik) {
        this.pracownik = pracownik;
    }
    
    public Integer Godziny.getHours() {
        return this.hours;
    }
    
    public void Godziny.setHours(Integer hours) {
        this.hours = hours;
    }
    
    public Integer Godziny.getMinutes() {
        return this.minutes;
    }
    
    public void Godziny.setMinutes(Integer minutes) {
        this.minutes = minutes;
    }
    
    public Date Godziny.getWhenWorked() {
        return this.whenWorked;
    }
    
    public void Godziny.setWhenWorked(Date whenWorked) {
        this.whenWorked = whenWorked;
    }
    
    public Projekt Godziny.getProjekt() {
        return this.projekt;
    }
    
    public void Godziny.setProjekt(Projekt projekt) {
        this.projekt = projekt;
    }
    
}
