package com.guestbee.member.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.guestbee.common.Action;
import com.guestbee.common.ActionForward;
import com.guestbee.member.model.MemberDAO;
import com.guestbee.member.model.ReservationInfoBean;

public class MemberBookingInfoForm implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		
		MemberDAO dao = MemberDAO.getInstance();
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("sessionID");
  		ArrayList<ReservationInfoBean> list = dao.BookingInfo(id);
  		System.out.println(id);
  		request.setAttribute("list", list);

  		
		forward.setNextPath("/myPage/jsp/BookingInfo.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
