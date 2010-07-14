package umk.net.slafs.domain;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

privileged aspect Godziny_Roo_Finder {

	@SuppressWarnings("unchecked")
	public static List<Godziny> Godziny.findGodzinysByPracownik(Pracownik pracownik) {
		if (pracownik == null)
			throw new IllegalArgumentException(
					"The pracownik argument is required");
		EntityManager em = Godziny.entityManager();
		Query q = em
				.createQuery("SELECT Godziny FROM Godziny AS godziny WHERE godziny.pracownik = :pracownik");
		q.setParameter("pracownik", pracownik);
		return q.getResultList();
	}

	@SuppressWarnings("unchecked")
	public static List<Godziny> Godziny.findGodzinysByPracownikBetweenDates(
			Date whenWorkedBegin, Date whenWorkedEnd, Pracownik pracownik) {
		if (pracownik == null)
			throw new IllegalArgumentException(
					"The pracownik argument is required");
		if (whenWorkedBegin == null || whenWorkedEnd == null)
			throw new IllegalArgumentException(
					"Dates as range arguments are required");
		EntityManager em = Godziny.entityManager();
		Query q = em
				.createQuery("SELECT Godziny FROM Godziny AS godziny WHERE godziny.pracownik = :pracownik AND godziny.whenWorked BETWEEN :start AND :stop");
		q.setParameter("pracownik", pracownik);
		q.setParameter("start", whenWorkedBegin);
		q.setParameter("stop", whenWorkedEnd);
		return q.getResultList();
	}
	
	public static Long Godziny.sumHoursWorked(Date whenWorkedBegin, Date whenWorkedEnd, Pracownik pracownik) {
		if (pracownik == null)
			throw new IllegalArgumentException(
					"The pracownik argument is required");
		if (whenWorkedBegin == null || whenWorkedEnd == null)
			throw new IllegalArgumentException(
					"Dates as range arguments are required");
		EntityManager em = Godziny.entityManager();
		Query q = em
				.createQuery("SELECT sum(godziny.hours) FROM Godziny AS godziny WHERE godziny.pracownik = :pracownik AND godziny.whenWorked BETWEEN :start AND :stop");
		q.setParameter("pracownik", pracownik);
		q.setParameter("start", whenWorkedBegin);
		q.setParameter("stop", whenWorkedEnd);
		return (Long) q.getSingleResult();
		//return new Long(1);
		
	}
	public static Long Godziny.sumMinutesWorked(Date whenWorkedBegin, Date whenWorkedEnd, Pracownik pracownik) {
		if (pracownik == null)
			throw new IllegalArgumentException(
					"The pracownik argument is required");
		if (whenWorkedBegin == null || whenWorkedEnd == null)
			throw new IllegalArgumentException(
					"Dates as range arguments are required");
		EntityManager em = Godziny.entityManager();
		Query q = em
				.createQuery("SELECT sum(godziny.minutes) FROM Godziny AS godziny WHERE godziny.pracownik = :pracownik AND godziny.whenWorked BETWEEN :start AND :stop");
		q.setParameter("pracownik", pracownik);
		q.setParameter("start", whenWorkedBegin);
		q.setParameter("stop", whenWorkedEnd);
		return (Long) q.getSingleResult();
		//return new Long(2);
	}
}
