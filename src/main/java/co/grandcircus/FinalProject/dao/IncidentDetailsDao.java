package co.grandcircus.FinalProject.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import co.grandcircus.FinalProject.entity.Incident;

@Transactional
@Repository
public class IncidentDetailsDao {

	@PersistenceContext
	private EntityManager em;

	public List<Incident> byDate(String date) {
		System.out.println(date + " in DAO");
		List<Incident> dates = em.createQuery("FROM Incident WHERE incident_date = :date", Incident.class)
				.setParameter("date", date).getResultList();
		System.out.println("In Dao" + dates);
		return dates;
	}

}
