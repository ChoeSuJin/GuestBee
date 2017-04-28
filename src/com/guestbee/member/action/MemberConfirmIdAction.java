package com.guestbee.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.guestbee.member.model.MemberDAO;
import com.guestbee.common.Action;
import com.guestbee.common.ActionForward;
import com.guestbee.member.model.MemberBean;

public class MemberConfirmIdAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();
		MemberDAO dao = MemberDAO.getInstance();
		

		MemberBean vo = new MemberBean();
		vo.setU_id(request.getParameter("id")); //m_id가 아니라 id인 이유,,,자바스크립트에서 ?id=""로 설정해줘서 그런가?
		
		
		
		boolean x = dao.CheckId(vo.getU_id()); // true 면 id가있음, false id가 없음

		request.setAttribute("checkid", x);		
		forward.setRedirect(false);
		forward.setNextPath("member/confirmId.jsp");
		//가입성공 메세지를 세션에 담는다.
		
		return forward;
	}

	
}
