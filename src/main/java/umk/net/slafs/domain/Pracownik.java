package umk.net.slafs.domain;

import javax.persistence.Entity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import javax.persistence.Column;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@RooJavaBean
@RooToString
@RooEntity
public class Pracownik {

    @Column(name = "imie")
    private String firstname;

    @Column(name = "nazwisko")
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
    private String authority;
}
