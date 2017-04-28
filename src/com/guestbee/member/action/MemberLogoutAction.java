package com.guestbee.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.guestbee.common.Action;
import com.guestbee.common.ActionForward;

/**
 *  �α׾ƿ� �۾��� ó���ϴ� Action Ŭ����
 */
public class MemberLogoutAction implements Action
{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		
		// �α׾ƿ��� ���������� ��� �����Ѵ�.
		request.getSession().invalidate();
		
		// �α׾ƿ� �� ����ȭ������ ���ư���.
		forward.setRedirect(true);
		forward.setNextPath("Main.do");
		
		return forward;
	}
}
