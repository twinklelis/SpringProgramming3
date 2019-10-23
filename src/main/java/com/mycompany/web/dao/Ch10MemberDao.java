package com.mycompany.web.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.web.dto.Ch10Member;

@Component
public class Ch10MemberDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public Ch10Member selectMember(String mid) {
		Ch10Member member = sqlSessionTemplate.selectOne("member.selectMemberByMid", mid);
		return member;
	}

	public int insert(Ch10Member member) {
		int rows = sqlSessionTemplate.insert("member.insert", member);
		return rows;
	}

}
