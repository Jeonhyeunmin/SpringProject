package com.spring.javaGroupS6.dao;

import org.apache.ibatis.annotations.Param;

import com.spring.javaGroupS6.vo.MemberVO;

public interface MemberDAO {

	MemberVO getMemberIdSearch(@Param("mid") String mid);

}
