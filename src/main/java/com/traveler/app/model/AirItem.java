package com.traveler.app.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AirItem {
	private int id;
	private String airlineNm;	//항공사
	private String arrAirportNm;//도착공항
	private long arrPlandTime;	
	private String arrTime;		//도착시간
	private String depAirportNm;//출발공항
	private long depPlandTime;	
	private String depTime;		//출발시간
	private String vihicleId;	//편명
	private int economyCharge;  //운임비용
	private int userId;
}
