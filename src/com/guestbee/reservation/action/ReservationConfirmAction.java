package com.guestbee.reservation.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.guestbee.common.Action;
import com.guestbee.common.ActionForward;
import com.guestbee.reservation.model.ReservationInformationDAO;
import com.guestbee.reservation.model.ReservationInformationVO;

public class ReservationConfirmAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = new ActionForward();
		
		System.out.println("ReservationConfirmAction 진입");

		String user_id = request.getParameter("user_id");
		String gh_id = request.getParameter("gh_ID");
		int people = Integer.parseInt(request.getParameter("people"));
		int price = Integer.parseInt(request.getParameter("price"));
		String date = request.getParameter("date");
		String ri_name = request.getParameter("ri_name");
		String local = request.getParameter("local");

		System.out.println(user_id);
		System.out.println(gh_id);
		System.out.println(people);
		System.out.println(price);
		System.out.println(ri_name);
		System.out.println(local);

		ReservationInformationVO vo = new ReservationInformationVO();

		vo.setDate(date);
		vo.setRi_ID(gh_id);
		vo.setRi_People(people);
		vo.setRi_Price(price);
		vo.setRi_UserID(user_id);
		vo.setRi_Local(local);
		vo.setRi_Name(ri_name);

		ReservationInformationDAO dao = ReservationInformationDAO.getInstance();
		dao.insert(vo);
		
		request.setAttribute("check", true);

		forward.setRedirect(false);
		forward.setNextPath("/index.jsp");

		return forward;
	}

}
