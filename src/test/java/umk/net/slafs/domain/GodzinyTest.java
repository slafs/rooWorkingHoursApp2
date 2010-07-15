package umk.net.slafs.domain;

import java.util.Calendar;
import java.util.Date;

import org.junit.Test;
import org.springframework.transaction.annotation.Transactional;

public class GodzinyTest extends EwidenterionTest {

	protected Long doAdd() {
		Godziny p = new Godziny();
		
		Calendar cal = Calendar.getInstance();
		
		ProjektTest projT = new ProjektTest();
		Long ProjektIDEK = projT.doAdd();
		
		PracownikTest pracT = new PracownikTest();
		Long PracownikIDEK = pracT.doAdd();
		
		p.setPracownik(Pracownik.findPracownik(PracownikIDEK));
		p.setProjekt(Projekt.findProjekt(ProjektIDEK));
		
		p.setWhenWorked(cal.getTime());
		
		p.setHours(2);
		p.setMinutes(2);
		
		p.persist();
		
		return p.getId();
	}
	
	@Test
	@Transactional
	public void addTest() {
		
		int before = Godziny.findAllGodzinys().size();
		
		doAdd();
		
		int after = Godziny.findAllGodzinys().size();
		
		assertTrue(before < after);
	}
	
	@Test
	@Transactional
	public void deleteTest() {
		Long IDEK = doAdd();
		int before = Godziny.findAllGodzinys().size();
		
		Godziny forDelete = Godziny.findGodziny(IDEK);
		
		forDelete.remove();

		int after = Godziny.findAllGodzinys().size();
		assertNull(Godziny.findGodziny(IDEK));
		assertTrue(after < before);
	}
	
	@Test
	@Transactional
	public void updateTest() {
		
		int newHour = 4;
		Long IDEK = doAdd();
		
		Godziny u = Godziny.findGodziny(IDEK);
		u.setHours(newHour);
		
		u.merge();
		
		Godziny afterUpdate = Godziny.findGodziny(IDEK);
		
		assertSame(u.getHours(), afterUpdate.getHours());
	}
	
	@Test
	@Transactional
	public void wrongTest() {
		Long IDEK = doAdd();
		Godziny g = Godziny.findGodziny(IDEK);
		
		Calendar cal = Calendar.getInstance();
		Date wrongDate = new Date(cal.getTimeInMillis() + new Long(12345678));
		
		g.setWhenWorked(wrongDate);	
		g.merge();
		assertTrue(g.isFuture());

		Date anotherWrongDate = new Date(cal.getTimeInMillis() - new Long(1999999999));
		
		g.setWhenWorked(anotherWrongDate);
		g.merge();		
		assertFalse(g.isEditable());
		
	}
}
