package co.grandcircus.FinalProject.entity;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

public class RepresentativeResult {
	@JsonProperty
	List<Representative> representatives;

	public List<Representative> getRepresentatives() {
		return representatives;
	}

	public void setRepresentatives(List<Representative> representatives) {
		this.representatives = representatives;
	}
	
	

}
