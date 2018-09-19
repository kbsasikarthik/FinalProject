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

	public void create(Connection connection) {

		em.persist(connection);

	}

	public void update(Connection connection) {
		em.merge(connection);
	}

	public List<Connection> byConnectionName(String connectionName) {
		List<Connection> connections = em.createQuery("FROM Connection WHERE name Like :name", Connection.class)
				.setParameter("name", "%" + connectionName + "%").getResultList();
		return connections;
	}

	public List<Connection> byFacebookName(String facebookName) {
		List<Connection> connections = em.createQuery("FROM Connection WHERE facebook =:faceName", Connection.class)
				.setParameter("faceName", facebookName).getResultList();
		return connections;
	}

	public List<Connection> byTwitterName(String twitterName) {
		List<Connection> connections = em.createQuery("FROM Connection WHERE twitter =:twitterName", Connection.class)
				.setParameter("twitterName", twitterName).getResultList();
		return connections;
	}
	public List<Connection> byParticipantAndIncident(String participant, Integer incidentId) {
		List<Connection> connections = em
				.createQuery("FROM Connection WHERE participantName =:partName AND incidentID = :incID",
						Connection.class)
				.setParameter("partName", participant).setParameter("incID", incidentId).getResultList();
		return connections;
	}
}