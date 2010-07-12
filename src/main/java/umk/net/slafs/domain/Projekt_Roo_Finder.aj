package umk.net.slafs.domain;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

privileged aspect Projekt_Roo_Finder {

	@SuppressWarnings("unchecked")
	public static List<Projekt> Projekt.findProjektsByDeveloper(Pracownik pracownik) {
		if (pracownik == null)
			throw new IllegalArgumentException(
					"The pracownik argument is required");
		EntityManager em = Godziny.entityManager();
		String query = "SELECT Projekt FROM Projekt AS projekt " +
				"WHERE projekt IN (SELECT dev.projekt FROM Developer as dev " +
				"WHERE pracownik = :pracownik)";
		Query q = em
				.createQuery(query);
		q.setParameter("pracownik", pracownik);
		return q.getResultList();
	}
}
