package co.grandcircus.FinalProject.entity;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

public class RepResult {
	
	@JsonProperty("results")
	private List<OldRepresentative> results;

	public List<OldRepresentative> getResults() {
		return results;
	}

	public void setResults(List<OldRepresentative> results) {
		this.results = results;
	}

	@Override
	public String toString() {
		return "RepResult [results=" + results + "]";
	}

	
}
