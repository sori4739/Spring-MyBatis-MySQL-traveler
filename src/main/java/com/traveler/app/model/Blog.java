package com.traveler.app.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Blog {
	private int id;
	private String title;
	private String link;
	private String description;
	private String bloggername;
	private String bloggerlink;
	private String postdate;
	private String previewImg;
	private int tourId;
	
	private boolean status;
}
