package umk.net.slafs.domain;

import java.lang.String;

privileged aspect Pracownik_Roo_ToString {
    
    public String Pracownik.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Admin: ").append(isAdmin()).append(", ");
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("Firstname: ").append(getFirstname()).append(", ");
        sb.append("Surname: ").append(getSurname()).append(", ");
        sb.append("Email: ").append(getEmail()).append(", ");
        sb.append("Username: ").append(getUsername()).append(", ");
        sb.append("Password: ").append(getPassword()).append(", ");
        sb.append("Enabled: ").append(getEnabled()).append(", ");
        sb.append("Authority: ").append(getAuthority());
        return sb.toString();
    }
    
}
