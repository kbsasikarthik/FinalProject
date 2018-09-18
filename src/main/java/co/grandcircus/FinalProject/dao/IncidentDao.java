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

//	@Autowired
//	private SessionFactory sessionFactory;

	@PersistenceContext
	private EntityManager em;

//	@Repository
//	public interface UserRepository extends CrudRepository<Incident, Long> {
//
//		public Iterable<Incident> findAll(Pageable page);
//	}

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
//	@SuppressWarnings({ "unchecked", "deprecation" })
//	@Transactional
//	public List<Incident> list(Integer offset, Integer maxResults){
//		return sessionFactory.openSession()
//				.createCriteria(Incident.class)
//				.setFirstResult(offset!=null?offset:0)
//				.setMaxResults(maxResults!=null?maxResults:10)
//				.list();
//	}
//	
//	
//	public Long count(){
//		return (Long)sessionFactory.openSession()
//				.createCriteria(Incident.class)
//				.setProjection(Projections.rowCount())
//				.uniqueResult();
//	}

//	public List<Incident> byStateAndCity(int page, String state, String city) {
//	public List<Incident> byStateAndCity(String state, String city) {

	public List<Incident> byStateAndCity(String state, String city) {
////	public List<Incident> byStateAndCity(String state, String city) {

////		int pageNumber = 5;
//		int pageSize = 20;
//
//
//		System.out.println(" In DAO State - " + state + " and City -" + city);
//		List<Incident> incidents = em
//				.createQuery("FROM Incident WHERE state = :stat AND city_or_county= :city", Incident.class)
//				.setFirstResult((page) * pageSize).setMaxResults(pageSize).setParameter("stat", state).setParameter("city", city).getResultList();
////		
		List<Incident> incidents = em
				.createQuery("FROM Incident WHERE state = :stat AND city_or_county= :city", Incident.class)
				.setParameter("stat", state).setParameter("city", city).getResultList();
//	
//		System.out.println("Extracted incidents In Dao" + incidents);
		return incidents;
	}

	public List<Incident> byName(String name) {
		List<Incident> people = em.createQuery("FROM Incident WHERE participant_name Like :name", Incident.class)
				.setParameter("name", "%" + name + "%").getResultList();
		return people;
	}

	public List<Incident> byDateRange(Date fromDate, Date toDate) {
		List<Incident> people = em
				.createQuery("FROM Incident WHERE incident_date BETWEEN :from AND :to", Incident.class)
				.setParameter("from", fromDate).setParameter("to", toDate).getResultList();
		return people;
	}

	public List<Incident> byDateAndLocation(Date fromDate, Date toDate, String state, String city) {
		List<Incident> people = em.createQuery(
				"FROM Incident WHERE incident_date BETWEEN :from AND :to AND state = :stat AND city_or_county= :city",
				Incident.class).setParameter("from", fromDate).setParameter("to", toDate).setParameter("stat", state)
				.setParameter("city", city).getResultList();
		return people;
	}

	public List<Incident> byDateAndName(Date fromDate, Date toDate, String name) {
		List<Incident> people = em
				.createQuery("FROM Incident WHERE incident_date BETWEEN :from AND :to AND participant_name Like :nam",
						Incident.class)
				.setParameter("from", fromDate).setParameter("to", toDate).setParameter("nam", "%" + name + "%")
				.getResultList();
		return people;
	}
}
