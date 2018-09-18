package co.grandcircus.FinalProject.dao;

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

}
