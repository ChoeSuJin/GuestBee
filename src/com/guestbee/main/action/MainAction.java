package com.guestbee.main.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.guestbee.common.Action;
import com.guestbee.common.ActionForward;
import com.guestbee.info.model.InfoBoardDAO;
import com.guestbee.info.model.InfoBoardVO;
import com.guestbee.matching.model.BoardBean;
import com.guestbee.matching.model.BoardDAO;
import com.guestbee.reservation.model.GuestHouseDAO;
import com.guestbee.reservation.model.GuestHouseVO;

public class MainAction implements Action {

	//이경로가 문제가 있을 수 있음--------------------------------------------------------
		
		@Override
		public ActionForward execute(HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			System.out.println("MainAction.java action forward 처리");
			ActionForward forward = new ActionForward();
			String[] Local = {"02", "051", "031", "064", "054", "055", "041", "043", "061", "063", "033"};
			String[] LocalName = {"서울", "부산", "경기", "제주", "경북", "경남", "충남", "충북", "전남", "전북", "강원"};
			String[] m_Local = {"020", "051", "031", "064", "054", "055", "041", "043", "061", "063", "033"};
			int randNum = (int)(Math.random() * 11);
			
			forward = new ActionForward();
			GuestHouseDAO daoGh = GuestHouseDAO.getInstance();
			InfoBoardDAO daoInfo = InfoBoardDAO.getInstance();
			BoardDAO daoMatching = BoardDAO.getInstance();
			
			ArrayList<GuestHouseVO> ghList = daoGh.getTopList();
			
			ArrayList<InfoBoardVO> infoList = daoInfo.MainListShow(Local[randNum]);
			ArrayList<BoardBean> matchingList = daoMatching.getTopBoardList();
			
			
			
			request.setAttribute("ghList", ghList);
			request.setAttribute("infoList", infoList);
			request.setAttribute("matchingList", matchingList);
			request.setAttribute("local", LocalName[randNum]);
			forward.setRedirect(false);
			forward.setNextPath("/main/guestbeeMain.jsp");
			
			return forward;
		}

}
