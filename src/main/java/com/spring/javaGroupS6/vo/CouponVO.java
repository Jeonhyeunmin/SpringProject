package com.spring.javaGroupS6.vo;

import lombok.Data;

@Data
public class CouponVO {
	private int idx;
	private int eventIdx;
	private String mid;
	private String couponName;
	private int discount;
	private String saleUnit;
	private String startDate;
	private String endDate;
	private String qrImage;
	private String status;
	private String createDate;
	private String useDate;
}
