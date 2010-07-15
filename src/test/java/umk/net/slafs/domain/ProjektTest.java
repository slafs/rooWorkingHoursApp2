package umk.net.slafs.domain;

import java.util.Calendar;

import org.junit.Test;
import org.springframework.transaction.annotation.Transactional;

public class ProjektTest extends EwidenterionTest {

	protected Long doAdd() {
		Projekt p = new Projekt();
		
		Calendar cal = Calendar.getInstance();
		
		FazaTest ft = new FazaTest();
		Faza f = ft.doAdd();
		f.persist();
		Long FazaIDEK = f.getId();
		
		p.setName("Nowa aplikacja");
		p.setClient("Leroy Merlin");
		p.setDescription("Taki dość długaśny opis");
		p.setStarted(cal.getTime());
		p.setTerm(cal.getTime());
		p.setDefaultFaza(Faza.findFaza(FazaIDEK));
		
		p.persist();
		
		return p.getId();
	}
	
	@Test
	@Transactional
	public void addTest() {
		
		int before = Projekt.findAllProjekts().size();
		
		doAdd();
		
		int after = Projekt.findAllProjekts().size();
		
		assertTrue(before < after);
	}
	
	@Test
	@Transactional
	public void deleteTest() {
		Long IDEK = doAdd();
		int before = Projekt.findAllProjekts().size();
		
		Projekt forDelete = Projekt.findProjekt(IDEK);
		
		forDelete.remove();

		int after = Projekt.findAllProjekts().size();
		assertNull(Projekt.findProjekt(IDEK));
		assertTrue(after < before);
	}
	
	@Test
	@Transactional
	public void updateTest() {
		
		String newWord = "Inna aplikacja";
		Long IDEK = doAdd();
		
		Projekt u = Projekt.findProjekt(IDEK);
		u.setName(newWord);
		
		u.merge();
		
		Projekt afterUpdate = Projekt.findProjekt(IDEK);
		
		assertSame(u.getName(), afterUpdate.getName());
	}
}
