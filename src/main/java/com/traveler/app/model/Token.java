package com.traveler.app.model;

import lombok.Data;

@Data
public class Token {
	private String access_token;
	private String refresh_token;
	private String token_type;
	private String expires_in;
}
