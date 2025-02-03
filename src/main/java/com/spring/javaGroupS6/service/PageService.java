package com.spring.javaGroupS6.service;

import java.util.List;

public interface PageService {

	int getTotRecCnt(String type, String user, String condition);

	<T> List<T> List(String type, int startIndexNo, int pageSize, String user, String condition);

}
