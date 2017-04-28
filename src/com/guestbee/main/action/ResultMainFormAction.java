package com.guestbee.main.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.guestbee.common.Action;
import com.guestbee.common.ActionForward;
import com.guestbee.reservation.model.GuestHouseDAO;
import com.guestbee.reservation.model.GuestHouseVO;

public class ResultMainFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		
		GuestHouseDAO dao = GuestHouseDAO.getInstance();
		ArrayList<GuestHouseVO> ghList = dao.getTopList();

		request.setAttribute("list", ghList);
		
		forward.setNextPath("/reservation/reservationMain.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
