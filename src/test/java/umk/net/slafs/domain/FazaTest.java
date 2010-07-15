package umk.net.slafs.domain;

import org.junit.Test;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

public class FazaTest extends EwidenterionTest {

	protected Faza doAdd() {
		Faza p = new Faza();
		
		p.setName("Programowanie");
		
		return p;
	}
	
	@Test
	@Transactional
	public void addTest() {
		
		int before = Faza.findAllFazas().size();
		
		Faza f = doAdd();
		f.persist();
		
		int after = Faza.findAllFazas().size();
		
		assertTrue(before < after);
	}
	
	@Test
	@Transactional
	public void deleteTest() {
		Faza f = doAdd();
		f.persist();
		Long IDEK = f.getId();
		int before = Faza.findAllFazas().size();
		
		Faza forDelete = Faza.findFaza(IDEK);
		
		forDelete.remove();

		int after = Faza.findAllFazas().size();
		assertNull(Faza.findFaza(IDEK));
		assertTrue(after < before);
	}
	
	@Test
	@Transactional
	public void updateTest() {
		
		String newWord = "Testowanie";
		Faza f = doAdd();
		f.persist();
		Long IDEK = f.getId();
		
		Faza u = Faza.findFaza(IDEK);
		u.setName(newWord);
		
		u.merge();
		
		Faza afterUpdate = Faza.findFaza(IDEK);
		
		assertSame(u.getName(), afterUpdate.getName());
	}
}
