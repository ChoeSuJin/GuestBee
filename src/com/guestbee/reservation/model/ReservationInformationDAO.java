package com.guestbee.reservation.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.util.Vector;

import com.guestbee.reservation.model.ReservationInformationVO;

import dbclose.util.CloseUtil;

public class ReservationInformationDAO {
	
	private static ReservationInformationDAO instance = new ReservationInformationDAO();
	
	private ReservationInformationDAO() { }
	
	public static ReservationInformationDAO getInstance() {
		return instance;
	}
	
	public static Connection Connect() {
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe", 
					"guestbee", 
					"oracle");
			System.out.println("연결 완료");
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			return conn;
		}
		
	}
	
	public static void insert(ReservationInformationVO vo) throws SQLException {
		
		Connection conn = Connect();
		
		String sql = "insert into RESERVATIONINFORMATIONDB(ri_num, ri_ID, ri_Name, ri_Date, ri_Price, ri_People, ri_UserID, ri_Local) values(ri_num.nextVal, ?, ?, ?, ?, ?, ?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, vo.getRi_ID());
		pstmt.setString(2, vo.getRi_Name());
		pstmt.setString(3, vo.getDate());
		pstmt.setInt(4, vo.getRi_Price());
		pstmt.setInt(5, vo.getRi_People());
		pstmt.setString(6, vo.getRi_UserID());
		pstmt.setString(7, vo.getRi_Local());
		
		pstmt.executeQuery();
		
		CloseUtil.close(pstmt);
		CloseUtil.close(conn);
		
		
	}
	
	
	
	

}
