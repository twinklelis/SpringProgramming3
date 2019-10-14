package com.mycompany.web.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.web.dao.Ch09Dao;

public class Ch09Service {
	private static final Logger logger = LoggerFactory.getLogger(Ch09Service.class);
	
	public Ch09Service(String arg1, int arg2) {
		
	}
	
	@Autowired
	private Ch09Dao ch09Dao; //Ch09Service는 Ch09Dao를 필요로 한다는 의미..(?)
	
	public void method1() {
		logger.debug("실행");
		ch09Dao.insert();
	}
}
