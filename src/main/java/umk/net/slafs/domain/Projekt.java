package umk.net.slafs.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.beans.factory.annotation.Required;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

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
    @Size(max = 255)
    private String client;

    @NotNull
    @Column(name = "kiedy_rozp")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(style = "M-",iso = ISO.DATE)
    private Date started;

    @Column(name = "opis")
    private String description;

    @Column(name = "termin")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(style = "M-",iso = ISO.DATE)
    private Date term;

    @ManyToOne(targetEntity = Faza.class)
    @JoinColumn
    private Faza defaultFaza;
}
