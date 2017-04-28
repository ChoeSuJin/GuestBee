package com.guestbee.info.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.guestbee.common.Action;
import com.guestbee.common.ActionForward;
import com.guestbee.info.model.InfoBoardDAO;
import com.guestbee.info.model.InfoBoardVO;

public class MainListViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");
		String Local=request.getParameter("Local");
		
		System.out.println("받아온로컬값:"+Local);
		InfoBoardDAO dao=InfoBoardDAO.getInstance();
		dao.MainListShow(Local);
		ArrayList<InfoBoardVO> MainList = dao.MainListShow(Local);
		
		request.setAttribute("list", MainList);
		
		
		forward.setRedirect(false);
		forward.setNextPath("/info/InfoMainView.jsp");
		return forward;
	}

}
