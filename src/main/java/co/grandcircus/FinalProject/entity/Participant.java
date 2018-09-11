package co.grandcircus.FinalProject.entity;

public class Participant {
	
	private int incidentId; 
	private String firstName; 
	private String lastName; 
	private String age; 
	private String gender; 
	private String status; 
	private String type; 
	private Connection connection;
	
	
	public Participant(int incidentId, String firstName, String lastName, String age, String gender, String status,
			String type, Connection connection) {
		super();
		this.incidentId = incidentId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.age = age;
		this.gender = gender;
		this.status = status;
		this.type = type;
		this.connection = connection;
	}
	
	public Participant() {
		
	}

	public int getIncidentId() {
		return incidentId;
	}

	public void setIncidentId(int incidentId) {
		this.incidentId = incidentId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Connection getConnection() {
		return connection;
	}

	public void setConnection(Connection connection) {
		this.connection = connection;
	}

	@Override
	public String toString() {
		return "Participant [incidentId=" + incidentId + ", firstName=" + firstName + ", lastName=" + lastName
				+ ", age=" + age + ", gender=" + gender + ", status=" + status + ", type=" + type + ", connection="
				+ connection + "]";
	}
	
	
}
