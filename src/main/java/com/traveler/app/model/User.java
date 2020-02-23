package com.traveler.app.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
	private int id;
	private String username;
	private String password;
	private String email;
	private String profileImg;
	private Timestamp createDate;
	private String name;
	private String phone;
}
