package com.guestbee.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.guestbee.common.Action;
import com.guestbee.common.ActionForward;
import com.guestbee.member.model.MemberBean;
import com.guestbee.member.model.MemberDAO;

/**
 * ȸ������ �����۾��� ó���ϴ� Action Ŭ����
 *
 */
public class MemberModifyAction implements Action
{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("euc-kr"); // ���ڵ�
		
		ActionForward forward = new ActionForward();
		
		MemberDAO dao = MemberDAO.getInstance();
		
		// ������ �������ִ� �α����� ID ������ �����´�
		HttpSession session = request.getSession();
		String id = session.getAttribute("sessionID").toString();
		
		// ������ ������ �ڹٺ� �����Ѵ�.
		MemberBean member = new MemberBean();
		member.setU_id(id);
		member.setU_password(request.getParameter("u_password"));
		member.setU_name(request.getParameter("u_name"));
		member.setU_phone(request.getParameter("u_phone"));
		member.setU_msgID(request.getParameter("u_msgID"));
		member.setU_email(request.getParameter("u_email"));
		member.setU_birth(request.getParameter("u_birth"));
		
		/*dao.updateMember(member);

		forward.setRedirect(true);
   		forward.setNextPath("Result.do");
		
   		session.setAttribute("msg","0"); //////여기 수정
   		// ȸ������ ���� ���� �޽����� ���ǿ� ��´�.
   		//session.setAttribute("msg", member); //
  		
		return forward;
		 
*/
		
		int check = dao.updateMember(member);
		
		if(check == 1){ //delete 성공시
			System.out.println("update 성공시");
			//session.invalidate(); // 로그인에 대한 세션 제거 ///이거는 delete에서만................................
			forward.setRedirect(false);/*//RequsetDispatcher 실행 forwarding 있음
			forward.setRedirect(true); // response.sendRedirect 실행 forwarding 없음
			forward.setNextPath("Result.do");*/
			request.setAttribute("check", "1");
			//경로 바꾸기만 하면됨
			System.out.println("성공");
			forward.setNextPath("Result.do");
		}
		else{  
			
			System.out.println("update 실패시"); // delete 실패시
			request.setAttribute("check", "0");
			System.out.println("실패");
			forward.setRedirect(false);
			forward.setNextPath("Result.do");
			//경로 바꾸기만 하면됨
		}
		
		return forward;
		
		
		
		
		
	}

}
