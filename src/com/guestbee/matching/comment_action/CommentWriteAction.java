package com.guestbee.matching.comment_action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.guestbee.matching.comment_model.CommentBean;
import com.guestbee.matching.comment_model.CommentDAO;
import com.guestbee.matching.common.Action;
import com.guestbee.matching.common.ActionForward;

public class CommentWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CommentDAO dao = CommentDAO.getInstance();
        CommentBean comment = new CommentBean();
        
        // 파리미터 값을 가져온다.
        int comment_board = Integer.parseInt(request.getParameter("comment_board"));
        String comment_id = request.getParameter("comment_id");
        String comment_content = request.getParameter("comment_content");
        
        comment.setComment_num(dao.getSeq());    // 댓글 번호는 시퀀스값으로
        comment.setComment_board(comment_board);
        comment.setComment_id(comment_id);
        comment.setComment_content(comment_content);
        
        boolean result = dao.insertComment(comment);
 
        if(result){
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.println("1");
            out.close();
        }
            
        return null;
    }
}

