package com.traveler.app.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Tour {
	private int id;
	private String name;
	private String image;
	private int cityId;
}
