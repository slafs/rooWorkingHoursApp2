package umk.net.slafs.domain;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.springframework.transaction.annotation.Transactional;

import umk.net.slafs.domain.utils.Raport;

public class RaportTest extends EwidenterionTest {

	private int h1;
	private int h2;
	private int m1;
	private int m2;
	
	
	protected Long doAdd() {
		
		
		GodzinyTest gt = new GodzinyTest();
		Long IDEK1 =  gt.doAdd();
		
		Godziny old = Godziny.findGodziny(IDEK1);
		
		h1 = old.getHours().intValue();
		m1 = old.getMinutes().intValue();
		h2 = 3;
		m2 = 4;
		
		Godziny g = new Godziny();
		g.setHours(h2);
		g.setMinutes(m2);
		g.setPracownik(old.getPracownik());
		g.setProjekt(old.getProjekt());
		g.setWhenWorked(old.getWhenWorked());
		
		g.persist();
		
		return IDEK1;
	}
	
	@Test
	@Transactional
	public void raportTest() {
		
		List<Godziny> forDeletions = Godziny.findAllGodzinys();
		for (Godziny godziny : forDeletions) {
			godziny.remove();
		}
		Calendar cal = Calendar.getInstance();
		Long IDEK = doAdd();
	
		Godziny g = Godziny.findGodziny(IDEK);
		
		cal.setTime(g.getWhenWorked());
		
		
		Date dFrom = new Date(cal.getTimeInMillis() - new Long(125345678));
		Date dTo = new Date(cal.getTimeInMillis() + new Long(125345678));
		
		Raport r = new Raport(g.getPracownik(), dFrom, dTo);
		
		Raport r2 = r.makeReport();
		
		int expH = h1 + h2;
		int expM = m1 + m2;
		
		assertEquals(r2.getHoursWorked().intValue(), expH);
		assertEquals(r2.getMinutesWorked().intValue(), expM);
	}
}
