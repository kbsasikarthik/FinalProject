package co.grandcircus.FinalProject.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "connection")
public class Connection {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    private Integer id;
    @Column(name = "name")
    private String connectionName;
    private String facebook;
    private String twitter;
    private String connectionType;
    @Column(name = "participant")
    private String participantName;
    @Column(name = "incident_id")
    private Integer incidentID;

    public Connection() {
    }

    public Connection(Integer id, String participantName, String facebook, String twitter, String connectionType,
            String connectionName, Integer incidentID) {
        super();
        this.id = id;
        this.participantName = participantName;
        this.facebook = facebook;
        this.twitter = twitter;
        this.connectionType = connectionType;
        this.connectionName = connectionName;
        this.incidentID = incidentID;
    }

    public Connection(String participantName, String facebook, String twitter, String connectionType,
            String connectionName, Integer incidentID) {
        super();
        this.participantName = participantName;
        this.facebook = facebook;
        this.twitter = twitter;
        this.connectionType = connectionType;
        this.connectionName = connectionName;
        this.incidentID = incidentID;
    }

    public Integer getId() {
        return id;
    }

    public void setId() {
        this.id = id;
    }

    public String getName() {
        return participantName;
    }

    public void setName(String participantName) {
        this.participantName = participantName;
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
        return connectionName;
    }

    public void setParticipant(String connectionName) {
        this.connectionName = connectionName;
    }

    public Integer getIncidentID() {
        return incidentID;
    }

    public void setIncidentID(Integer incidentID) {
        this.incidentID = incidentID;
    }

    @Override
    public String toString() {
        return "Connection [id=" + id + ", participantName=" + participantName + ", facebook=" + facebook + ", twitter="
                + twitter + ", connectionType=" + connectionType + ", connectionName=" + connectionName
                + ", incidentID=" + incidentID + "]";
    }

}