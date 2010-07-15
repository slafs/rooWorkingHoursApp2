package umk.net.slafs.domain;

import org.junit.Test;
import org.springframework.transaction.annotation.Transactional;

public class DeveloperTest extends EwidenterionTest {

	protected Long doAdd() {
		Developer p = new Developer();
		
		
		ProjektTest projT = new ProjektTest();
		Long ProjektIDEK = projT.doAdd();
		
		PracownikTest pracT = new PracownikTest();
		Long PracownikIDEK = pracT.doAdd();
		
		p.setPracownik(Pracownik.findPracownik(PracownikIDEK));
		p.setProjekt(Projekt.findProjekt(ProjektIDEK));
		
		p.persist();
		
		return p.getId();
	}
	
	@Test
	@Transactional
	public void addTest() {
		
		int before = Developer.findAllDevelopers().size();
		
		doAdd();
		
		int after = Developer.findAllDevelopers().size();
		
		assertTrue(before < after);
	}
	
	@Test
	@Transactional
	public void deleteTest() {
		Long IDEK = doAdd();
		int before = Developer.findAllDevelopers().size();
		
		Developer forDelete = Developer.findDeveloper(IDEK);
		
		forDelete.remove();

		int after = Developer.findAllDevelopers().size();
		assertNull(Developer.findDeveloper(IDEK));
		assertTrue(after < before);
	}
	
	@Test
	@Transactional
	public void updateTest() {
		
		Long IDEK = doAdd();
		
		Developer u = Developer.findDeveloper(IDEK);
		
		Long newPracIdek = (new PracownikTest()).doAdd();
		
		u.setPracownik(Pracownik.findPracownik(newPracIdek));
		
		u.merge();
		
		Developer afterUpdate = Developer.findDeveloper(IDEK);
		
		assertSame(u.getPracownik().getId(), afterUpdate.getPracownik().getId());
	}
}
