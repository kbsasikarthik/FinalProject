package co.grandcircus.FinalProject.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import co.grandcircus.FinalProject.entity.Connection;

@Transactional
@Repository
public class ConnectionDao {

	@PersistenceContext
	private EntityManager em;

	public List<Connection> byParticipantAndIncident(String name) {
		List<Connection> connections = em
				.createQuery("FROM Connection WHERE participant = part AND incidentID = incidentID", Connection.class)
				.setParameter("part", name).getResultList();
		return connections;
	}

}
