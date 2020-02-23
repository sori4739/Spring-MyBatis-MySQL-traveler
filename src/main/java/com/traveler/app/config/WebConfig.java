package com.traveler.app.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.resource.PathResourceResolver;

@Configuration
public class WebConfig implements WebMvcConfigurer {

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		WebMvcConfigurer.super.addResourceHandlers(registry);

		registry.addResourceHandler("/images/**").addResourceLocations("file:////home/ubuntu/Spring-MyBatis-MySQL-traveler/src/main/resources/images/").setCachePeriod(3600)
				.resourceChain(true).addResolver(new PathResourceResolver());
	}

	

}