package umk.net.slafs.domain;

import javax.persistence.Entity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import umk.net.slafs.domain.Pracownik;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;
import javax.persistence.Column;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@RooJavaBean
@RooToString
@RooEntity
public class Godziny {

    @ManyToOne(targetEntity = Pracownik.class)
    @JoinColumn
    private Pracownik pracownik;

    @Column(name = "godzin")
    private Integer hours;

    @Column(name = "minut")
    private Integer minutes;

    @Column(name = "kiedy")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    private Date whenWorked;
}
