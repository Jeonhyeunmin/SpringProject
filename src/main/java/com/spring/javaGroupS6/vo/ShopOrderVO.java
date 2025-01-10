package com.spring.javaGroupS6.vo;

import lombok.Data;

@Data
public class ShopOrderVO {
	private int idx;
	private int shopIdx;
	private String mid;
	private String shopTitle;
	private int price;
	private int quantity;
	private int discount;
	private int couponIdx;
	private String coupon;
	private int couponDiscount;
	private int pay;
	private int totalPrice;
	private String thumbnail;
	private String optionSelect;
	private String orderDate;
	
}
