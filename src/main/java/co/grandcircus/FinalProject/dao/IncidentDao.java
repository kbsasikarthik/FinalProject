package co.grandcircus.FinalProject.dao;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import co.grandcircus.FinalProject.entity.Incident;

@Transactional
@Repository
public class IncidentDao {

	@PersistenceContext
	private EntityManager em;

	public Set<String> getStates() {
		List<String> states = em.createQuery("SELECT DISTINCT state FROM Incident", String.class).getResultList();
		return new TreeSet<>(states);
	}

	public List<Incident> byState(String state) {
		System.out.println(state + " in DAO");
		List<Incident> incidents = em.createQuery("FROM Incident WHERE state = :stat", Incident.class)
				.setParameter("stat", state).getResultList();
		System.out.println("In Dao" + incidents);
		return incidents;
	}

	public Set<String> getCities(String state) {
		System.out.println(state + " in DAO");
		List<String> cities = em
				.createQuery("SELECT DISTINCT city_or_county FROM Incident WHERE state = :stat", String.class)
				.setParameter("stat", state).getResultList();
		System.out.println("In Dao" + cities);
		return new TreeSet<>(cities);
	}

	public List<Incident> byStateAndCity(String state, String city) {
		System.out.println(" In DAO State - " + state + " and City -" + city);
		List<Incident> incidents = em
				.createQuery("FROM Incident WHERE state = :stat AND city_or_county= :city", Incident.class)
				.setMaxResults(25).setParameter("stat", state).setParameter("city", city).getResultList();
		System.out.println("Extracted incidents In Dao" + incidents);
		return incidents;
	}

	public List<Incident> byName(String name) {
		System.out.println(name + " in DAO");
		List<Incident> people = em.createQuery("FROM Incident WHERE participant_name Like :name", Incident.class)
				.setParameter("name", "%" + name + "%").getResultList();
		System.out.println("In Dao" + people);
		return people;
	}

	public List<Incident> byDateRange(LocalDate fromDate, LocalDate toDate) {
		System.out.println(fromDate + " in DAO" + toDate);
		List<Incident> people = em
				.createQuery("FROM Incident WHERE incident_date >= from AND incident_date <= to", Incident.class)
				.setParameter("from", fromDate).setParameter("to", toDate).getResultList();
		System.out.println("In Dao" + people);
		return people;
	}

	public List<Incident> byDateAndLocation(LocalDate fromDate, LocalDate toDate, String state, String city) {
		System.out.println(fromDate + " in DAO" + toDate);
		List<Incident> people = em.createQuery(
				"FROM Incident WHERE incident_date >= from AND incident_date <= to AND state = :stat AND city_or_county= :city",
				Incident.class).setParameter("from", fromDate).setParameter("to", toDate).setParameter("stat", state)
				.setParameter("city", city).getResultList();
		System.out.println("In Dao" + people);
		return people;
	}

	public List<Incident> byDateRange(Date fromDate, Date toDate) {
		System.out.println(fromDate + " in DAO" + toDate);
		List<Incident> people = em
				.createQuery("FROM Incident WHERE incident_date BETWEEN :from AND :to", Incident.class)
				.setParameter("from", fromDate).setParameter("to", toDate).getResultList();
		System.out.println("In Dao" + people);
		return people;
	}

	public List<Incident> byDateAndLocation(Date fromDate, Date toDate, String state, String city) {
		System.out.println(fromDate + " in DAO" + toDate);
		List<Incident> people = em.createQuery(
				"FROM Incident WHERE incident_date BETWEEN :from AND :to AND state = :stat AND city_or_county= :city",
				Incident.class).setParameter("from", fromDate).setParameter("to", toDate).setParameter("stat", state)
				.setParameter("city", city).getResultList();
		System.out.println("In Dao" + people);
		return people;
	}
}
