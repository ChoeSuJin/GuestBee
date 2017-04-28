package com.guestbee.matching.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import javax.naming.NamingException;

import com.guestbee.matching.util.DBConnection;

import dbconn.util.ConnectionUtil;


public class BoardDAO 
{
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private static BoardDAO instance;
	
	private BoardDAO(){}
	public static BoardDAO getInstance(){
		if(instance==null)
			instance=new BoardDAO();
		return instance;
	}
	
	// 시퀀스를 가져온다---------------------------------------------------------------------------------------
	public int getSeq()
	{
		int result = 1;
		
		try {
			conn = DBConnection.getConnection();
			
			// // 시퀀스 값을 가져온다. (DUAL : 시퀀스 값을 가져오기위한 임시 테이블)
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT BOARD_NUM.NEXTVAL FROM DUAL");
			
			pstmt = conn.prepareStatement(sql.toString());
			// 쿼리 실행
			rs = pstmt.executeQuery();
			
			if(rs.next())	result = rs.getInt(1);

		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
		
		close();
		return result;	
	} // end getSeq
	
	// 글 삽입---------------------------------------------------------------------------------------
	public boolean boardInsert(BoardBean board)
	{
		boolean result = false;
		
		try {
			
			//conn = ConnectionUtil.getConnection(null);
			conn = DBConnection.getConnection();
			
			//자동 커밋을 false로 한다.
			StringBuffer sql = new StringBuffer();
			sql.append("INSERT INTO MEMBER_BOARD");
			sql.append("(BOARD_NUM, BOARD_ID, BOARD_SUBJECT, BOARD_SUBTITLE, BOARD_LOCAL, BOARD_PURPOSE,");
			sql.append(" BOARD_CONTENT, BOARD_COURSE, BOARD_PLACE, BOARD_NOTED, BOARD_FILE");
			sql.append(", BOARD_RE_REF, BOARD_RE_LEV, BOARD_RE_SEQ, BOARD_COUNT, BOARD_DATE)");
			sql.append(" VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate)");

			// 시퀀스 값을 글번호와 그룹번호로 사용
			int num = board.getBoard_num();
		
			//추후 내용 수정-------------------------------------------------------------------------
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, num);
			pstmt.setString(2, board.getBoard_id());
			pstmt.setString(3, board.getBoard_subject());
			pstmt.setString(4, board.getBoard_subtitle());
			pstmt.setString(5, board.getBoard_local());		//지역코드
			pstmt.setString(6, board.getBoard_purpose());
			pstmt.setString(7, board.getBoard_content());
			pstmt.setString(8, board.getBoard_course());
			pstmt.setString(9, board.getBoard_place());
			pstmt.setString(10, board.getBoard_noted());
			pstmt.setString(11, board.getBoard_file());
			pstmt.setInt(12, num);
			pstmt.setInt(13, 0);
			pstmt.setInt(14, 0);
			pstmt.setInt(15, 0);
			
			int flag = pstmt.executeUpdate();
			if(flag > 0){
				result = true;
				// 완료시 커밋
				conn.commit();
			}
			
		} catch (Exception e) {
			try{
				conn.rollback();
			}catch(SQLException sqle){
				throw new RuntimeException(e.getMessage());
			}
			
		}
		close();
		return result;	
	} // end boardInsert();
	
	// 글목록 가져오기---------------------------------------------------------------------------------------
    public ArrayList<BoardBean> getBoardList(HashMap<String, Object> listOpt)
    {
        ArrayList<BoardBean> list = new ArrayList<BoardBean>();
        
        String opt = (String)listOpt.get("opt"); // 검색옵션(제목, 내용, 글쓴이 등..)
        String condition = (String)listOpt.get("condition"); // 검색내용
        int start = (Integer)listOpt.get("start"); // 현재 페이지번호
        
        try {
            conn = DBConnection.getConnection();
            StringBuffer sql = new StringBuffer();
            
            // 글목록 전체를 보여줄 때-----------------------------------------------------------------------------------
            if(opt == null)
            {
                // BOARD_RE_REF(그룹번호)의 내림차순 정렬 후 동일한 그룹번호일 때는
                // BOARD_RE_SEQ(답변글 순서)의 오름차순으로 정렬 한 후에
                // 10개의 글을 한 화면에 보여주는(start번째 부터 start+9까지) 쿼리
                // desc : 내림차순, asc : 오름차순 ( 생략 가능 )
                sql.append("select * from ");
                sql.append("(select rownum rnum, BOARD_NUM, BOARD_ID, BOARD_SUBJECT");
                sql.append(", BOARD_CONTENT, BOARD_FILE, BOARD_COUNT, BOARD_RE_REF");
                sql.append(", BOARD_RE_LEV, BOARD_RE_SEQ, BOARD_DATE ");
                sql.append("FROM");
                sql.append(" (select * from MEMBER_BOARD order by BOARD_RE_REF desc, BOARD_RE_SEQ asc)) ");
                sql.append("where rnum>=? and rnum<=?");
                
                pstmt = conn.prepareStatement(sql.toString());
                pstmt.setInt(1, start);
                pstmt.setInt(2, start+11);
                
                // StringBuffer를 비운다.
                sql.delete(0, sql.toString().length());
            }
            // 제목으로 검색-----------------------------------------------------------------------------------
            else if(opt.equals("0"))
            {
                sql.append("select * from ");
                sql.append("(select rownum rnum, BOARD_NUM, BOARD_ID, BOARD_SUBJECT");
                sql.append(", BOARD_CONTENT, BOARD_FILE, BOARD_DATE, BOARD_COUNT");
                sql.append(", BOARD_RE_REF, BOARD_RE_LEV, BOARD_RE_SEQ ");
                sql.append("FROM ");
                sql.append("(select * from MEMBER_BOARD where BOARD_SUBJECT like ? ");
                sql.append("order BY BOARD_RE_REF desc, BOARD_RE_SEQ asc)) ");
                sql.append("where rnum>=? and rnum<=?");
                
                pstmt = conn.prepareStatement(sql.toString());
                pstmt.setString(1, "%"+condition+"%");
                pstmt.setInt(2, start);
                pstmt.setInt(3, start+11);
                
                sql.delete(0, sql.toString().length());
            }
            else if(opt.equals("1")) // 내용으로 검색
            {
                sql.append("select * from ");
                sql.append("(select rownum rnum, BOARD_NUM, BOARD_ID, BOARD_SUBJECT");
                sql.append(", BOARD_CONTENT, BOARD_FILE, BOARD_DATE, BOARD_COUNT");
                sql.append(", BOARD_RE_REF, BOARD_RE_LEV, BOARD_RE_SEQ ");
                sql.append("FROM ");
                sql.append("(select * from MEMBER_BOARD where BOARD_CONTENT like ? ");
                sql.append("order BY BOARD_RE_REF desc, BOARD_RE_SEQ asc)) ");
                sql.append("where rnum>=? and rnum<=?");
                
                pstmt = conn.prepareStatement(sql.toString());
                pstmt.setString(1, "%"+condition+"%");
                pstmt.setInt(2, start);
                pstmt.setInt(3, start+11);
                
                sql.delete(0, sql.toString().length());
            }
            // 제목+내용으로 검색-----------------------------------------------------------------------------------
            else if(opt.equals("2"))
            {
                sql.append("select * from ");
                sql.append("(select rownum rnum, BOARD_NUM, BOARD_ID, BOARD_SUBJECT");
                sql.append(", BOARD_CONTENT, BOARD_FILE, BOARD_DATE, BOARD_COUNT");
                sql.append(", BOARD_RE_REF, BOARD_RE_LEV, BOARD_RE_SEQ ");
                sql.append("FROM ");
                sql.append("(select * from MEMBER_BOARD where BOARD_SUBJECT like ? OR BOARD_CONTENT like ? ");
                sql.append("order BY BOARD_RE_REF desc, BOARD_RE_SEQ asc)) ");
                sql.append("where rnum>=? and rnum<=?");
                
                pstmt = conn.prepareStatement(sql.toString());
                pstmt.setString(1, "%"+condition+"%");
                pstmt.setString(2, "%"+condition+"%");
                pstmt.setInt(3, start);
                pstmt.setInt(4, start+11);
                
                sql.delete(0, sql.toString().length());
            }
         // 글쓴이로 검색-----------------------------------------------------------------------------------
            else if(opt.equals("3")) 
            {
                sql.append("select * from ");
                sql.append("(select rownum rnum, BOARD_NUM, BOARD_ID, BOARD_SUBJECT");
                sql.append(", BOARD_CONTENT, BOARD_FILE, BOARD_DATE, BOARD_COUNT");
                sql.append(", BOARD_RE_REF, BOARD_RE_LEV, BOARD_RE_SEQ ");
                sql.append("FROM ");
                sql.append("(select * from MEMBER_BOARD where BOARD_ID like ? ");
                sql.append("order BY BOARD_RE_REF desc, BOARD_RE_SEQ asc)) ");
                sql.append("where rnum>=? and rnum<=?");
                
                pstmt = conn.prepareStatement(sql.toString());
                pstmt.setString(1, "%"+condition+"%");
                pstmt.setInt(2, start);
                pstmt.setInt(3, start+11);
                
                sql.delete(0, sql.toString().length());
            }
            
            rs = pstmt.executeQuery();
            while(rs.next())
            {
                BoardBean board = new BoardBean();
                board.setBoard_num(rs.getInt("BOARD_NUM"));
                board.setBoard_id(rs.getString("BOARD_ID"));
                board.setBoard_subject(rs.getString("BOARD_SUBJECT"));
                board.setBoard_content(rs.getString("BOARD_CONTENT"));
                board.setBoard_file(rs.getString("BOARD_FILE"));
                board.setBoard_count(rs.getInt("BOARD_COUNT"));
                board.setBoard_re_ref(rs.getInt("BOARD_RE_REF"));
                board.setBoard_re_lev(rs.getInt("BOARD_RE_LEV"));
                board.setBoard_re_seq(rs.getInt("BOARD_RE_SEQ"));
                board.setBoard_date(rs.getDate("BOARD_DATE"));
                list.add(board);
            }
            
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        }
        
        close();
        return list;
    } // end getBoardList
    
    // 글의 개수를 가져오는 메서드-----------------------------------------------------------
    public int getBoardListCount(HashMap<String, Object> listOpt)
    {
        int result = 0;
        String opt = (String)listOpt.get("opt"); // 검색옵션(제목, 내용, 글쓴이 등..)
        String condition = (String)listOpt.get("condition"); // 검색내용
        
        try {
            conn = DBConnection.getConnection();
            StringBuffer sql = new StringBuffer();
            
            if(opt == null)    // 전체글의 개수
            {
                sql.append("select count(*) from MEMBER_BOARD");
                pstmt = conn.prepareStatement(sql.toString());
                
                // StringBuffer를 비운다.
                sql.delete(0, sql.toString().length());
            }
            else if(opt.equals("0")) // 제목으로 검색한 글의 개수
            {
                sql.append("select count(*) from MEMBER_BOARD where BOARD_SUBJECT like ?");
                pstmt = conn.prepareStatement(sql.toString());
                pstmt.setString(1, '%'+condition+'%');
                
                sql.delete(0, sql.toString().length());
            }
            else if(opt.equals("1")) // 내용으로 검색한 글의 개수
            {
                sql.append("select count(*) from MEMBER_BOARD where BOARD_CONTENT like ?");
                pstmt = conn.prepareStatement(sql.toString());
                pstmt.setString(1, '%'+condition+'%');
                
                sql.delete(0, sql.toString().length());
            }
            else if(opt.equals("2")) // 제목+내용으로 검색한 글의 개수
            {
                sql.append("select count(*) from MEMBER_BOARD ");
                sql.append("where BOARD_SUBJECT like ? or BOARD_CONTENT like ?");
                pstmt = conn.prepareStatement(sql.toString());
                pstmt.setString(1, '%'+condition+'%');
                pstmt.setString(2, '%'+condition+'%');
                
                sql.delete(0, sql.toString().length());
            }
            else if(opt.equals("3")) // 글쓴이로 검색한 글의 개수
            {
                sql.append("select count(*) from MEMBER_BOARD where BOARD_ID like ?");
                pstmt = conn.prepareStatement(sql.toString());
                pstmt.setString(1, '%'+condition+'%');
                
                sql.delete(0, sql.toString().length());
            }
            
            rs = pstmt.executeQuery();
            if(rs.next())    result = rs.getInt(1);
            
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        }
        
        close();
        return result;
    } // end getBoardListCount

    //상세보기---------------------------------------------------------------
    public BoardBean getDetail(int boardNum)
    {    
        BoardBean board = null;
        
        try {
            conn = DBConnection.getConnection();
            
            StringBuffer sql = new StringBuffer();
            sql.append("select * from MEMBER_BOARD where BOARD_NUM = ?");
            
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setInt(1, boardNum);
            
            rs = pstmt.executeQuery();
            if(rs.next())
            {
                board = new BoardBean();
                board.setBoard_num(boardNum);
                board.setBoard_id(rs.getString("BOARD_ID"));
                board.setBoard_subject(rs.getString("BOARD_SUBJECT"));
                board.setBoard_subtitle(rs.getString("BOARD_SUBTITLE"));
                board.setBoard_purpose(rs.getString("BOARD_PURPOSE"));
                board.setBoard_content(rs.getString("BOARD_CONTENT"));
                board.setBoard_course(rs.getString("BOARD_COURSE"));
                board.setBoard_place(rs.getString("BOARD_PLACE"));
                board.setBoard_noted(rs.getString("BOARD_NOTED"));
                board.setBoard_file(rs.getString("BOARD_FILE"));
                board.setBoard_count(rs.getInt("BOARD_COUNT"));
                board.setBoard_re_ref(rs.getInt("BOARD_RE_REF"));
                board.setBoard_re_lev(rs.getInt("BOARD_RE_LEV"));
                board.setBoard_re_seq(rs.getInt("BOARD_RE_SEQ"));
                board.setBoard_date(rs.getDate("BOARD_DATE"));
            }
            
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        }
        
        close();
        return board;
    } // end getDetail()
    
    // 조회수 증가-------------------------------------------------------------------
    public boolean updateCount(int boardNum)
    {
        boolean result = false;
        
        try {
            conn = DBConnection.getConnection();
            
            StringBuffer sql = new StringBuffer();
            sql.append("update MEMBER_BOARD set BOARD_COUNT = BOARD_COUNT+1 ");
            sql.append("where BOARD_NUM = ?");
            
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setInt(1, boardNum);
            
            int flag = pstmt.executeUpdate();
            if(flag > 0){
                result = true;
                conn.commit(); // 완료시 커밋
            }    
        } catch (Exception e) {
            try {
                conn.rollback(); // 오류시 롤백
            } catch (SQLException sqle) {
                sqle.printStackTrace();
            }
            throw new RuntimeException(e.getMessage());
        }
        
        close();
        return result;
    } // end updateCount
    
    //
 // 삭제할 파일명을 가져온다. -------------------------------------------------
    public String getFileName(int boardNum)
    {
        String fileName = null;
        
        try {
            conn = DBConnection.getConnection();
            
            StringBuffer sql = new StringBuffer();
            sql.append("SELECT BOARD_FILE from MEMBER_BOARD where BOARD_NUM=?");
            
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setInt(1, boardNum);
            
            rs = pstmt.executeQuery();
            if(rs.next()) fileName = rs.getString("BOARD_FILE");
            
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        }
        
        close();
        return fileName;
    } // end getFileName
        
    // 게시글 삭제 ----------------------------------------------------------------
    public boolean deleteBoard(int boardNum) 
    {
        boolean result = false;
 
        try {
            conn = DBConnection.getConnection();
            conn.setAutoCommit(false); // 자동 커밋을 false로 한다.
 
            StringBuffer sql = new StringBuffer();
            sql.append("DELETE FROM MEMBER_BOARD");
            sql.append(" WHERE BOARD_NUM IN");
            sql.append(" (SELECT BOARD_NUM");
            sql.append(" FROM MEMBER_BOARD");
            sql.append(" START WITH BOARD_NUM = ?");
            sql.append(" CONNECT BY PRIOR BOARD_NUM = BOARD_PARENT) ");
            
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setInt(1, boardNum);
            
            int flag = pstmt.executeUpdate();
            if(flag > 0){
                result = true;
                conn.commit(); // 완료시 커밋
            }    
            
        } catch (Exception e) {
            try {
                conn.rollback(); // 오류시 롤백
            } catch (SQLException sqle) {
                sqle.printStackTrace();
            }
            throw new RuntimeException(e.getMessage());
        }
 
        close();
        return result;
    } // end deleteBoard
    
    //글 수정----------------------------------------------------------
    public boolean updateBoard(BoardBean border) 
    {
        boolean result = false;
        
        try{
            conn = DBConnection.getConnection();
            conn.setAutoCommit(false); // 자동 커밋을 false로 한다.
            
            StringBuffer sql = new StringBuffer();
            sql.append("UPDATE MEMBER_BOARD SET");
            sql.append(" BOARD_SUBJECT=?");
            sql.append(" ,BOARD_CONTENT=?");
            sql.append(" ,BOARD_FILE=?");
            sql.append(" ,BOARD_DATE=SYSDATE ");
            sql.append("WHERE BOARD_NUM=?");
 
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setString(1, border.getBoard_subject());
            pstmt.setString(2, border.getBoard_content());
            pstmt.setString(3, border.getBoard_file());
            pstmt.setInt(4, border.getBoard_num());
            
            int flag = pstmt.executeUpdate();
            if(flag > 0){
                result = true;
                conn.commit(); // 완료시 커밋
            }
            
        } catch (Exception e) {
            try {
                conn.rollback(); // 오류시 롤백
            } catch (SQLException sqle) {
                sqle.printStackTrace();
            }
            throw new RuntimeException(e.getMessage());
        }
    
        close();
        return result;
    } // end updateBoard

    //카테고리 -------------------------------------------------------------
    public ArrayList<BoardBean> boardCategory(String board_local) throws ClassNotFoundException, SQLException, NamingException
	{
    	
    	ArrayList<BoardBean> list = new ArrayList<BoardBean>();
    	
    	
		try {
			conn = DBConnection.getConnection();
			
			
			//자동 커밋을 false로 한다.
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT BOARD_NUM, BOARD_SUBJECT, BOARD_FILE FROM MEMBER_BOARD");
			sql.append(" WHERE BOARD_LOCAL = ?");
		
			//추후 내용 수정-------------------------------------------------------------------------
			pstmt = conn.prepareStatement(sql.toString());
			
			pstmt.setString(1, board_local);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				
				System.out.println("BoardCategory RS start");
				BoardBean vo = new BoardBean();
				vo.setBoard_num(rs.getInt(1));
				vo.setBoard_subject(rs.getString(2));
				vo.setBoard_file(rs.getString(3));
				System.out.println(rs.getInt(1));
				list.add(vo);
			}
		
			
		} catch (Exception e) {
			try{
				conn.rollback();
			}catch(SQLException sqle){
				throw new RuntimeException(e.getMessage());
			}
		}
		close();
		return list;	
	} // end boardCategory();
    
    public ArrayList<BoardBean> getTopBoardList() throws SQLException {
    	
    	Connection conn = ConnectionUtil.Connect();
    	StringBuffer sb = new StringBuffer();
    	sb.append("select * from MEMBER_BOARD order by board_count desc");
    	Statement stmt = conn.createStatement();
    	ResultSet rs = stmt.executeQuery(sb.toString());
    	
    	
    	ArrayList<BoardBean> list = new ArrayList<BoardBean>();
    	
    	while(rs.next()) {
    		System.out.println("getTopBoardList 출력 진입");
    		BoardBean vo = new BoardBean();
    		vo.setBoard_num(rs.getInt(1));
    		vo.setBoard_file(rs.getString("board_file"));
    		vo.setBoard_local(rs.getString("board_local"));
    		list.add(vo);
    	}
    	
    	return list;
    }
    
    
	// DB 자원해제----------------------------------------------------------
	private void close()
	{
		try {
			if ( pstmt != null ){ pstmt.close(); pstmt=null; }
			if ( conn != null ){ conn.close(); conn=null;	}
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
	} // end close()
	
	
	
}
