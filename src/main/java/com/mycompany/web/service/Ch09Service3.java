package com.mycompany.web.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.web.dao.Ch09Dao3;

@Component
public class Ch09Service3 {
	private static final Logger logger = LoggerFactory.getLogger(Ch09Service3.class);
	
	@Autowired
	private Ch09Dao3 ch09Dao3;
	
	public void method3() {
		logger.debug("method3 실행");
		ch09Dao3.insert();
	}
}
