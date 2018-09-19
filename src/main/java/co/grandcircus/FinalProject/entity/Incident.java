package co.grandcircus.FinalProject.entity;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "incidents")
public class Incident {

	@Id
	private Integer incidentId;
	@Column(name = "incident_date")
	private LocalDate date;
	private String state;
	private String city_or_county;
	private String address;
	private Integer n_killed;
	private Integer n_injured;
	private String incident_url;
	private String source_url;
	private Integer congressional_district;
	private String gun_stolen;
	private String gun_type;
	private String incident_characteristics;
	private Double latitude;
	private Double longitude;
	private String n_guns_involved;
	private String notes;
	private String participant_age;
	private String participant_age_group;
	private String participant_gender;
	private String participant_name;
	private String participant_relationship;
	private String participant_status;
	private String participant_type;
	private String sources;
	private String state_house_district;
	private String state_senate_district;

//	private String[] namesAsList;

	public Integer getIncidentId() {
		return incidentId;
	}

	public void setIncidentId(Integer incidentId) {
		this.incidentId = incidentId;
	}

	public LocalDate getDate() {
		return date;
	}

	public void setDate(LocalDate date) {
		this.date = date;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCity_or_county() {
		return city_or_county;
	}

	public void setCity_or_county(String city_or_county) {
		this.city_or_county = city_or_county;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getN_killed() {
		return n_killed;
	}

	public void setN_killed(Integer n_killed) {
		this.n_killed = n_killed;
	}

	public Integer getN_injured() {
		return n_injured;
	}

	public void setN_injured(Integer n_injured) {
		this.n_injured = n_injured;
	}

	public String getIncident_url() {
		return incident_url;
	}

	public void setIncident_url(String incident_url) {
		this.incident_url = incident_url;
	}

	public String getSource_url() {
		return source_url;
	}

	public void setSource_url(String source_url) {
		this.source_url = source_url;
	}

//	public String getIncident_url_fields_missing() {
//		return incident_url_fields_missing;
//	}
//	public void setIncident_url_fields_missing(String incident_url_fields_missing) {
//		this.incident_url_fields_missing = incident_url_fields_missing;
//	}
	public Integer getCongressional_district() {
		return congressional_district;
	}

	public void setCongressional_district(Integer congressional_district) {
		this.congressional_district = congressional_district;
	}

	public String getGun_stolen() {
		return gun_stolen;
	}

	public void setGun_stolen(String gun_stolen) {
		this.gun_stolen = gun_stolen;
	}

	public String getGun_type() {
		return gun_type;
	}

	public void setGun_type(String gun_type) {
		this.gun_type = gun_type;
	}

	public String getIncident_characteristics() {
		return incident_characteristics;
	}

	public void setIncident_characteristics(String incident_characteristics) {
		this.incident_characteristics = incident_characteristics;
	}

	public Double getLatitude() {
		return latitude;
	}

	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}

	public Double getLongitude() {
		return longitude;
	}

	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}

	public String getN_guns_involved() {
		return n_guns_involved;
	}

	public void setN_guns_involved(String n_guns_involved) {
		this.n_guns_involved = n_guns_involved;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public String getParticipant_age() {
		return participant_age;
	}

	public void setParticipant_age(String participant_age) {
		this.participant_age = participant_age;
	}

	public String getParticipant_age_group() {
		return participant_age_group;
	}

	public void setParticipant_age_group(String participant_age_group) {
		this.participant_age_group = participant_age_group;
	}

	public String getParticipant_gender() {
		return participant_gender;
	}

	public void setParticipant_gender(String participant_gender) {
		this.participant_gender = participant_gender;
	}

	public String getParticipant_name() {
		return participant_name;
	}

	public void setParticipant_name(String participant_name) {
		this.participant_name = participant_name;
	}

	public String getParticipant_relationship() {
		return participant_relationship;
	}

	public void setParticipant_relationship(String participant_relationship) {
		this.participant_relationship = participant_relationship;
	}

	public String getParticipant_status() {
		return participant_status;
	}

	public void setParticipant_status(String participant_status) {
		this.participant_status = participant_status;
	}

	public String getParticipant_type() {
		return participant_type;
	}

	public void setParticipant_type(String participant_type) {
		this.participant_type = participant_type;
	}

	public String getSources() {
		return sources;
	}

	public void setSources(String sources) {
		this.sources = sources;
	}

	public String getState_house_district() {
		return state_house_district;
	}

	public void setState_house_district(String state_house_district) {
		this.state_house_district = state_house_district;
	}

	public String getState_senate_district() {
		return state_senate_district;
	}

	public void setState_senate_district(String state_senate_district) {
		this.state_senate_district = state_senate_district;
	}
	
//	@Transient
//	public String[] getUrl() {
//		String url = getSource_url();
//		
//		return parsedUrl;
//	}
	
	
	@Transient
	public String[] getChars() {
		String chars = getIncident_characteristics();
		String[] parsedChar = chars.split("\\|\\|") ;
//		List<String> parsedName = parseString(name);
		return parsedChar;
	}
	
	@Transient
	public List<String> getNames() {
		String name = getParticipant_name();
		List<String> parsedName = parseString(name);
		return parsedName;
	}

	@Transient
	public List<String> getAges() {
		String age = getParticipant_age();
		List<String> parsedAge = parseString(age);
		return parsedAge;
	}

	@Transient
	public List<String> getStatus() {
		String status = getParticipant_status();
		List<String> parsedStatus = parseString(status);
		return parsedStatus;
	}

	@Transient
	public List<String> getType() {
		String type = getParticipant_type();
		List<String> parsedType = parseString(type);
		return parsedType;
	}

	@Transient
	public List<String> getGender() {
		String gender = getParticipant_gender();
		List<String> parsedGender = parseString(gender);
		return parsedGender;
	}

	@Transient
	public List<String> parseString(String tobeParsed) {
		String[] parsedName;
		List<String> listOfNames = new ArrayList<>();
		if (!tobeParsed.isEmpty()) {
			parsedName = tobeParsed.split("\\|\\|");
			for (int i = 0; i < parsedName.length; i++) {
				listOfNames.add(parsedName[i].substring(3));
			}

		} else
			listOfNames.add("No Info found!");
		return listOfNames;
	}

	public Incident() {
	}

	/**
	 * @param incidentId
	 * @param date
	 * @param state
	 * @param city_or_county
	 * @param address
	 * @param n_killed
	 * @param n_injured
	 * @param incident_url
	 * @param source_url
	 * @param incident_url_fields_missing
	 * @param congressional_district
	 * @param gun_stolen
	 * @param gun_type
	 * @param incident_characteristics
	 * @param latitude
	 * @param longitude
	 * @param n_guns_involved
	 * @param notes
	 * @param participant_age
	 * @param participant_age_group
	 * @param participant_gender
	 * @param participant_name
	 * @param participant_relationship
	 * @param participant_status
	 * @param participant_type
	 * @param sources
	 * @param state_house_district
	 * @param state_senate_district
	 */
	public Incident(Integer incidentId, LocalDate date, String state, String city_or_county, String address,
			Integer n_killed, Integer n_injured, String incident_url, String source_url,
//			String incident_url_fields_missing, 
			Integer congressional_district, String gun_stolen, String gun_type, String incident_characteristics,
			Double latitude, Double longitude, String n_guns_involved, String notes, String participant_age,
			String participant_age_group, String participant_gender, String participant_name,
			String participant_relationship, String participant_status, String participant_type, String sources,
			String state_house_district, String state_senate_district) {
		super();
		this.incidentId = incidentId;
		this.date = date;
		this.state = state;
		this.city_or_county = city_or_county;
		this.address = address;
		this.n_killed = n_killed;
		this.n_injured = n_injured;
		this.incident_url = incident_url;
		this.source_url = source_url;
		this.congressional_district = congressional_district;
		this.gun_stolen = gun_stolen;
		this.gun_type = gun_type;
		this.incident_characteristics = incident_characteristics;
		this.latitude = latitude;
		this.longitude = longitude;
		this.n_guns_involved = n_guns_involved;
		this.notes = notes;
		this.participant_age = participant_age;
		this.participant_age_group = participant_age_group;
		this.participant_gender = participant_gender;
		this.participant_name = participant_name;
		this.participant_relationship = participant_relationship;
		this.participant_status = participant_status;
		this.participant_type = participant_type;
		this.sources = sources;
		this.state_house_district = state_house_district;
		this.state_senate_district = state_senate_district;
	}

}
