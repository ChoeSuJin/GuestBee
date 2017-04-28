package com.guestbee.info.model;

import java.sql.Timestamp;

public class InfoReplyBoardVO {
		/*replyDB Table*/
	private int b_Boardnum ;
	private int r_BoardNum;
	private Timestamp r_Date;
	private String r_content;
	private String r_UserID ;
	private String r_Password;
	
	
	public int getR_BoardNum() {
		return r_BoardNum;
	}
	public void setR_BoardNum(int r_BoardNum) {
		this.r_BoardNum = r_BoardNum;
	}
	public Timestamp getR_Date() {
		return r_Date;
	}
	public void setR_Date(Timestamp r_Date) {
		this.r_Date = r_Date;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public String getR_UserID() {
		return r_UserID;
	}
	public void setR_UserID(String r_UserID) {
		this.r_UserID = r_UserID;
	}
	public String getR_Password() {
		return r_Password;
	}
	public void setR_Password(String r_Password) {
		this.r_Password = r_Password;
	}
	public int getB_Boardnum() {
		return b_Boardnum;
	}
	public void setB_Boardnum(int b_Boardnum) {
		this.b_Boardnum = b_Boardnum;
	}
	
}
