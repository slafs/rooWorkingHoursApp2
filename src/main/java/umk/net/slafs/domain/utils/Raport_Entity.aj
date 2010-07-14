package umk.net.slafs.domain.utils;

import java.util.Date;

import umk.net.slafs.domain.Pracownik;

privileged aspect Raport_Entity {
	
	/**
	 * @param dateTo the dateTo to set
	 */
	public void Raport.setDateTo(Date dateTo) {
		this.dateTo = dateTo;
	}
	/**
	 * @return the dateTo
	 */
	public Date Raport.getDateTo() {
		return dateTo;
	}
	/**
	 * @param dateFrom the dateFrom to set
	 */
	public void Raport.setDateFrom(Date dateFrom) {
		this.dateFrom = dateFrom;
	}
	/**
	 * @return the dateFrom
	 */
	public Date Raport.getDateFrom() {
		return dateFrom;
	}
	

	public Pracownik Raport.getPracownik() {
		return pracownik;
	}

	public void Raport.setPracownik(Pracownik pracownik) {
		this.pracownik = pracownik;
	}

	public Long Raport.getHoursWorked() {
		return hoursWorked;
	}

	public void Raport.setHoursWorked(Long hoursWorked) {
		this.hoursWorked = hoursWorked;
	}

	public Long Raport.getMinutesWorked() {
		return minutesWorked;
	}

	public void Raport.setMinutesWorked(Long minutesWorked) {
		this.minutesWorked = minutesWorked;
	}

}

