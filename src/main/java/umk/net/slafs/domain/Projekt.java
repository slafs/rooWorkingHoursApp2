package umk.net.slafs.domain;

import javax.persistence.Entity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import javax.validation.constraints.NotNull;
import javax.persistence.Column;
import javax.validation.constraints.Size;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@RooJavaBean
@RooToString
@RooEntity
public class Projekt {

    @NotNull
    @Column(name = "nazwa")
    @Size(max = 255)
    private String name;

    @Column(name = "klient")
    private String client;

    @NotNull
    @Column(name = "kiedy_rozp")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(style = "S-")
    private Date started;

    @Column(name = "opis")
    private String description;

    @Column(name = "termin")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    private Date term;
}
