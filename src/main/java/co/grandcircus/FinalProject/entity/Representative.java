package co.grandcircus.FinalProject.entity;

public class Representative {
	
	private String name;
	private String party;
	private String state;
	private String district;
	private String phone;
	private String office;
	private String link;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getParty() {
		return party;
	}
	public void setParty(String party) {
		this.party = party;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getOffice() {
		return office;
	}
	public void setOffice(String office) {
		this.office = office;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	@Override
	public String toString() {
		return "Representative [name=" + name + ", party=" + party + ", state=" + state + ", district=" + district
				+ ", phone=" + phone + ", office=" + office + ", link=" + link + "]";
	}



	

}
