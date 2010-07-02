package umk.net.slafs.domain;

import java.lang.String;

privileged aspect Projekt_Roo_ToString {
    
    public String Projekt.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("Name: ").append(getName()).append(", ");
        sb.append("Client: ").append(getClient()).append(", ");
        sb.append("Started: ").append(getStarted()).append(", ");
        sb.append("Description: ").append(getDescription()).append(", ");
        sb.append("Term: ").append(getTerm()).append(", ");
        sb.append("DefaultFaza: ").append(getDefaultFaza());
        return sb.toString();
    }
    
}
