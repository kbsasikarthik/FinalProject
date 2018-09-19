 package co.grandcircus.FinalProject.dao;

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
		List<Incident> incidents = em.createQuery("FROM Incident WHERE state = :stat", Incident.class)
				.setParameter("stat", state).getResultList();
		return incidents;
	}

	public Set<String> getCities(String state) {
		List<String> cities = em
				.createQuery("SELECT DISTINCT city_or_county FROM Incident WHERE state = :stat", String.class)
				.setParameter("stat", state).getResultList();
		return new TreeSet<>(cities);
	}

	public List<Incident> byStateAndCity(int page, String state, String city) {
		List<Incident> incidents = em
				.createQuery("FROM Incident WHERE state = :stat AND city_or_county= :city ORDER BY incident_date desc", Incident.class)
				.setParameter("stat", state).setParameter("city", city).setFirstResult((page) * 40).setMaxResults(40).getResultList();
		return incidents;
	}
    
    public  List<Incident> allByStateAndCity(String state, String city){
    	List<Incident> incidents = em
				.createQuery("FROM Incident WHERE state = :stat AND city_or_county= :city ORDER BY incident_date desc", Incident.class)
				.setParameter("stat", state).setParameter("city", city).getResultList();
    	return incidents;
    }
      
    public long countByStateAndCity(String state, String city){
    	long incidents = em
				.createQuery("SELECT count(*) FROM Incident WHERE state = :stat AND city_or_county= :city ORDER BY incident_date desc", Long.class)
				.setParameter("stat", state).setParameter("city", city).getSingleResult();
    	return incidents;
    }

	public List<Incident> byName(int page, String name) {
		List<Incident> people = em.createQuery("FROM Incident WHERE participant_name Like :name ORDER BY incident_date desc", Incident.class)
						.setParameter("name", "%" + name + "%").setFirstResult((page) * 40).setMaxResults(40).getResultList();
		return people;
	}
	
	public List<Incident> allByName(String name) {
		List<Incident> people = em.createQuery("FROM Incident WHERE participant_name Like :name ORDER BY incident_date desc", Incident.class)
				.setParameter("name", "%" + name + "%").getResultList();
		return people;
	}
	
    public long countByName(String name){
    	long incidents = em
				.createQuery("SELECT count(*) FROM Incident WHERE participant_name Like :name ORDER BY incident_date desc", Long.class) 
				.setParameter("name", "%" + name + "%").getSingleResult();
    	return incidents;
    }

	public List<Incident> byDateAndLocation(int page, Date fromDate, Date toDate, String state, String city) {
		List<Incident> people = em.createQuery(
				"FROM Incident WHERE incident_date BETWEEN :from AND :to AND state = :stat AND city_or_county= :city ORDER BY incident_date desc",
				Incident.class).setParameter("from", fromDate).setParameter("to", toDate).setParameter("stat", state)
				.setParameter("city", city).setFirstResult((page) * 40).setMaxResults(40).getResultList();
		return people;
	}
	
	public List<Incident> allByDateAndLocation(Date fromDate, Date toDate, String state, String city) {
		List<Incident> people = em.createQuery(
				"FROM Incident WHERE incident_date BETWEEN :from AND :to AND state = :stat AND city_or_county= :city ORDER BY incident_date desc",
				Incident.class).setParameter("from", fromDate).setParameter("to", toDate).setParameter("stat", state)
				.setParameter("city", city).getResultList();
		return people;
	}
	
    public long countByLocationAndDate(Date fromDate, Date toDate, String state, String city){
    	long incidents = em
				.createQuery("SELECT count(*) FROM Incident WHERE incident_date BETWEEN :from AND :to AND state = :stat AND city_or_county= :city ORDER BY incident_date desc", Long.class)
				.setParameter("from", fromDate).setParameter("to", toDate).setParameter("stat", state) 
				.setParameter("city", city).getSingleResult();
    	return incidents;
    }
    
	public List<Incident> byDateAndName(int page, Date fromDate, Date toDate, String name) {
		List<Incident> people = em
				.createQuery("FROM Incident WHERE incident_date BETWEEN :from AND :to AND participant_name Like :nam ORDER BY incident_date desc", Incident.class)
				.setParameter("from", fromDate).setParameter("to", toDate).setParameter("nam", "%" + name + "%")
				.setFirstResult((page) * 40).setMaxResults(40).getResultList();
		return people;
	}
	
	public List<Incident> allByDateAndName(Date fromDate, Date toDate, String name) {
		List<Incident> people = em
				.createQuery("FROM Incident WHERE incident_date BETWEEN :from AND :to AND participant_name Like :nam ORDER BY incident_date desc",
						Incident.class)
				.setParameter("from", fromDate).setParameter("to", toDate).setParameter("nam", "%" + name + "%")
				.getResultList();
		return people;
	}
	
    public long countByNameAndDate(Date fromDate, Date toDate, String name){
    	long incidents = em
				.createQuery("SELECT count(*) FROM Incident WHERE incident_date BETWEEN :from AND :to AND participant_name Like :nam ORDER BY incident_date desc", Long.class)
				.setParameter("from", fromDate).setParameter("to", toDate).setParameter("nam", "%" + name + "%").getSingleResult();
    	return incidents;
    }


	public Incident byID(Integer incidentId) {
		return em.createQuery("FROM Incident WHERE incidentId = :id", Incident.class).setParameter("id", incidentId)
				.getSingleResult();

	}
}