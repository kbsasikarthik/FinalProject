package co.grandcircus.FinalProject.entity;

import static org.junit.Assert.assertEquals;

import java.util.List;

import java.util.Arrays;
import org.junit.Test;

public class IncidentTest {

	@Test
	public void test() {
		
		String test = "";
		Incident in = new Incident();
		in.setParticipant_name(test);
		List<String> actual = in.getNamesAsList();
		List<String> expected = null;
		assertEquals(expected,actual);	
	}
	
	@Test
	public void test1() {
		
		String test = "0::Name1";
		Incident in = new Incident();
		in.setParticipant_name(test);
		List<String> actual = in.getNamesAsList();
		List<String> expected = Arrays.asList("0::Name1");

		assertEquals(expected,actual);	
	}
	

	@Test
	public void test2() {
		
		String test = "0::Name1||1::Name2";
		Incident in = new Incident();
		in.setParticipant_name(test);
		List<String> actual = in.getNamesAsList();
		List<String> expected = Arrays.asList("0::Name1","1::Name2");

		assertEquals(expected,actual);	
	}
	
	

}
