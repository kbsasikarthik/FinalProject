package co.grandcircus.FinalProject.entity;

public class Connection {
	
	private String name;
	private String facebook;
	private String twitter;
	private String connectionType;
	private String participant;
	private Integer incidentID;

	public Connection() {}

	public Connection(String name, String facebook, String twitter, String connectionType, String participant,
			 Integer incidentID) {
		super();
		this.name = name;
		this.facebook = facebook;
		this.twitter = twitter;
		this.connectionType = connectionType;
		this.participant = participant;
		this.incidentID = incidentID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFacebook() {
		return facebook;
	}

	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}

	public String getTwitter() {
		return twitter;
	}

	public void setTwitter(String twitter) {
		this.twitter = twitter;
	}

	public String getConnectionType() {
		return connectionType;
	}

	public void setConnectionType(String connectionType) {
		this.connectionType = connectionType;
	}

	public String getParticipant() {
		return participant;
	}

	public void setParticipant(String participant) {
		this.participant = participant;
	}

	public Integer getIncidentID() {
		return incidentID;
	}

	public void setIncidentID(Integer incidentID) {
		this.incidentID = incidentID;
	}

	@Override
	public String toString() {
		return "Connection [name=" + name + ", facebook=" + facebook + ", twitter=" + twitter + ", connectionType="
				+ connectionType + ", participant=" + participant + ", incidentID=" + incidentID + "]";
	}

}


