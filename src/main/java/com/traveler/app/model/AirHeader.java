package com.traveler.app.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AirHeader {
	private String resultCode;
	private String resultMsg;
}
