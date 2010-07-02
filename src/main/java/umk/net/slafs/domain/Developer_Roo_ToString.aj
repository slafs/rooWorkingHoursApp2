package umk.net.slafs.domain;

import java.lang.String;

privileged aspect Developer_Roo_ToString {
    
    public String Developer.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("Pracownik: ").append(getPracownik()).append(", ");
        sb.append("Projekt: ").append(getProjekt());
        return sb.toString();
    }
    
}
