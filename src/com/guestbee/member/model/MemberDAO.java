package com.guestbee.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;
import java.sql.Date;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 * JSP_MEMBER ���̺�� ������ DAO�� ȸ�� �����͸� ó���ϴ� Ŭ�����̴�. <br>
 * <br>
 * Data Access Object - ���̺� �� �Ѱ��� DAO�� �ۼ��Ѵ�.
 */
public class MemberDAO {
	public Connection getConnection() throws Exception {

		Context ctx = new InitialContext();
		Context env = (Context) ctx.lookup("java:comp/env");
		DataSource ds = (DataSource) env.lookup("jdbc:GuestBeeDB");

		return ds.getConnection();

	}

	private static MemberDAO instance;

	// �̱��� ����
	private MemberDAO() {
	}

	public static MemberDAO getInstance() {
		if (instance == null)
			instance = new MemberDAO();
		return instance;
	}

	/**
	 * String -> java.sql.Date�� �����ϴ� �޼���
	 * 
	 * <pre>
	 * ���ڿ��ε� ��������� Date�� �����ϱ� ���� �ʿ��ϴ�.
	 * java.util.DateŬ�����δ� ����Ŭ�� Date���İ� ������ �� ����.
	 * Oracle�� date���İ� �����Ǵ� java�� Date�� java.sql.Date Ŭ�����̴�.
	 * </pre>
	 * 
	 * @param member
	 *            ȸ�������� ����ִ� TO
	 * @return java.sql.Date
	 */
	/*
	 * public Date stringToDate(MemberBean member) { String year =
	 * member.getBirthyy(); String month = member.getBirthmm(); String day =
	 * member.getBirthdd();
	 * 
	 * Date birthday = null;
	 * 
	 * if(year != null && month != null && day != null) birthday =
	 * Date.valueOf(year+"-"+month+"-"+day);
	 * 
	 * return birthday;
	 * 
	 * } // end stringToDate()
	 */

	/**
	 * ȸ�������� JSP_MEMBER ���̺� �����ϴ� �޼���
	 * 
	 * @param member
	 *            ������ ȸ�������� ����ִ� TO
	 * @throws Exception
	 */
	public void insertMember(MemberBean member) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			// Ŀ�ؼ��� �����´�.
			conn = getConnection();

			// �ڵ� Ŀ���� false�� �Ѵ�.
			conn.setAutoCommit(false);

			// ���� �����Ѵ�.
			// �������� ��� �ڵ����� ���õǰ� �ϱ� ���� sysdate�� ���
			StringBuffer sql = new StringBuffer();
			sql.append("insert into userdb values");
			sql.append("(?, ?, ?, ?, ?, ?, ?, ?)");
			// stringToDate(member);
			/*
			 * StringBuffer�� ��� ���� �������� toString()�޼��带 �̿��ؾ� �Ѵ�.
			 */
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, member.getU_id());
			pstmt.setString(2, member.getU_password());
			pstmt.setString(3, member.getU_name());
			pstmt.setString(4, member.getU_phone());
			pstmt.setString(5, member.getU_msgID());
			/* pstmt.setDate(5, stringToDate(member)); *//*
															 * pstmt.setString(
															 * 6,
															 * member.getMail1()
															 * +"@"+member.
															 * getMail2());
															 */
			pstmt.setString(6, member.getU_email());
			pstmt.setString(7, member.getU_birth());
			pstmt.setString(8, member.getU_gender());

			// ���� ����
			pstmt.executeUpdate();
			// �Ϸ�� Ŀ��
			conn.commit();

		} catch (ClassNotFoundException | NamingException | SQLException sqle) {
			// ������ �ѹ�
			conn.rollback();
			throw new RuntimeException(sqle.getMessage());
		} finally {
			// Connection, PreparedStatement�� �ݴ´�.
			try {
				if (pstmt != null) {
					pstmt.close();
					pstmt = null;
				}
				if (conn != null) {
					conn.close();
					conn = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	} // end insertMember()

	/*	*//**
			 * ���̵� �̿��� ���� ȸ�������� �����´�.
			 * 
			 * @param id
			 *            ȸ�� ���̵�
			 * @return MemberBean
			 */
	public MemberBean getUserInfo(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberBean member = null;

		try {
			// ����
			StringBuffer query = new StringBuffer();
			query.append("SELECT * FROM USERDB WHERE U_ID=?");

			conn = getConnection();
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) // ȸ�������� DTO�� ��´�.
			{

				// DB�� ����������� -> ��, ��, �Ϸ� ���ڿ� �ڸ���.
				/*
				 * String u_birth = rs.getDate("birth").toString(); String year
				 * = birthday.substring(0, 4); String month =
				 * birthday.substring(5, 7); String day = birthday.substring(8,
				 * 10);
				 * 
				 * // �̸����� @ �������� �ڸ���. String mail =
				 * rs.getString("mail"); int idx = mail.indexOf("@"); String
				 * mail1 = mail.substring(0, idx); String mail2 =
				 * mail.substring(idx+1);
				 */

				// �ڹٺ� ������ ��´�.
				member = new MemberBean();
				member.setU_id(rs.getString("u_id"));
				member.setU_password(rs.getString("u_password"));
				member.setU_name(rs.getString("u_name"));
				member.setU_phone(rs.getString("u_phone"));
				member.setU_msgID(rs.getString("u_msgID"));
				member.setU_email(rs.getString("u_email"));
				member.setU_birth(rs.getString("u_birth"));
				member.setU_gender(rs.getString("u_gender"));

				/*
				 * member.setId(rs.getString("id"));
				 * member.setPassword(rs.getString("password"));
				 * member.setName(rs.getString("name"));
				 * member.setGender(rs.getString("gender"));
				 * member.setBirthyy(year); member.setBirthmm(month);
				 * member.setBirthdd(day); member.setMail1(mail1);
				 * member.setMail2(mail2);
				 * member.setPhone(rs.getString("phone"));
				 * member.setAddress(rs.getString("address"));
				 * member.setReg(rs.getTimestamp("reg"));
				 */
			}

			return member;

		} catch (Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
		} finally {
			// Connection, PreparedStatement�� �ݴ´�.
			try {
				if (pstmt != null) {
					pstmt.close();
					pstmt = null;
				}
				if (conn != null) {
					conn.close();
					conn = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	} // end getUserInfo

	/*	*//**
			 * ȸ�������� �����Ѵ�.
			 * 
			 * @param member
			 *            ������ ȸ�������� ����ִ� TO
			 * @throws SQLException
			 */
	/*
	 * public void updateMember(MemberBean member) throws SQLException{
	 * 
	 * Connection conn = null; PreparedStatement pstmt = null;
	 * 
	 * try {
	 * 
	 * StringBuffer query = new StringBuffer(); query.append("UPDATE USERDB SET"
	 * ); query.append(" u_password=?, u_phone=?, u_msgID=?, u_email=?");
	 * query.append(" WHERE u_id=?");
	 * 
	 * conn = DBConnection.getConnection(); pstmt =
	 * conn.prepareStatement(query.toString());
	 * 
	 * // �ڵ� Ŀ���� false�� �Ѵ�. conn.setAutoCommit(false);
	 * 
	 * pstmt.setString(1, member.getU_password()); pstmt.setString(2,
	 * member.getU_phone()); pstmt.setString(3, member.getU_msgID());
	 * pstmt.setString(4, member.getU_email()); pstmt.setString(5,
	 * member.getU_id());
	 * 
	 * 
	 * 
	 * pstmt.executeUpdate(); // �Ϸ�� Ŀ�� conn.commit();
	 * 
	 * } catch (Exception sqle) { conn.rollback(); // ������ �ѹ� throw new
	 * RuntimeException(sqle.getMessage()); } finally { try{ if ( pstmt != null
	 * ){ pstmt.close(); pstmt=null; } if ( conn != null ){ conn.close();
	 * conn=null; } }catch(Exception e){ throw new
	 * RuntimeException(e.getMessage()); } } } // end updateMember
	 */

	public int updateMember(MemberBean member) throws SQLException {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs;

		int x = -1;

		try {

			StringBuffer query = new StringBuffer();
			query.append("UPDATE USERDB SET");
			query.append(" u_password=?, u_phone=?, u_msgID=?, u_email=?");
			query.append(" WHERE u_id=?");

			conn = getConnection();
			pstmt = conn.prepareStatement(query.toString());

			// �ڵ� Ŀ���� false�� �Ѵ�.
			conn.setAutoCommit(false);

			pstmt.setString(1, member.getU_password());
			pstmt.setString(2, member.getU_phone());
			pstmt.setString(3, member.getU_msgID());
			pstmt.setString(4, member.getU_email());
			pstmt.setString(5, member.getU_id());

			rs = pstmt.executeQuery();
			// �Ϸ�� Ŀ��
			conn.commit();

			if (rs.next()) {
				x = 1;
			} else {
				x = 0;
			}

			return x;

		} catch (Exception sqle) {
			conn.rollback(); // ������ �ѹ�
			throw new RuntimeException(sqle.getMessage());
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
					pstmt = null;
				}
				if (conn != null) {
					conn.close();
					conn = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	} // end updateMember

	/**
	 * ȸ�������� �����Ѵ�.
	 * 
	 * @param id
	 *            ȸ������ ���� �� �ʿ��� ���̵�
	 * @param pw
	 *            ȸ������ ���� �� �ʿ��� ��й�ȣ
	 * @return x : deleteMember() ���� �� �����
	 */
	@SuppressWarnings("resource")
	public int deleteMember(String id, String pw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String dbpw = ""; // DB���� ��й�ȣ�� ��Ƶ� ����
		int x = -1;

		try {
			// ��й�ȣ ��ȸ
			StringBuffer query1 = new StringBuffer();
			query1.append("SELECT u_PASSWORD FROM userdb WHERE U_ID=?"); // 로그인
																			// 한
																			// 아이디의
																			// pw값
																			// 찾기

			// ȸ�� ����
			StringBuffer query2 = new StringBuffer();
			query2.append("DELETE FROM userdb WHERE U_ID=?"); // db에서 삭제하기
																// (회원탈퇴)

			conn = getConnection();

			// �ڵ� Ŀ���� false�� �Ѵ�.
			conn.setAutoCommit(false);

			// 1. ���̵� �ش��ϴ� ��й�ȣ�� ��ȸ�Ѵ�.
			pstmt = conn.prepareStatement(query1.toString());
			pstmt.setString(1, id); // session 에 있는 id값
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dbpw = rs.getString("u_password");
				if (dbpw.equals(pw)) // �Էµ� ��й�ȣ�� DB��� ��
				{
					// ������� ȸ������ ����
					pstmt = conn.prepareStatement(query2.toString());
					pstmt.setString(1, id);
					pstmt.executeUpdate();
					conn.commit();
					x = 1; // ���� ����
				} else {
					x = 0; // ��й�ȣ �񱳰�� - �ٸ�
				}
			}

			return x;

		} catch (Exception sqle) {
			try {
				conn.rollback(); // ������ �ѹ�
			} catch (SQLException e) {
				e.printStackTrace();
			}
			throw new RuntimeException(sqle.getMessage());
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
					pstmt = null;
				}
				if (conn != null) {
					conn.close();
					conn = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	} // end deleteMember

	/**
	 * �α��ν� ���̵�, ��й�ȣ üũ �޼���
	 * 
	 * @param id
	 *            �α����� ���̵�
	 * @param pw
	 *            ��й�ȣ
	 * @return x : loginCheck() ���� �� �����
	 */
	public int loginCheck(String id, String pw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String dbPW = ""; // db���� ���� ��й�ȣ�� ���� ����
		int x = -1;

		try {
			// ���� - ���� �Էµ� ���̵�� DB���� ��й�ȣ�� ��ȸ�Ѵ�.
			StringBuffer query = new StringBuffer();
			query.append("SELECT U_PASSWORD FROM USERDB WHERE U_ID=?"); /// ..........................................

			conn = getConnection();
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) // �Է��� ���̵� �ش��ϴ� ��� �������
			{
				dbPW = rs.getString("u_password"); // ����� ������ �ִ´�.

				if (dbPW.equals(pw))
					x = 1; // �Ѱܹ��� ����� ������ ��� ��. ������ ��������
				else
					x = 0; // DB�� ��й�ȣ�� �Է¹��� ��й�ȣ �ٸ�, ��������

			} else {
				x = -1; // �ش� ���̵� ���� ���
			}

			return x;

		} catch (Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
					pstmt = null;
				}
				if (conn != null) {
					conn.close();
					conn = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	} // end loginCheck()

	public int findPW(String id) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = 0;

		try {
			// 1. 입력받은 아이디로 비밀번호를 가져온다
			String sql = "select u_password from userdb where u_id=?";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = 1;// 아이디 있음.

				// 랜덤 비밀번호 설정
				Random rnd = new Random();
				StringBuffer m_pw = new StringBuffer();
				for (int i = 0; i < 12; i++) {
					m_pw.append((char) ((int) (rnd.nextInt(26)) + 97));
				}

				String sql2 = "update member_info set m_pw=? where m_id=?";

				pstmt = conn.prepareStatement(sql2);
				pstmt.setString(1, m_pw.toString());
				pstmt.setString(2, id);
				pstmt.executeUpdate();
				System.out.println("업데이트 완료");

				// 여기까지 성공!

			} else
				x = 0;// 아이디 없음.

			return x;

		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}

		} // finally end
	}// 비밀번호 찾기

	public boolean CheckId(String id) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean x = false;

		try {

			String sql = "select u_id from userdb where u_id=?";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) // 해당하는 아이디가 있을경우
			{
				x = true; // 아이디 사용불가
			} else {
				x = false; // 아이디 사용가능
			}

			return x;

		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} // finally end
	}// 아이디 중복체크
	
	
	public ArrayList<ReservationInfoBean> BookingInfo(String id) throws SQLException{
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;

		try {
			
			String query = "select ri_Date, ri_UserID, ri_ID, ri_num, ri_name, ri_local, ri_price, ri_people  from ReservationInformationDB where ri_UserID = ?";
			
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,id);
			
			rs = pstmt.executeQuery();
			// 
			conn.setAutoCommit(false);
			
			//rs = pstmt.executeQuery(query);
			
			//conn.commit(); 
			
			ReservationInfoBean rb = null;
			ArrayList<ReservationInfoBean> list = new ArrayList<ReservationInfoBean>();
			
			while(rs.next()){
				
				 /////........................ArrayList로 담아서 
				rb = new ReservationInfoBean();
			
				rb.setRi_id(rs.getString("ri_id"));
				rb.setRi_date(rs.getString("ri_date"));
				rb.setRi_price(rs.getString("ri_price"));
				rb.setRi_people(rs.getString("ri_people"));
				rb.setRi_userID(rs.getString("ri_userID"));
				rb.setRi_num(rs.getString("ri_num"));
				rb.setRi_name(rs.getString("ri_name"));
				rb.setRi_local(rs.getString("ri_local"));
				
			
				list.add(rb);
				System.out.println("list 저장함");
			}

			return list; //................ArrayList를 return 하기 
		
		} catch (Exception sqle) {
			conn.rollback(); // 
			throw new RuntimeException(sqle.getMessage());
		} finally {
			try{
				if ( pstmt != null ){ pstmt.close(); pstmt=null; }
				if ( conn != null ){ conn.close(); conn=null;	}
			}catch(Exception e){
				throw new RuntimeException(e.getMessage());
			}
		}
	} // end updateMember

}
