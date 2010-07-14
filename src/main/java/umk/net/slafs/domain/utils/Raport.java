package umk.net.slafs.domain.utils;

import java.util.Date;

import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import umk.net.slafs.domain.Godziny;
import umk.net.slafs.domain.Pracownik;

public class Raport {
	
    @DateTimeFormat(style = "S-", iso = ISO.DATE)
	private Date dateFrom;
    
    @DateTimeFormat(style = "S-", iso = ISO.DATE)
	private Date dateTo;

	private Pracownik pracownik;
	
	private Long hoursWorked;
	private Long minutesWorked;
	
	public Raport() {}
	
	public Raport(Pracownik prac, Date dateFrom, Date dateTo) {
		this.pracownik = prac;
		this.dateFrom = dateFrom;
		this.dateTo = dateTo;
		this.hoursWorked = new Long(0);
		this.minutesWorked = new Long(0);
	}
	
	public Raport makeReport() {
		
		Raport r = new Raport(this.pracownik, this.dateFrom, this.dateTo);
		
		Long h = Godziny.sumHoursWorked(dateFrom, dateTo, pracownik);
		Long tempM = Godziny.sumMinutesWorked(dateFrom, dateTo, pracownik);
		
		Long m = tempM % 60;
		h += tempM / 60;
		
		r.setHoursWorked(h);
		r.setMinutesWorked(m);
		
		return r;
	}
}
