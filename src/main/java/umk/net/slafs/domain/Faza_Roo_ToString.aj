package umk.net.slafs.domain;

import java.lang.String;

privileged aspect Faza_Roo_ToString {
    
    public String Faza.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("Name: ").append(getName());
        return sb.toString();
    }
    
}
