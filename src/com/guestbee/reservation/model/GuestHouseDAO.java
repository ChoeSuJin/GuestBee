package com.guestbee.reservation.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dbconn.util.ConnectionUtil;
import com.guestbee.reservation.model.GuestHouseVO;

import dbclose.util.CloseUtil;

public class GuestHouseDAO {

	private static GuestHouseDAO instance = new GuestHouseDAO();

	private GuestHouseDAO() {
	}

	public static GuestHouseDAO getInstance() {
		return instance;
	}

	public static Connection Connect() {
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "guestbee", "oracle");
			System.out.println("연결 완료");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return conn;
		}

	}
	
	public static Vector<GuestHouseVO> getSpecialList(String date, int people, String local, String[] special) throws SQLException, ParseException {

		Connection conn = Connect();
		String prvRoom = "0", shareToeilet = "0", wifi = "0", lateCheckIn = "0";
		
		for (int i = 0; i < special.length; i++) {
			if (special[i].equals("private"))
				prvRoom = "1";
			if (special[i].equals("shareToilet"))
				shareToeilet = "1";
			if (special[i].equals("wifi"))
				wifi = "1";
			if (special[i].equals("lateCheckIn"))
				lateCheckIn = "1";
		}
		
		Vector<GuestHouseVO> list = new Vector<GuestHouseVO>();
		StringBuffer sb = new StringBuffer();
			sb.append("select * from GUESTHOUSEDB g inner join");
			sb.append(" (select ri_id, sum(ri_people) s from RESERVATIONINFORMATIONDB where ri_date=? group by(ri_id)) r");
			sb.append(" on g.gh_id = r.ri_id");
			sb.append(" where ? < g.gh_totalPeople and g.gh_local = ? and gh_Wifi = ? and gh_ShareToilet=? and");
			sb.append(" gh_PrivateRoom = ? and gh_LateCheck = ?");
			
			
		PreparedStatement pstmt = conn.prepareStatement(sb.toString());

		pstmt.setString(1, date);
		pstmt.setInt(2, people);
		pstmt.setString(3, local);
		pstmt.setString(4, wifi);
		pstmt.setString(5, shareToeilet);
		pstmt.setString(6, prvRoom);
		pstmt.setString(7, lateCheckIn);
		

		ResultSet rs = pstmt.executeQuery();

		while (rs.next()) {
			System.out.println("rs 출력 진읿");
			GuestHouseVO vo = new GuestHouseVO();
			String gh_id = rs.getString(1);
			String gh_PW = rs.getString(2);
			String gh_Name = rs.getString(3);
			String gh_local = rs.getString(4);
			String gh_img1 = rs.getString(5);
			
			String gh_wifi = rs.getString(6);
			String gh_shareToilet = rs.getString(7);
			String gh_privateRoom = rs.getString(8);
			String gh_lateCheck = rs.getString(9);
			double gh_longitude = rs.getDouble(10);
			double gh_latitude = rs.getDouble(11);
			int gh_totalPeople = rs.getInt(12);
			String gh_phone = rs.getString(13);
			int gh_price = rs.getInt(14);
			
			
			
			int gh_remain = gh_totalPeople - rs.getInt(15);
			int price = rs.getInt("gh_Price");
			
			System.out.println("in getSpecialList function id = " + gh_id);

			
			vo.setGh_ID(gh_id);
			vo.setGh_Name(gh_Name);
			vo.setGh_Local(gh_local);
			vo.setGh_totalPeople(gh_totalPeople);
			vo.setGh_phone(gh_phone);
			vo.setGh_Img1(gh_img1);
			vo.setGh_Wifi(gh_wifi);
			vo.setGh_ShareToilet(gh_shareToilet);
			vo.setGh_PrivateRoom(gh_privateRoom);
			vo.setGh_LateCheck(gh_lateCheck);
			vo.setGh_Longitude(gh_longitude);
			vo.setGh_Latitude(gh_latitude);
			vo.setGh_remain(gh_remain);
			vo.setGh_Price(price);

			list.add(vo);
		}
		
		CloseUtil.close(rs);
		CloseUtil.close(pstmt);
		CloseUtil.close(conn);

		return list;
	}

	public static Vector<GuestHouseVO> getList(String date, int people, String local) throws SQLException, ParseException {

		Connection conn = Connect();
		Vector<GuestHouseVO> list = new Vector<GuestHouseVO>();
		StringBuffer sb = new StringBuffer();
			sb.append("select * from GUESTHOUSEDB g inner join");
			sb.append(" (select ri_id, sum(ri_people) s from RESERVATIONINFORMATIONDB where ri_date=? group by(ri_id)) r");
			sb.append(" on g.gh_id = r.ri_id");
			sb.append(" where ? < g.gh_totalPeople and g.gh_local = ?");
		PreparedStatement pstmt = conn.prepareStatement(sb.toString());

		pstmt.setString(1, date);
		pstmt.setInt(2, people);
		pstmt.setString(3, local);

		ResultSet rs = pstmt.executeQuery();

		while (rs.next()) {
			System.out.println("rs 출력 진읿");
			GuestHouseVO vo = new GuestHouseVO();
			String gh_id = rs.getString(1);
			String gh_PW = rs.getString(2);
			String gh_Name = rs.getString(3);
			System.out.println("숙소 이름 " + gh_Name);
			String gh_local = rs.getString(4);
			String gh_img1 = rs.getString(5);
			String gh_wifi = rs.getString(6);
			String gh_shareToilet = rs.getString(7);
			String gh_privateRoom = rs.getString(8);
			String gh_lateCheck = rs.getString(9);
			double gh_longitude = rs.getDouble(10);
			double gh_latitude = rs.getDouble(11);
			int gh_totalPeople = rs.getInt(12);
			String gh_phone = rs.getString(13);
			int gh_price = rs.getInt(14);
			int remain = gh_totalPeople-rs.getInt(16);
			
			vo.setGh_ID(gh_id);
			vo.setGh_Name(gh_Name);
			vo.setGh_Local(gh_local);
			vo.setGh_totalPeople(gh_totalPeople);
			vo.setGh_phone(gh_phone);
			vo.setGh_Img1(gh_img1);
			vo.setGh_Wifi(gh_wifi);
			vo.setGh_ShareToilet(gh_shareToilet);
			vo.setGh_PrivateRoom(gh_privateRoom);
			vo.setGh_LateCheck(gh_lateCheck);
			vo.setGh_Longitude(gh_longitude);
			vo.setGh_Latitude(gh_latitude);
			vo.setGh_remain(remain);
			vo.setGh_Price(gh_price);

			list.add(vo);
		}

		
		CloseUtil.close(rs);
		CloseUtil.close(pstmt);
		CloseUtil.close(conn);
		return list;
	}
	
	public static void insert(GuestHouseVO vo) throws SQLException {
		Connection conn = Connect();
		StringBuffer sb = new StringBuffer();
		sb.append("insert into GUESTHOUSEDB(gh_ID, gh_name, gh_local, gh_img1, gh_wifi, gh_shareToilet, gh_lateCheck, gh_privateroom, gh_latitude, gh_longitude, gh_totalpeople, gh_phone)" );
		sb.append(" values(guestHouse_num.nextVal, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
		
		PreparedStatement pstmt = conn.prepareStatement(sb.toString());
		pstmt.setString(1, vo.getGh_Name());
		pstmt.setString(2, vo.getGh_Local());
		pstmt.setString(3, vo.getGh_Img1());
		pstmt.setString(4, vo.getGh_Wifi());
		pstmt.setString(5, vo.getGh_ShareToilet());
		pstmt.setString(6, vo.getGh_LateCheck());
		pstmt.setString(7, vo.getGh_PrivateRoom());
		pstmt.setDouble(8, vo.getGh_Latitude());
		pstmt.setDouble(9, vo.getGh_Longitude());
		pstmt.setInt(10, vo.getGh_totalPeople());
		pstmt.setString(11, vo.getGh_phone());
		
		pstmt.executeQuery();
		
		CloseUtil.close(pstmt);
		CloseUtil.close(conn);

	}
	
	public static ArrayList<GuestHouseVO> getTopList() throws SQLException {
		
		Connection conn = Connect();
		StringBuffer sb = new StringBuffer();
		ArrayList<GuestHouseVO> list = new ArrayList<GuestHouseVO>();
		
		sb.append("select gh_id, gh_Img1, gh_name, count(ri_id)");
		sb.append(" from RESERVATIONINFORMATIONDB inner join GUESTHOUSEDB on gh_id=ri_id");
		sb.append(" group by (gh_id, gh_Img1, gh_name)");
		sb.append(" order by count(ri_id) desc");
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sb.toString());
		
		while(rs.next()) {
			
			GuestHouseVO vo = new GuestHouseVO();
			
			vo.setGh_ID(rs.getString(1));
			vo.setGh_Img1(rs.getString(2));
			vo.setGh_Name(rs.getString(3));
			
			list.add(vo);
		}
		
		CloseUtil.close(rs);
		CloseUtil.close(stmt);
		CloseUtil.close(conn);
		
		return list;
		
		
		
	}
	
	

}
