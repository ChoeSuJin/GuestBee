package com.guestbee.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.guestbee.admin.model.SignupDAO;
import com.guestbee.admin.model.SignupVO;
import com.guestbee.common.Action;
import com.guestbee.common.ActionForward;

public class AdminUpdateProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("sessionId");

		SignupDAO dao = SignupDAO.getInstance();
		SignupVO dto = new SignupVO();
		
		dto.setGh_ID(request.getParameter("gh_ID"));
		dto.setGh_PW(request.getParameter("gh_PW"));
		dto.setGh_Name(request.getParameter("gh_Name"));
		dto.setGh_Local(request.getParameter("gh_Local"));
		dto.setGh_Img1(request.getParameter("gh_Img1"));
		dto.setGh_Wifi(request.getParameter("gh_Wifi"));
		dto.setGh_ShareToilet(request.getParameter("gh_ShareToilet"));
		dto.setGh_PrivateRoom(request.getParameter("gh_PrivateRoom"));
		dto.setGh_LateCheck(request.getParameter("gh_LateCheck"));
		dto.setGh_Longitude(request.getParameter("gh_Longitude"));
		dto.setGh_Latitude(request.getParameter("gh_Latitude"));
		dto.setGh_TotalPeople(request.getParameter("gh_TotalPeople"));
		dto.setGh_Phone(request.getParameter("gh_Phone"));
		dto.setGh_Price(request.getParameter("gh_Price"));
		
		dao.updateInform(dto);
		
		
		
		request.setAttribute("vo", dto);
		request.setAttribute("update", true);
		
		forward.setNextPath("/admin/updateform.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
