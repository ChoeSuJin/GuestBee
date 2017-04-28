package com.guestbee.reservation.model;

import java.sql.Timestamp;

public class ReservationInformationVO {
	
	private String ri_ID, ri_UserID;
	private int ri_Price, ri_People, ri_num;
	private String date, ri_Name, ri_Local;
	public String getRi_ID() {
		return ri_ID;
	}
	public void setRi_ID(String ri_ID) {
		this.ri_ID = ri_ID;
	}
	public String getRi_UserID() {
		return ri_UserID;
	}
	public void setRi_UserID(String ri_UserID) {
		this.ri_UserID = ri_UserID;
	}
	public int getRi_Price() {
		return ri_Price;
	}
	public void setRi_Price(int ri_Price) {
		this.ri_Price = ri_Price;
	}
	public int getRi_People() {
		return ri_People;
	}
	public void setRi_People(int ri_People) {
		this.ri_People = ri_People;
	}
	public int getRi_num() {
		return ri_num;
	}
	public void setRi_num(int ri_num) {
		this.ri_num = ri_num;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getRi_Name() {
		return ri_Name;
	}
	public void setRi_Name(String ri_Name) {
		this.ri_Name = ri_Name;
	}
	public String getRi_Local() {
		return ri_Local;
	}
	public void setRi_Local(String ri_Local) {
		this.ri_Local = ri_Local;
	}
	
	
	
	
	

}
