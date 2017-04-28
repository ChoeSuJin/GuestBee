package com.guestbee.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.guestbee.common.Action;
import com.guestbee.common.ActionForward;
import com.guestbee.member.model.MemberBean;
import com.guestbee.member.model.MemberDAO;

/** 
 *  ȸ������ ����ȭ�鿡 ���� ȸ�������� ����ϴ� Action Ŭ����
 */
public class MemberModifyFormAction implements Action
{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		
		// ������ �������ִ� �α����� ID ������ �����´�
		HttpSession session = request.getSession();
		String id = session.getAttribute("sessionID").toString();
		
		// ������ ȸ�������� �����´�.
		MemberDAO dao = MemberDAO.getInstance();
		MemberBean member = dao.getUserInfo(id);
		
		// ModifyFrom.jsp�� ȸ�������� �����ϱ� ���� request�� MemberBean�� �����Ѵ�.
		request.setAttribute("memberInfo", member);
		
		forward.setRedirect(false);
		forward.setNextPath("ModifyForm.do");
		
		return forward;
	}
}
