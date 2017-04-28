package com.guestbee.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.guestbee.admin.model.SignupDAO;
import com.guestbee.admin.model.SignupVO;
import com.guestbee.common.Action;
import com.guestbee.common.ActionForward;

public class AdminUpdateFormAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("sessionId");
		SignupDAO dao = SignupDAO.getInstance();
		SignupVO dto = dao.getInform1(id);
		
		request.setAttribute("vo", dto);
		
		forward.setNextPath("/admin/updateform.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
