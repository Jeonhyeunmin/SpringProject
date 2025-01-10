package com.spring.javaGroupS6.vo;

import lombok.Data;

@Data
public class ShopCartVO {
	private int idx;
	private String mid;
	private int shopIdx;
	private String thumbnail;
	private String shopTitle;
	private String optionSelect;
	private int quantity;
	private int totalPrice;
	private String cartDate;
	
	private String company;
}
