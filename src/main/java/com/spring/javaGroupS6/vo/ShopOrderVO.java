package com.spring.javaGroupS6.vo;

import lombok.Data;

@Data
public class ShopOrderVO {
	private int idx;
	private int shopIdx;
	private int cartIdx;
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
	
	private int usePoint;
	private int addPoint;
	private String review;
	private String delivery;
	private String decide;
	
	private String company;
	private String partnerMid;
	private String buyerName;
	private String buyerAddress;
	private String buyerTel;
	private String buyerEmail;
	
}
