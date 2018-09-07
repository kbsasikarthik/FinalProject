package co.grandcircus.FinalProject.mapentity;

public class SearchLocation {

	private String streetNum;
	private String streetName;
	private String city;
	private String state;
	private Integer zip;
//	private Float latitude;
//	private Float longitude;

	public SearchLocation() {}

	public SearchLocation(String streetNum, String streetName, String city, String state, Integer zip) {
		super();
		this.streetNum = streetNum;
		this.streetName = streetName;
		this.city = city;
		this.state = state;
		this.zip = zip;
//		this.latitude = latitude;
//		this.longitude = longitude;
	}

	public String getStreetNum() {
		return streetNum;
	}

	public void setStreetNum(String streetNum) {
		this.streetNum = streetNum;
	}

	public String getStreetName() {
		return streetName;
	}

	public void setStreetName(String streetName) {
		this.streetName = streetName;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Integer getZip() {
		return zip;
	}

	public void setZip(Integer zip) {
		this.zip = zip;
	}

	@Override
	public String toString() {
		return "SearchLocation [streetNum=" + streetNum + ", StreetName=" + streetName + ", city=" + city + ", state="
				+ state + ", zip=" + zip + "]";
	}

}
