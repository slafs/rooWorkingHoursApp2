package umk.net.slafs.domain;

import java.util.Calendar;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import umk.net.slafs.domain.Projekt;

@Entity
@RooJavaBean
@RooToString
@RooEntity(finders = { "findGodzinysByPracownik" })
public class Godziny {

	public final static int DAYS_BACK = 3;
	private final static Long DAY = new Long(1000 * 60 * 60 * 24);
	
    @ManyToOne(targetEntity = Pracownik.class)
    @JoinColumn
    private Pracownik pracownik;

    @NotNull
    @Column(name = "godzin")
    @Min(0)
    private Integer hours;

    @NotNull
    @Column(name = "minut")
    @Min(0)
    @Max(59)
    private Integer minutes;

    @Column(name = "kiedy")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-", iso = ISO.DATE)
    @NotNull
    private Date whenWorked;

    @NotNull
    @ManyToOne(targetEntity = Projekt.class)
    @JoinColumn
    private Projekt projekt;

    public boolean isEditable() {
		Calendar c = Calendar.getInstance();

		Date d1 = this.getWhenWorked();
		Date d2 = c.getTime();
		
		Long r = d2.getTime() - d1.getTime();
		
		return  !((r / (double) DAY) > DAYS_BACK);
    }
    
    public boolean isFuture() {
		Calendar c = Calendar.getInstance();

		Date d1 = this.getWhenWorked();
		Date d2 = c.getTime();
		
		Long r = d2.getTime() - d1.getTime();
		
		return  (r / (double) DAY) < 0;
    	
    }
}
