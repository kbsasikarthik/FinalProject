package co.grandcircus.FinalProject.entity;

public class Connection {
	
	private String firstName;
	private String lastName; 
	private String connectionType; 
	private String socialMediaAccount;
	
	
	public Connection(String firstName, String lastName, String connectionType, String socialMediaAccount) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.connectionType = connectionType;
		this.socialMediaAccount = socialMediaAccount;
	}
	
	public Connection() {
		
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
	public String getConnectionType() {
		return connectionType;
	}
	public void setConnectionType(String connectionType) {
		this.connectionType = connectionType;
	}
	public String getSocialMediaAccount() {
		return socialMediaAccount;
	}
	public void setSocialMediaAccount(String socialMediaAccount) {
		this.socialMediaAccount = socialMediaAccount;
	}
	@Override
	public String toString() {
		return "Connection [firstName=" + firstName + ", lastName=" + lastName + ", connectionType=" + connectionType
				+ ", socialMediaAccount=" + socialMediaAccount + "]";
	} 

	
}


