package com.mycompany.web.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
public class Ch09Dao2 {
	private static final Logger logger = LoggerFactory.getLogger(Ch09Dao2.class);
	
	public Ch09Dao2() {
		logger.debug("run"); //실행이 된다는 것 = 객체가 만들어짐
	}
	
	public void insert() {
		logger.debug("run!!!!!");
	}
}
