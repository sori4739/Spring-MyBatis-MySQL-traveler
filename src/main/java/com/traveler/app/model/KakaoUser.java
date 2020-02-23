package com.traveler.app.model;

import lombok.Data;

@Data
public class KakaoUser {
	private String id;
	private String password;
	private KakaoUserResponse kakao_account;
}
