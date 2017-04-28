package com.guestbee.info.action;

import java.sql.Timestamp;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.guestbee.common.Action;
import com.guestbee.common.ActionForward;
import com.guestbee.info.model.InfoBoardDAO;
import com.guestbee.info.model.InfoBoardVO;
import com.guestbee.info.model.InfoReplyBoardVO;

public class WriteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		
		InfoReplyBoardVO vo = new InfoReplyBoardVO();
		request.setCharacterEncoding("UTF-8");

		int tmp = Integer.parseInt(request.getParameter("b_BoardNum"));
		System.out.println("이건 모가 나올까요!~:"+tmp);
		String tmp1 = request.getParameter("r_BoardNum");
		
		vo.setB_Boardnum(tmp);
		if (tmp1 !=null){
			vo.setR_BoardNum(Integer.parseInt(tmp1));
		}
		vo.setR_content(request.getParameter("r_content"));
		vo.setR_Date(new Timestamp(System.currentTimeMillis()));
		vo.setR_Password(request.getParameter("r_Password"));
		vo.setR_UserID(request.getParameter("r_UserID"));
		
		System.out.println("받아온값"+request.getParameter("r_Password"));
		System.out.println("받아온값"+request.getParameter("r_UserID"));
		
		
		InfoBoardDAO dao = InfoBoardDAO.getInstance();
		
		dao.insert(vo,tmp);
		System.out.println("들어왔니??");
		System.out.println("VO: " + vo);
		
		
		InfoBoardVO DetailView = dao.DetailView(request.getParameter("b_BoardNum"));
		
		
		 ArrayList<InfoReplyBoardVO> ReplyList = dao.ReplyList(request.getParameter("b_BoardNum"));
		 request.setAttribute("ReplyList", ReplyList);
		
		request.setAttribute("DetailList", DetailView);
		
		request.setAttribute("contentNum",request.getParameter("b_BoardNum") );
		
		forward.setNextPath("/info/Infomation1.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
