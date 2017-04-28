package com.guestbee.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.guestbee.common.Action;
import com.guestbee.common.ActionForward;
import com.guestbee.member.model.MemberBean;
import com.guestbee.member.model.MemberDAO;

public class MemberFindpwAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		String id = request.getParameter("u_id");
		MemberDAO dao = MemberDAO.getInstance();
		int check = dao.findPW(id);
		
		if(check == 0){
			//아이디 오류/로그인 실패시 메시지를 request에 담는다.
			request.setAttribute("fail","0");
			forward.setRedirect(false);
			forward.setNextPath("findpw.do");
		}
		else if(check == 1){
			//아이디가 있을경우 메일을 보낸다
			System.out.println("성공");
			forward.setRedirect(false);
			forward.setNextPath("/other/findpwPro.jsp");
			
		}
		
		return forward;
	}

}
