package co.grandcircus.FinalProject.dao;

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
	
	public Set<String> getStates(){
		List<String> states = em.createQuery("SELECT DISTINCT state FROM Incident", String.class).getResultList();
		return new TreeSet<>(states);
	}
	
	public List<Incident> byState(String state){
		System.out.println(state+" in DAO");
		List<Incident> incidents= em.createQuery("FROM Incident WHERE state = :stat", Incident.class).setParameter("stat", state).getResultList();		
		System.out.println("In Dao"+incidents);
		return incidents;
	}
	
	public Set<String> getCities(String state){
		System.out.println(state+" in DAO");
		List<String> cities= em.createQuery("SELECT DISTINCT city_or_county FROM Incident WHERE state = :stat", String.class).setParameter("stat", state).getResultList();		
		System.out.println("In Dao"+cities);
		return new TreeSet<>(cities);
	}
	
	public List<Incident> byStateAndCity(String state, String city){
		System.out.println(state+" in DAO"+city);
		List<Incident> incidents= em.createQuery("FROM Incident WHERE state = :stat AND city_or_county= :city", Incident.class).setParameter("stat", state).setParameter("city", city).getResultList();		
		System.out.println("In Dao"+incidents);
		return incidents;
	}
	
	public List<Incident> byName(String firstName, String lastName){
		System.out.println(firstName+" in DAO"+lastName);
		List<Incident> people= em.createQuery("FROM Incident WHERE participant_name = :first AND participant_name = :last", Incident.class).setParameter("first", firstName).setParameter("last", lastName).getResultList();		
		System.out.println("In Dao"+people);
		return people;
	}
	
	public List<Incident> byDateRange(String firstName, String lastName){
		System.out.println(firstName+" in DAO"+lastName);
		List<Incident> people= em.createQuery("FROM Incident WHERE participant_name = :first AND participant_name = :last", Incident.class).setParameter("first", firstName).setParameter("last", lastName).getResultList();		
		System.out.println("In Dao"+people);
		return people;
	}

}
