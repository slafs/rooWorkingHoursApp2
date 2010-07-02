package umk.net.slafs.domain;

import java.lang.String;

privileged aspect Godziny_Roo_ToString {
    
    public String Godziny.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("Pracownik: ").append(getPracownik()).append(", ");
        sb.append("Hours: ").append(getHours()).append(", ");
        sb.append("Minutes: ").append(getMinutes()).append(", ");
        sb.append("WhenWorked: ").append(getWhenWorked());
        return sb.toString();
    }
    
}
