package com.guestbee.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.guestbee.common.Action;
import com.guestbee.common.ActionForward;

public class AdminLogoutAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		
		HttpSession session = request.getSession();
		
		session.invalidate();
		
		forward.setNextPath("Main.do");
		forward.setRedirect(true);
		return forward;
	}

}
