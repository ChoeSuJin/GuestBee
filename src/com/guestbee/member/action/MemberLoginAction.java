package com.guestbee.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.guestbee.common.Action;
import com.guestbee.common.ActionForward;
import com.guestbee.member.model.MemberDAO;

/**
 * �α��� �۾��� ó���ϴ� Action Ŭ����
 */
public class MemberLoginAction implements Action
{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		HttpSession session=request.getSession();
		
		// ���̵�� ��й�ȣ�� �����´�.
		String id = request.getParameter("u_id");
		String password = request.getParameter("u_password");
		
		// DB���� ���̵�, ��й�ȣ Ȯ��
		MemberDAO dao = MemberDAO.getInstance();
		int check = dao.loginCheck(id, password);
		
		if(check == 0)	// ��й�ȣ Ʋ����� -> �ٽ� �α��� ȭ������ �̵�
		{ 
			// �α��� ���н� �޽����� request�� ��´�.
	   		request.setAttribute("fail", "0");
	   		
	   		forward.setRedirect(false);
	   		forward.setNextPath("/member/jsp/LoginForm.jsp"); //......................................................
		}
		else if(check == -1) // ���̵� ���� ��� -> �ٽ� �α��� ȭ������ �̵�
		{
			request.setAttribute("fail", "-1");

	   		forward.setRedirect(false);
	   		forward.setNextPath("/member/jsp/LoginForm.jsp"); //....................................................
		}
		else
		{
			//�α��� ���� -> ���ǿ� ���̵� ����
	   		session.setAttribute("sessionID", id);
	   		
	   		//로그인 성공시 넘어갈 페이지 
	   		// �α��� ������ ����ȭ������ �̵�
	   		forward.setRedirect(false);
	   		forward.setNextPath("index.jsp"); //.........................................guestbeeMain.jsp로 바꾸기 !!!!
	   		System.out.println(forward.getNextPath());
		}
		request.getSession().setAttribute("msg", "0"); // 회원가입 성공시 메세지 띄울 수 있도록 세션 설정
		return forward;
	}

}
