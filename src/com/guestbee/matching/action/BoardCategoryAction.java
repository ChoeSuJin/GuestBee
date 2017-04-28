package com.guestbee.matching.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.guestbee.matching.common.Action;
import com.guestbee.matching.common.ActionForward;
import com.guestbee.matching.model.BoardBean;
import com.guestbee.matching.model.BoardDAO;

public class BoardCategoryAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		
		String local = request.getParameter("local");
		
		System.out.println(local + "되라고 이런~!!!!!!!!!");
		
		BoardDAO dao = BoardDAO.getInstance();
	    ArrayList<BoardBean> list = dao.boardCategory(local);
	      
	    request.setAttribute("list", list);
	
		forward.setRedirect(false);
		forward.setNextPath("BoardListForm.bo");
		
		/*수정 전
		ArrayList<BoardBean> list = new ArrayList<BoardBean>();		
		list = dao.boardCategory(local);
		
		request.setAttribute("list", list);
		forward.setRedirect(false);
		forward.setNextPath("/BoardListForm.jsp");*/
		
		return forward;
	}

}
