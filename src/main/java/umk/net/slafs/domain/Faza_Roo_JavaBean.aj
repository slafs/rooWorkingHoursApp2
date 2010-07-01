package umk.net.slafs.domain;

import java.lang.String;

privileged aspect Faza_Roo_JavaBean {
    
    public String Faza.getName() {
        return this.name;
    }
    
    public void Faza.setName(String name) {
        this.name = name;
    }
    
}
