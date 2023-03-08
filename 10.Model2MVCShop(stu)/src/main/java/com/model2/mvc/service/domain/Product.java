package com.model2.mvc.service.domain;

import java.sql.Date;

//==> 상품정보를 모델링(추상화/캡슐화)한 Bean
public class Product {
	
	///Field
	private String fileName;
	private String manuDate;
	private int price;
	private String prodDetail;
	private String prodName;
	private int prodNo;
	private Date regDate;
	private String proTranCode;
	// JSON ==> Domain Object  Binding을 위해 추가된 부분
	private String regDateString;
	

	///Constructor
	public Product(){
	}
	
	///Method
	public String getProTranCode() {
		return proTranCode;
	}
	public void setProTranCode(String proTranCode) {
		this.proTranCode = proTranCode;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getManuDate() {
		
		//제조일자 형태때문에 발생할 오류 해결!
		String maDa = "";
		for (String date : manuDate.split("-")) {
			maDa += date;
		}			
		return maDa;
	}
	public void setManuDate(String manuDate) {
		this.manuDate = manuDate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getProdDetail() {
		return prodDetail;
	}
	public void setProdDetail(String prodDetail) {
		this.prodDetail = prodDetail;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public int getProdNo() {
		return prodNo;
	}
	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
		
		if(regDate != null) {
			
		this.setRegDateString(regDate.toString().split("-")[0]
											+"-"+regDate.toString().split("-")[1]
											+"-"+regDate.toString().split("-")[2]);
		}
	}
	
	public String getRegDateString() {
		return regDateString;
	}

	public void setRegDateString(String regDateString) {
		this.regDateString = regDateString;
	}

	
	
	@Override
	public String toString() {
		return "Product [fileName=" + fileName + ", manuDate=" + manuDate + ", price=" + price + ", prodDetail="
				+ prodDetail + ", prodName=" + prodName + ", prodNo=" + prodNo + ", regDate=" + regDate
				+ ", proTranCode=" + proTranCode + "]";
	}	
}