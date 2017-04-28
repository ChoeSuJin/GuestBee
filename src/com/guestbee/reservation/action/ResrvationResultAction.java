package com.guestbee.reservation.action;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.guestbee.common.Action;
import com.guestbee.common.ActionForward;
import com.guestbee.reservation.model.GuestHouseDAO;
import com.guestbee.reservation.model.GuestHouseVO;

public class ResrvationResultAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		
		String local = request.getParameter("region");
		String date = request.getParameter("date");
		String[] special = request.getParameterValues("special");
		int people = Integer.parseInt(request.getParameter("people"));
		Vector<GuestHouseVO> list = new Vector<GuestHouseVO>();
		
		GuestHouseDAO dao = GuestHouseDAO.getInstance();
		System.out.println("in ReservationResultAction");
		System.out.println("region = " + local);
		if (special.length == 0) {
			for (int i = 0; i < special.length; i++) {
				special[i] = "0";
			}
			
		}
		
		else {
			for (int i = 0; i < special.length; i++) {
				System.out.println(special[i]);
			}
		}
		
		
		
		list = dao.getSpecialList(date, people, local, special);
		
		request.setAttribute("special", special);
		request.setAttribute("list", list);
		request.setAttribute("local", local);
		request.setAttribute("date", date);
		request.setAttribute("people", people);
		
		forward.setRedirect(false);
		forward.setNextPath("/reservation/reservationResult.jsp");
		
		return forward;
	}

}
