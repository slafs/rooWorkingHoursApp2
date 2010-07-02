package umk.net.slafs.domain;

import java.lang.Boolean;
import java.lang.String;

privileged aspect Pracownik_Roo_JavaBean {
    
    public String Pracownik.getFirstname() {
        return this.firstname;
    }
    
    public void Pracownik.setFirstname(String firstname) {
        this.firstname = firstname;
    }
    
    public String Pracownik.getSurname() {
        return this.surname;
    }
    
    public void Pracownik.setSurname(String surname) {
        this.surname = surname;
    }
    
    public String Pracownik.getEmail() {
        return this.email;
    }
    
    public void Pracownik.setEmail(String email) {
        this.email = email;
    }
    
    public String Pracownik.getUsername() {
        return this.username;
    }
    
    public void Pracownik.setUsername(String username) {
        this.username = username;
    }
    
    public String Pracownik.getPassword() {
        return this.password;
    }
    
    public void Pracownik.setPassword(String password) {
        this.password = password;
    }
    
    public Boolean Pracownik.getEnabled() {
        return this.enabled;
    }
    
    public void Pracownik.setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }
    
    public String Pracownik.getAuthority() {
        return this.authority;
    }
    
    public void Pracownik.setAuthority(String authority) {
        this.authority = authority;
    }
    
}
