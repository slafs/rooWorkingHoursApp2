package umk.net.slafs.domain;

import org.junit.Test;
import org.springframework.transaction.annotation.Transactional;

public class PracownikTest extends EwidenterionTest {

	protected Long doAdd() {
		Pracownik p = new Pracownik();
		
		p.setAuthority("ROLE_ADMIN");
		p.setEmail("slafs@op.pl");
		p.setEnabled(true);
		p.setFirstname("Sławek");
		p.setSurname("Ehlert");
		p.setUsername("slafs");
		
		p.persist();
		
		return p.getId();
	}
	
	@Test
	@Transactional
	public void addTest() {
		
		int before = Pracownik.findAllPracowniks().size();
		
		doAdd();
		
		int after = Pracownik.findAllPracowniks().size();
		
		assertTrue(before < after);
	}
	
	@Test
	@Transactional
	public void deleteTest() {
		Long IDEK = doAdd();
		int before = Pracownik.findAllPracowniks().size();
		
		Pracownik forDelete = Pracownik.findPracownik(IDEK);
		
		forDelete.remove();

		int after = Pracownik.findAllPracowniks().size();
		assertNull(Pracownik.findPracownik(IDEK));
		assertTrue(after < before);
	}
	
	@Test
	@Transactional
	public void updateTest() {
		
		String newWord = "Benek";
		Long IDEK = doAdd();
		
		Pracownik u = Pracownik.findPracownik(IDEK);
		u.setFirstname(newWord);
		
		u.merge();
		
		Pracownik afterUpdate = Pracownik.findPracownik(IDEK);
		
		assertSame(u.getFirstname(), afterUpdate.getFirstname());
	}
}
