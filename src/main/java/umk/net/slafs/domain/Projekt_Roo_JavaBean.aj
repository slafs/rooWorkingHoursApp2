package umk.net.slafs.domain;

import java.lang.String;
import java.util.Date;

privileged aspect Projekt_Roo_JavaBean {
    
    public String Projekt.getName() {
        return this.name;
    }
    
    public void Projekt.setName(String name) {
        this.name = name;
    }
    
    public String Projekt.getClient() {
        return this.client;
    }
    
    public void Projekt.setClient(String client) {
        this.client = client;
    }
    
    public Date Projekt.getStarted() {
        return this.started;
    }
    
    public void Projekt.setStarted(Date started) {
        this.started = started;
    }
    
    public String Projekt.getDescription() {
        return this.description;
    }
    
    public void Projekt.setDescription(String description) {
        this.description = description;
    }
    
    public Date Projekt.getTerm() {
        return this.term;
    }
    
    public void Projekt.setTerm(Date term) {
        this.term = term;
    }
    
}
