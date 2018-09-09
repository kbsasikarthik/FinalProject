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

}
