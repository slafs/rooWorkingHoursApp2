package umk.net.slafs.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

@Entity
@RooJavaBean
@RooToString
@RooEntity
public class Godziny {

    @ManyToOne(targetEntity = Pracownik.class)
    @JoinColumn
    @NotNull
    private Pracownik pracownik;

    @NotNull
    @Column(name = "godzin")
    @Min(0)
    private Integer hours;

    @NotNull
    @Column(name = "minut")
    @Min(0)
    private Integer minutes;

    @Column(name = "kiedy")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    @NotNull
    private Date whenWorked;
}
