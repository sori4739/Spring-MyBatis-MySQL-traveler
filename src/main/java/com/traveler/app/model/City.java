package com.traveler.app.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class City {
	private int id;
	private String name;
	private String national;
	private String subtitle;
	private String image;
	private String content;
	private Tour tour;
}
