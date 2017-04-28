package com.guestbee.info.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.guestbee.common.Action;
import com.guestbee.common.ActionForward;
import com.guestbee.info.model.InfoBoardDAO;
import com.guestbee.info.model.InfoBoardVO;
import com.guestbee.info.model.InfoReplyBoardVO;

public class DetailViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		
		String DetailList=request.getParameter("DetailList");	
		
		//System.out.println("�޾ƿ� ��:"+DetailList);
		InfoBoardDAO dao=InfoBoardDAO.getInstance();
		InfoBoardVO DetailView = dao.DetailView(DetailList);
		
		
		 ArrayList<InfoReplyBoardVO> ReplyList = dao.ReplyList(DetailList);
		 request.setAttribute("ReplyList", ReplyList);
		
		request.setAttribute("DetailList", DetailView);
		
		request.setAttribute("contentNum",DetailList );
		
		forward.setNextPath("/info/Infomation1.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
