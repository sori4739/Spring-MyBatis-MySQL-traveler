package com.traveler.app.repository;

import java.util.List;

import com.traveler.app.model.City;

public interface CityRepository {
	List<City> findByAll();
	City findById(int id);
	
}
