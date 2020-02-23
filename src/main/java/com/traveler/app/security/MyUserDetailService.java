package com.traveler.app.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.traveler.app.model.User;
import com.traveler.app.repository.UserRepository;

@Service
public class MyUserDetailService implements UserDetailsService{
	
	@Autowired
	private UserRepository mUserRepository;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = mUserRepository.findByUsername(username);
		MyUserDetails userDetails = null;
		
		if(user != null) {
			userDetails = new MyUserDetails();
			userDetails.setUser(user);
		}else {
			throw new UsernameNotFoundException("유저 네임이 없어요 : "+username);
		}
		return userDetails;
	}

}
