package co.grandcircus.FinalProject.entity;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

public class RepResult {
	
	@JsonProperty("results")
	private List<Representative> results;

	public List<Representative> getResults() {
		return results;
	}

	public void setResults(List<Representative> results) {
		this.results = results;
	}

	@Override
	public String toString() {
		return "RepResult [results=" + results + "]";
	}

	
}
