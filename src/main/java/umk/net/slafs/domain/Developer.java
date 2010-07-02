package umk.net.slafs.domain;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import umk.net.slafs.domain.Projekt;

@Entity
@RooJavaBean
@RooToString
@RooEntity
public class Developer {

    @ManyToOne(targetEntity = Pracownik.class)
    @JoinColumn
    private Pracownik pracownik;

    @ManyToOne(targetEntity = Projekt.class)
    @JoinColumn
    private Projekt projekt;
}
