package com.spring.javaGroupS6.vo;

import lombok.Data;

@Data
public class ShopReviewVO {
	private int idx;
	private int shopIdx;
	private String mid;
	private String content;
	private int star;
	private String reviewDate;
	private int good;
	private String claim;
	
	private String customerName;
	private String customerId;
}
