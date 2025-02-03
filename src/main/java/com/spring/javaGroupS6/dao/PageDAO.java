package com.spring.javaGroupS6.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface PageDAO {

	int getTotRecCnt(@Param("type") String type, @Param("user") String user, @Param("condition") String condition);

	<T> List<T> List(@Param("type") String type, @Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize, @Param("user") String user, @Param("condition") String condition);

}
