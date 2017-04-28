package com.guestbee.info.model;
import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dbclose.util.CloseUtil;
import jdk.nashorn.internal.ir.RuntimeNode.Request;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import com.guestbee.*;

public class InfoBoardDAO {
private static InfoBoardDAO instance = new InfoBoardDAO();	// �ѹ��� ��ü�� �����Ͽ� ��� Ŭ���̾�Ʈ���� ����
	
	public static InfoBoardDAO getInstance(){
		return instance;
	}// getInstance()
	
	// ������
	public InfoBoardDAO(){}
		
	// DB����
	public Connection getConnection() throws Exception{
		// ������ JNDI & POLL ���·� ���� ��ü �����ؼ� ����
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc:GuestBeeDB");
		System.out.println("Connection sucess!!!");
		return ds.getConnection();
	}// getConnection();
	
	// insert(vo) method - ���ο� ���� �Խ��ǿ� �߰�, �� �Է� ó���� ���
		public int insert(InfoReplyBoardVO vo,int B_boardnum ) {
			System.out.println("���� �μ�Ʈ ����");
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
					 
			 StringBuffer sb = new StringBuffer();			 		
			try {
				conn = getConnection();
				sb.append("INSERT INTO REPLYDB (B_boardnum,R_BoardNum,r_Date,r_content,r_UserID,r_Password)");
				sb.append(" VALUES(?,R_BoardNum.NEXTVAL,?,?,?,?)" );
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, B_boardnum);
				pstmt.setTimestamp(2, vo.getR_Date());
				pstmt.setString(3, vo.getR_content());
				pstmt.setString(4, vo.getR_UserID());
				pstmt.setString(5, vo.getR_Password());
			
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			if (pstmt!=null) {
				   CloseUtil.close(pstmt);
			   }if (conn!=null) {
				   CloseUtil.close(conn);;
			   
			}
			return 0;
}
		
		public InfoBoardVO DetailView(String B_boardnum) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;		 
		    StringBuffer sb = new StringBuffer();	
		   
		    InfoBoardVO vo=new InfoBoardVO();
		   try {
			conn= getConnection();
			sb.append("select B_ADDRESS,B_NAME,B_CONTENT,B_IMG1,B_IMG2,B_IMG3,B_IMG4,B_IMG5,B_TITLE,B_USERID,B_DATE,B_PASSWORD");
			sb.append(" from BoardDB where B_boardnum=?");
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, Integer.parseInt(B_boardnum));
			rs = pstmt.executeQuery();
			while(rs.next()){
				System.out.println(rs.getString(9));
				vo.setB_Address(rs.getString(1));
				vo.setB_Name(rs.getString(2));
				vo.setB_Content(rs.getString(3));
				vo.setB_Img1(rs.getString(4));
				vo.setB_Img2(rs.getString(5));
				vo.setB_Img3(rs.getString(6));
				vo.setB_Img4(rs.getString(7));
				vo.setB_Img5(rs.getString(8));
				vo.setB_Title(rs.getString(9));
				vo.setB_UserID(rs.getString(10));
				vo.setB_Date(rs.getTimestamp(11));
				vo.setB_Password(rs.getString(12));
				
			}
			
	   
		} catch (Exception e) {
			e.printStackTrace();
		}
		   if (rs!=null) {
			   CloseUtil.close(rs);
		   }if (pstmt!=null) {
			   CloseUtil.close(pstmt);
		   }if (conn!=null) {
			   CloseUtil.close(conn);;
		   }
		   return vo;
		}
		public int Mainlist(InfoBoardVO vo) {
			System.out.println("Main�� ����");
			Connection conn = null;
			PreparedStatement pstmt = null;
			
					 
			 StringBuffer sb = new StringBuffer();			 		
			try {
				conn = getConnection();
				sb.append("INSERT INTO BOARDDB(B_BOARDNUM,B_LOCAL,B_ADDRESS,B_NAME,B_CONTENT,B_IMG1,B_IMG2,B_IMG3,B_IMG4,B_IMG5,B_TITLE,B_USERID,B_DATE,B_PASSWORD )");
				sb.append(" VALUES(B_BOARDNUM.NEXTVAL,?,?,?,?,?,?,?,?,?,?,?,?,?)" );
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, vo.getB_Local());
				pstmt.setString(2, vo.getB_Address());
				pstmt.setString(3, vo.getB_Name());
				pstmt.setString(4, vo.getB_Content());
				pstmt.setString(5, vo.getB_Img1());
				pstmt.setString(6, vo.getB_Img2());
				pstmt.setString(7, vo.getB_Img3());
				pstmt.setString(8, vo.getB_Img4());
				pstmt.setString(9,vo.getB_Img5());
				pstmt.setString(10, vo.getB_Title());
				pstmt.setString(11, vo.getB_UserID());
				pstmt.setTimestamp(12, vo.getB_Date());
				pstmt.setString(13, vo.getB_Password());
			
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
				
			}finally{
					if (pstmt!=null) {
					   CloseUtil.close(pstmt);
				   }if (conn!=null) {
					   CloseUtil.close(conn);;
				   }
			}
			return 0;
}	
		
		public ArrayList<InfoBoardVO> MainListShow(String B_Local) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;		 
		    StringBuffer sb = new StringBuffer();	
		    ArrayList<InfoBoardVO> MainList = new ArrayList<>();
		   try {
			conn= getConnection();
			sb.append("select B_Title, B_Img1 ,B_boardnum");
			sb.append(" from BoardDB where B_Local=?  ORDER BY B_DATE DESC ");
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, B_Local);
			rs = pstmt.executeQuery();
			while(rs.next()){
				InfoBoardVO vo=new InfoBoardVO();
				vo.setB_Title(rs.getString(1));
				vo.setB_Img1(rs.getString(2));
				vo.setb_Boardnum(rs.getInt(3));
				MainList.add(vo);
				System.out.println(rs.getString(2));
			}
			
	   
		} catch (Exception e) {
			e.printStackTrace();
		}
		   if (rs!=null) {
			   CloseUtil.close(rs);
		   }if (pstmt!=null) {
			   CloseUtil.close(pstmt);
		   }if (conn!=null) {
			   CloseUtil.close(conn);;
		   }
		
		   
		   return MainList;
		}
		public ArrayList<InfoReplyBoardVO> ReplyList(String B_boardnum){
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;		 
		    StringBuffer sb = new StringBuffer();	
		    ArrayList<InfoReplyBoardVO> ReplyList = new ArrayList<>();
			
		 try {
			 conn= getConnection();
			sb.append("select R_BoardNum, R_content, R_Date, R_UserID, R_Password");
			sb.append(" FROM REPLYDB WHERE B_BOARDNUM=? ORDER BY R_Date DESC");
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, Integer.parseInt(B_boardnum));
			rs = pstmt.executeQuery();
			while(rs.next()){
				InfoReplyBoardVO vo=new InfoReplyBoardVO();
				
				vo.setR_BoardNum(rs.getInt(1));
				vo.setR_content(rs.getString(2));
				vo.setR_Date(rs.getTimestamp(3));
				vo.setR_UserID(rs.getString(4));
				vo.setR_Password(rs.getString(5));
				ReplyList.add(vo);
				System.out.println(rs.getString(2));
			}//while end
				
		} catch (Exception e) {
			e.printStackTrace();
		}if (rs!=null) {
			   CloseUtil.close(rs);
		   }if (pstmt!=null) {
			   CloseUtil.close(pstmt);
		   }if (conn!=null) {
			   CloseUtil.close(conn);;
		   }
		    return ReplyList;
		 
		}
		
}
