package com.guestbee.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.guestbee.common.Action;
import com.guestbee.common.ActionForward;
import com.guestbee.member.model.MemberDAO;

/**
 * ȸ������ �۾��� ó���ϴ� Action Ŭ����
 */
public class MemberDeleteAction implements Action
{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		
		// ������ �������ִ� �α����� ID ������ �����´�
		HttpSession session = request.getSession();
		String id = session.getAttribute("sessionID").toString();//세션으로 아이디값 얻어오기
		String password = request.getParameter("u_password"); //데이터 받아오기
		
		MemberDAO dao = MemberDAO.getInstance();
		int check = dao.deleteMember(id, password);
		
		if(check == 1){ //delete 성공시
			session.invalidate(); // 로그인에 대한 세션 제거
			forward.setRedirect(false);/*//RequsetDispatcher 실행 forwarding 있음
			forward.setRedirect(true); // response.sendRedirect 실행 forwarding 없음
			forward.setNextPath("Result.do");*/
			request.setAttribute("result", "sucess");
			//경로 바꾸기만 하면됨
		}
		else{  
			System.out.println("delete 실패시"); // delete 실패시
			request.setAttribute("result", "fail");
			//경로 바꾸기만 하면됨
		}
		forward.setNextPath("/member/jsp/ResultForm.jsp");
		return forward;
	}
}
