package umk.net.slafs.domain;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

@Entity
@RooJavaBean
@RooToString
@RooEntity
public class Developer {

    @ManyToOne(targetEntity = Pracownik.class)
    @JoinColumn
    @NotNull
    private Pracownik pracownik;

    @ManyToOne(targetEntity = Projekt.class)
    @JoinColumn
    @NotNull
    private Projekt projekt;
}
