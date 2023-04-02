package com.srb.institutemanagement.dto;

import java.util.Objects;

import lombok.ToString;

@ToString
public class TestDto {

	public String a;

//	@Override
//	public int hashCode() {
//		return Objects.hash(a);
//	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		TestDto other = (TestDto) obj;
		return Objects.equals(a, other.a);
	}
	
	
	
}
