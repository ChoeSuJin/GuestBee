package com.guestbee.reservation.action;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.guestbee.common.Action;
import com.guestbee.common.ActionForward;
import com.guestbee.reservation.model.GuestHouseDAO;
import com.guestbee.reservation.model.GuestHouseVO;

public class ReservationMainAction implements Action {
	
	
	

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		Vector<GuestHouseVO> list = new Vector<GuestHouseVO>();
		
		String path = "/reservation/reservationResult.jsp";

		String gh_local = request.getParameter("region");
		String date = request.getParameter("date");
		System.out.println(date);
		int people = Integer.parseInt(request.getParameter("people"));

		GuestHouseDAO dao = GuestHouseDAO.getInstance();

		list = dao.getList(date, people, gh_local);

		request.setAttribute("list", list);
		request.setAttribute("local", gh_local);
		request.setAttribute("date", date);
		request.setAttribute("people", people);
		
		forward.setRedirect(false);
		forward.setNextPath(path);
		
		
		return forward;
	}

}
