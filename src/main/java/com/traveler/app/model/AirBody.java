package com.traveler.app.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AirBody {
	private int numOfRows;
	private int pageNo;
	private int totalCount;
	private AirItems items;
}
