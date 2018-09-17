package co.grandcircus.FinalProject.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import co.grandcircus.FinalProject.entity.Connection;
import co.grandcircus.FinalProject.entity.Incident;

@Transactional
@Repository
public class ConnectionDao {

	@PersistenceContext
	private EntityManager em;
	
	public List<Connection> byParticipantAndIncident(String participant, Integer incidentID) {
		List<Connection> connections = em.createQuery
				("FROM Connection WHERE participant = part AND incidentID = incidentID", Connection.class)
				.setParameter("part", participant).setParameter("incidentID", incidentID).getResultList();
		return connections;
	}
	
	
}
