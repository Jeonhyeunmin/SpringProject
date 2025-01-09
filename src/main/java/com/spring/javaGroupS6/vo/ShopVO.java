package com.spring.javaGroupS6.vo;

import lombok.Data;

@Data
public class ShopVO {
	private int idx;
	private String mid;
	private String company;
	private String category;
	private String mainCategory;
	private String subCategory;
	private String title;
	private int price;
	private int discount;
	private String optionName;
	private String optionPrice;
	private String thumbnail;
	private String titleImg;
	private String content;
	private int fSize;
	private String claim;
	private String wDate;
	private String accept;
	
	private double star;
	private int reviewCnt;
}
