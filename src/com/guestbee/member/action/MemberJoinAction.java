package com.guestbee.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.guestbee.common.Action;
import com.guestbee.common.ActionForward;
import com.guestbee.member.model.MemberBean;
import com.guestbee.member.model.MemberDAO;

/** 
 *  ȸ�������� ó���ϴ� Action Ŭ����<br>
 *  JoinForm.jsp���� �Ѱܹ��� ������ �̿��Ͽ�
 *  ȸ�������� ó���Ѵ�.
 */
public class MemberJoinAction implements Action
{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("euc-kr"); // ���ڵ�
		ActionForward forward = new ActionForward();
		MemberDAO dao = MemberDAO.getInstance();
		
		// �Էµ� ������ �ڹٺ� �����Ѵ�.
		MemberBean member = new MemberBean();
		member.setU_id(request.getParameter("u_id"));
		member.setU_password(request.getParameter("u_password"));
		member.setU_name(request.getParameter("u_name"));
		member.setU_gender(request.getParameter("u_gender"));
		///
		member.setU_birth(request.getParameter("u_birth"));
		/*member.setU_birth(u_birth);
		member.setBirthmm(request.getParameterValues("birthmm")[0]);
		member.setBirthdd(request.getParameter("birthdd"));
		*///  
		member.setU_email(request.getParameter("u_email"));
		/*(request.getParameter("mail1"));
		member.setMail2(request.getParameterValues("mail2")[0]);*/
		///
		member.setU_phone(request.getParameter("u_phone"));
		member.setU_msgID(request.getParameter("u_msgID"));
		System.out.println(member.getU_id());
		System.out.println(member.getU_password());
		System.out.println(member.getU_name());
		System.out.println(member.getU_phone());
		System.out.println(member.getU_msgID());
		System.out.println(member.getU_email());
		System.out.println(member.getU_birth());
		System.out.println(member.getU_gender());
		
		// ȸ������ ����
		dao.insertMember(member);
		
		// ���Լ���
		forward.setRedirect(false);
   		forward.setNextPath("/member/jsp/LoginForm.jsp");//.........................guestbeeMain.jsp로 바꾸기 !!!!
		
   		// ���Լ��� �޽����� ���ǿ� ��´�.
   		request.getSession().setAttribute("msg", "1"); // 회원가입 성공시 메세지 띄울 수 있도록 세션 설정
   		
		return forward;
	}
}
