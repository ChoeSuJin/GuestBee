package com.guestbee.admin.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class SignupDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private static SignupDAO signupdao = new SignupDAO();

	public static SignupDAO getInstance() {
		return signupdao;
	}

	private SignupDAO() {

	}

	private Connection getOracle() throws Exception {
		Context ctx = new InitialContext();
		Context env = (Context) ctx.lookup("java:comp/env");
		DataSource ds = (DataSource) env.lookup("jdbc:GuestBeeDB");
		return ds.getConnection();

	}

	public SignupVO getInform1(String id) throws SQLException{
		SignupVO inform = null;
		try{
			conn=getOracle();
			String sql = "select * from guesthousedb where gh_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				inform = new SignupVO();
				inform.setGh_ID(rs.getString("gh_ID"));
				inform.setGh_PW(rs.getString("gh_PW"));
				inform.setGh_Name(rs.getString("gh_Name"));
				inform.setGh_Local(rs.getString("gh_Local"));
				inform.setGh_Img1(rs.getString("gh_Img1"));
				inform.setGh_Wifi(rs.getString("gh_Wifi"));
				inform.setGh_LateCheck(rs.getString("gh_LateCheck"));
				inform.setGh_ShareToilet(rs.getString("gh_ShareToilet"));
				inform.setGh_PrivateRoom(rs.getString("gh_PrivateRoom"));
				inform.setGh_Longitude(rs.getString("gh_Longitude"));
				inform.setGh_Latitude(rs.getString("gh_Latitude"));
				inform.setGh_TotalPeople(rs.getString("gh_TotalPeople"));
				inform.setGh_Phone(rs.getString("gh_Phone"));
				inform.setGh_Price(rs.getString("gh_Price"));
			}//end while
			
		}catch(Exception e){
			e.printStackTrace();
		}
		rs.close();
		pstmt.close();
		conn.close();
		return inform;
	}
	
	public ArrayList<ReservationVO> getInform2(String id) throws SQLException{
		ArrayList<ReservationVO> list = new ArrayList<ReservationVO>();
		ReservationVO inform = null;
		try{
			conn=getOracle();
			String sql = "select * from RESERVATIONINFORMATIONDB where ri_ID=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				System.out.println("rs.next() 진입");
				inform = new ReservationVO();
				inform.setRi_num(rs.getString("ri_num"));
				inform.setRi_ID(rs.getString("ri_ID"));
				inform.setRi_Date(rs.getString("ri_Date"));
				inform.setRi_Price(rs.getString("ri_Price"));
				inform.setRi_People(rs.getString("ri_People"));
				inform.setRi_UserID(rs.getString("ri_UserID"));
				
				list.add(inform);
			
			}//end while
			
		}catch(Exception e){
			e.printStackTrace();
		}
		rs.close();
		pstmt.close();
		conn.close();
		return list;
	}
	
	public void updateInform(SignupVO vo) throws SQLException {
		try {
			conn = getOracle();
			String sql = "update GuestHouseDB set gh_ID=?, gh_PW=?";
			sql += ",gh_Name =?,gh_Local =?,gh_Img1 =?";
			sql += ",gh_Wifi =?,gh_ShareToilet =?";
			sql += ",gh_PrivateRoom =?,gh_LateCheck =?,gh_Longitude =?";
			sql += ",gh_Latitude =?,gh_TotalPeople =?,gh_Phone =?,gh_Price =?";
			sql += " where gh_ID=?";

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getGh_ID());
			pstmt.setString(2, vo.getGh_PW());
			pstmt.setString(3, vo.getGh_Name());
			pstmt.setString(4, vo.getGh_Local());
			pstmt.setString(5, vo.getGh_Img1());
			pstmt.setString(6, vo.getGh_Wifi());
			pstmt.setString(7, vo.getGh_ShareToilet());
			pstmt.setString(8, vo.getGh_PrivateRoom());
			pstmt.setString(9, vo.getGh_LateCheck());
			pstmt.setString(10, vo.getGh_Longitude());
			pstmt.setString(11, vo.getGh_Latitude());
			pstmt.setString(12, vo.getGh_TotalPeople());
			pstmt.setString(13, vo.getGh_Phone());
			pstmt.setString(14, vo.getGh_Price());
			pstmt.setString(15, vo.getGh_ID());

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try{pstmt.close();}catch(SQLException s){}
			try{conn.close();}catch(SQLException s){}
		}
	}
	
	public boolean loginCheck(String id, String pw) throws SQLException {
		boolean result = false;
		try{
			conn = getOracle();
			String sql="select * from GUESTHOUSEDB where gh_ID=? and gh_PW=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			if(rs.next()){
				result=true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		rs.close();
		pstmt.close();
		conn.close();
		return result;
	}

}
