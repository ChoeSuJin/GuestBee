package com.guestbee.matching.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.guestbee.matching.common.Action;
import com.guestbee.matching.common.ActionForward;

/**
 * 화면 전환을 처리하는 Action
 *
 */
public class BoardFormChangeAction implements Action
{
	
	//이경로가 문제가 있을 수 있음--------------------------------------------------------
	private String form = "MainForm.jsp?contentPage=";
	private String path;
	
	/**
	 * 명령어로부터 다음 이동할 페이지 경로를 생성한다.
	 * @param command 명령어
	 */
	public void setCommand(String command){
		int idx = command.indexOf(".");
		path = command.substring(0, idx)+".jsp";
		System.out.println("path = " + path);
		System.out.println("Boardformmatching.java");
	}

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		System.out.println("boardformmatching.java");
		// 메인화면일 경우 MainForm.jsp만 경로로 지정한다.
		/*if(path.equals("MainForm.jsp"))
			forward.setNextPath(path);
		else
			forward.setNextPath(form+path);*/
		forward.setNextPath(path);
		System.out.println(forward.getNextPath());
		return forward;
	}
}
