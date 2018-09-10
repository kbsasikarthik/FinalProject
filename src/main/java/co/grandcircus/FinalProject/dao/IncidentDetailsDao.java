package co.grandcircus.FinalProject.dao;

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

	public Incident byID(Integer incidentId) {
		System.out.println(incidentId + " in DAO");
		return em.createQuery("FROM Incident WHERE incidentId = :id", Incident.class).setParameter("id", incidentId)
				.getSingleResult();

	}

}
