package umk.net.slafs.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

@Entity
@RooJavaBean
@RooToString
@RooEntity
@UniqueConstraint(columnNames = { "username", "email" })
public class Pracownik {

    @Column(name = "imie")
    @Size(max = 50)
    private String firstname;

    @Column(name = "nazwisko")
    @Size(max = 50)
    private String surname;
    
    private String email;

    @NotNull
    @Size(max = 50)
    private String username;

    @NotNull
    @Size(max = 255)
    private String password;

    private Boolean enabled;

    @NotNull
    @Size(max = 50)
    private String authority;
    
    public boolean isAdmin() {
    	if (this.authority.equals("ADMIN")) {
    		return true;
    	}
    	return false;
    }
}
