package com.guestbee.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.guestbee.admin.model.SignupDAO;
import com.guestbee.common.Action;
import com.guestbee.common.ActionForward;

public class AdminLoginProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		System.out.println("adminloginproaction.java 진입");
		System.out.println(id);
		System.out.println(pwd);
		
		SignupDAO dao = SignupDAO.getInstance();
		
		boolean result = dao.loginCheck(id, pwd);
		
		if(result){
			request.setAttribute("check", true);
			session.setAttribute("sessionId", id);
			session.setAttribute("SessionPw", pwd);
			forward.setNextPath("AdminUpdateForm.do");
		}else{
			request.setAttribute("check", false);
			forward.setNextPath("AdminLoginForm.do");
		}
		
		return forward;
	}

}
