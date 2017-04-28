package com.guestbee.matching.model;

import java.sql.Date;

public class BoardBean 
{
	//Action에서 DB에 넣는 순서
	/*
	 * Seq 시퀀스 값
	 * board_id
	 * board_subject
	 * board_subtitle
	 * board_purpose
	 * board_content
	 * board_course
	 * board_place
	 * board_noted
	 * board_file
	*/
	private int board_num;  		// 글번호
	private String board_id; 		// 글 작성자
	private String board_subject; 	// 글 제목
	
	//추가 db
	private String board_subtitle;	// 글 부제목
	private String board_local;		// 지역코드
	private String board_purpose;	// 글 목적
	private String board_course;	// 매칭 코스
	private String board_place;		// 매칭 장소
	private String board_noted;		// 매칭 주의사항
	
	private String board_content; 	// 글 내용
	private String board_file; 		// 첨부 사진
	
	private int board_re_ref; 		// 글 그룹번호
	private int board_re_lev; 		// 답변글 깊이
	private int board_re_seq; 		// 답변글 순서
	private int board_count; 		// 글 조회수
	private Date board_date; 		// 글 작성일
	
	//추가해야할 DB 전화번호, 카톡번호, email
	
	
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getBoard_id() {
		return board_id;
	}
	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}
	public String getBoard_subject() {
		return board_subject;
	}
	public void setBoard_subject(String board_subject) {
		this.board_subject = board_subject;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_file() {
		return board_file;
	}
	public void setBoard_file(String board_file) {
		this.board_file = board_file;
	}
	public int getBoard_re_ref() {
		return board_re_ref;
	}
	public void setBoard_re_ref(int board_re_ref) {
		this.board_re_ref = board_re_ref;
	}
	public int getBoard_re_lev() {
		return board_re_lev;
	}
	public void setBoard_re_lev(int board_re_lev) {
		this.board_re_lev = board_re_lev;
	}
	public int getBoard_re_seq() {
		return board_re_seq;
	}
	public void setBoard_re_seq(int board_re_seq) {
		this.board_re_seq = board_re_seq;
	}
	public int getBoard_count() {
		return board_count;
	}
	public void setBoard_count(int board_count) {
		this.board_count = board_count;
	}
	public Date getBoard_date() {
		return board_date;
	}
	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}
	public String getBoard_subtitle() {
		return board_subtitle;
	}
	public void setBoard_subtitle(String board_subtitle) {
		this.board_subtitle = board_subtitle;
	}
	public String getBoard_purpose() {
		return board_purpose;
	}
	public void setBoard_purpose(String board_purpose) {
		this.board_purpose = board_purpose;
	}
	public String getBoard_course() {
		return board_course;
	}
	public void setBoard_course(String board_course) {
		this.board_course = board_course;
	}
	public String getBoard_place() {
		return board_place;
	}
	public void setBoard_place(String board_place) {
		this.board_place = board_place;
	}
	public String getBoard_noted() {
		return board_noted;
	}
	public void setBoard_noted(String board_noted) {
		this.board_noted = board_noted;
	}
	public String getBoard_local() {
		return board_local;
	}
	public void setBoard_local(String board_local) {
		this.board_local = board_local;
	}
	
	
}
