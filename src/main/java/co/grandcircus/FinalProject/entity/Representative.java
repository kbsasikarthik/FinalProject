package co.grandcircus.FinalProject.entity;

public class Representative {
	
	private String full_name;
	private String district;
	private String chamber;
	private String state;
	private String email;
	private String party;
	private String photo_url;
	private String url;
	
	public String getFull_name() {
		return full_name;
	}
	public void setFull_name(String full_name) {
		this.full_name = full_name;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getChamber() {
		return chamber;
	}
	public void setChamber(String chamber) {
		this.chamber = chamber;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getParty() {
		return party;
	}
	public void setParty(String party) {
		this.party = party;
	}
	public String getPhoto_url() {
		return photo_url;
	}
	public void setPhoto_url(String photo_url) {
		this.photo_url = photo_url;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	@Override
	public String toString() {
		return "Representative [full_name=" + full_name + ", district=" + district + ", chamber=" + chamber + ", state="
				+ state + ", email=" + email + ", party=" + party + ", photo_url=" + photo_url + ", url=" + url + "]";
	}

	

}
