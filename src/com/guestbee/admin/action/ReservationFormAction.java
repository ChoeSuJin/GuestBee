package com.guestbee.admin.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.guestbee.admin.model.ReservationVO;
import com.guestbee.admin.model.SignupDAO;
import com.guestbee.common.Action;
import com.guestbee.common.ActionForward;

public class ReservationFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("sessionId");
		
		SignupDAO dao = SignupDAO.getInstance();
		
		ArrayList<ReservationVO> list = dao.getInform2(id);
		
		request.setAttribute("list", list);
		
		forward.setRedirect(false);
		forward.setNextPath("/admin/reservationform.jsp");
		
		return forward;
	}

}
