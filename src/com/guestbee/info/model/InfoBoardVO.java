package com.guestbee.info.model;

import java.sql.Timestamp;

public class InfoBoardVO {
		/*ù���� TABLE*/
	private int b_Boardnum ;
	private String b_Local ;
	private String b_Address ;
	private String b_Name ;
	private String b_Content ;
	private String b_Img1 ;
	private String b_Img2 ;
	private String b_Img3 ;
	private String b_Img4 ;	
	private String b_Img5 ;
	private String b_Title;
	private String b_UserID ;
	private Timestamp b_Date;
	private String b_Password;
	/*�ι�° TABLE
	private int r_BoardNum;
	private Timestamp r_Date;
	private String r_content;
	private String r_UserID ;
	private String r_Password;*/
	
	public int getb_Boardnum () {
		return b_Boardnum ;
	}
	public void setb_Boardnum (int b_Boardnum ) {
		this.b_Boardnum  = b_Boardnum ;
	}
	public String getB_Local() {
		return b_Local;
	}
	public void setB_Local(String b_Local) {
		this.b_Local = b_Local;
	}
	public String getB_Address() {
		return b_Address;
	}
	public void setB_Address(String b_Address) {
		this.b_Address = b_Address;
	}
	public String getB_Name() {
		return b_Name;
	}
	public void setB_Name(String b_Name) {
		this.b_Name = b_Name;
	}
	public String getB_Content() {
		return b_Content;
	}
	public void setB_Content(String b_Content) {
		this.b_Content = b_Content;
	}
	public String getB_Img1() {
		return b_Img1;
	}
	public void setB_Img1(String b_Img1) {
		this.b_Img1 = b_Img1;
	}
	public String getB_Img2() {
		return b_Img2;
	}
	public void setB_Img2(String b_Img2) {
		this.b_Img2 = b_Img2;
	}
	public String getB_Img3() {
		return b_Img3;
	}
	public void setB_Img3(String b_Img3) {
		this.b_Img3 = b_Img3;
	}
	public String getB_Img4() {
		return b_Img4;
	}
	public void setB_Img4(String b_Img4) {
		this.b_Img4 = b_Img4;
	}
	public String getB_Img5() {
		return b_Img5;
	}
	public void setB_Img5(String b_Img5) {
		this.b_Img5 = b_Img5;
	}
	public String getB_Title() {
		return b_Title;
	}
	public void setB_Title(String b_Title) {
		this.b_Title = b_Title;
	}
	public String getB_UserID() {
		return b_UserID;
	}
	public void setB_UserID(String b_UserID) {
		this.b_UserID = b_UserID;
	}
	public Timestamp getB_Date() {
		return b_Date;
	}
	public void setB_Date(Timestamp b_Date) {
		this.b_Date = b_Date;
	}
	public String getB_Password() {
		return b_Password;
	}
	public void setB_Password(String b_Password) {
		this.b_Password = b_Password;
	}
	/*public int getR_BoardNum() {
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
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}*/
	
	
}
