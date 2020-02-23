package com.traveler.app.service;

import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.traveler.app.model.Air;

@Service
public class AirService {
	public Air dateProcessing(String result, int people) {
		Gson gson = new Gson();
		Air air = new Air();
		air = gson.fromJson(result, Air.class);

		for (int i = 0; i < air.getResponse().getBody().getItems().getItem().size(); i++) {
			long depPlandTime = air.getResponse().getBody().getItems().getItem().get(i).getDepPlandTime();
			long year = depPlandTime / 100000000;
			long month = depPlandTime / 1000000 % 100;
			long day = depPlandTime / 10000 % 100;
			long hour = depPlandTime / 100 % 100;
			long minute = depPlandTime % 100;
			String depTime = year + "년 " + month + "월 " + day + "일 " + hour + ":" + minute;

			air.getResponse().getBody().getItems().getItem().get(i).setDepTime(depTime);

			long arrPlandTime = air.getResponse().getBody().getItems().getItem().get(i).getArrPlandTime();
			long year2 = arrPlandTime / 100000000;
			long month2 = arrPlandTime / 1000000 % 100;
			long day2 = arrPlandTime / 10000 % 100;
			long hour2 = arrPlandTime / 100 % 100;
			long minute2 = arrPlandTime % 100;
			String arrTime = year2 + "년 " + month2 + "월 " + day2 + "일 " + hour2 + ":" + minute2;
			air.getResponse().getBody().getItems().getItem().get(i).setArrTime(arrTime);

			int charge = air.getResponse().getBody().getItems().getItem().get(i).getEconomyCharge() * people;
			air.getResponse().getBody().getItems().getItem().get(i).setEconomyCharge(charge);
		}
		return air;
	}
}
