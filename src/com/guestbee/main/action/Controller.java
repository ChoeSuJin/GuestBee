package com.guestbee.main.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.guestbee.admin.action.AdminLoginProAction;
import com.guestbee.admin.action.AdminLogoutAction;
import com.guestbee.admin.action.AdminUpdateFormAction;
import com.guestbee.admin.action.AdminUpdateProAction;
import com.guestbee.admin.action.ReservationFormAction;
import com.guestbee.common.Action;
import com.guestbee.common.ActionForward;
import com.guestbee.info.action.DetailViewAction;
import com.guestbee.info.action.MainListAction;
import com.guestbee.info.action.MainListViewAction;
import com.guestbee.info.action.WriteProAction;
import com.guestbee.main.action.MainAction;
import com.guestbee.member.action.MemberBookingInfoForm;
import com.guestbee.member.action.MemberConfirmIdAction;
import com.guestbee.member.action.MemberDeleteAction;
import com.guestbee.member.action.MemberInfoAction;
import com.guestbee.member.action.MemberJoinAction;
import com.guestbee.member.action.MemberLoginAction;
import com.guestbee.member.action.MemberLogoutAction;
import com.guestbee.member.action.MemberModifyAction;
import com.guestbee.member.action.MemberModifyFormAction;
import com.guestbee.member.action.MyPageFormAction;
import com.guestbee.reservation.action.ReservationConfirmAction;
import com.guestbee.reservation.action.ReservationMainAction;
import com.guestbee.reservation.action.ResrvationResultAction;

/**
 * Servlet implementation class ReservationController
 */
@WebServlet("*.do")
public class Controller extends HttpServlet {
	private Map map = new HashMap();

	private HashMap<String, Action> commandMap;

	/**
	 * 최초 실행 init
	 */
	/*
	 * public void init(ServletConfig config) throws ServletException {
	 * System.out.println("init method start");
	 * loadProperties("com.guestbee.common.Command"); }
	 */

	/**
	 * 프로퍼티 파일에서 키값과 클래스 정보를 추출하여 그것을 Map에 저장한다.
	 * 
	 * @param filePath
	 *            프로퍼티 파일의 경로
	 */
	/*
	 * private void loadProperties(String filePath) { commandMap = new
	 * HashMap<String, Action>(); System.out.println("loadProperties start");
	 * ResourceBundle rb = ResourceBundle.getBundle(filePath);
	 * Enumeration<String> actionEnum = rb.getKeys(); // 키값을 가져온다.
	 * 
	 * 
	 * 
	 * while (actionEnum.hasMoreElements()) { // 명령어를 가져온다. String command =
	 * actionEnum.nextElement(); // 명령어에 해당하는 Action 클래스 이름을 가져온다. String
	 * className = rb.getString(command); try { Class actionClass =
	 * Class.forName(className); // 클래스 생성 Action actionInstance =
	 * (Action)actionClass.newInstance(); // 클래스
	 * 
	 * 
	 * // 화면전환 Action 인지 확인한다. 화면전환 Action이면 명령어를 전달한다.
	 * if(className.equals("com.guestbee.main.action.MainAction")){ MainAction
	 * ma = (MainAction)actionInstance; ma.setCommand(command);
	 * 
	 * } else if(className.equals(
	 * "com.guestbee.reservation.action.ReservationMainAction")){
	 * ReservationMainAction rma = (ReservationMainAction)actionInstance;
	 * rma.setCommand(command);
	 * 
	 * }
	 * 
	 * // 맵에 명령어와 Action을 담는다. commandMap.put(command, actionInstance);
	 * 
	 * } catch (Exception e) { e.printStackTrace(); } } }
	 */

	/**
	 * GET 방식일 경우 doGet()
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	/**
	 * POST 방식일 경우 doPost()
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	/**
	 * 명령어에 따른 해당 Action을 지정해 준다.
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String RequestURI = request.getRequestURI();
		System.out.println("RequestURI = " + RequestURI);
		String contextPath = request.getContextPath();
		System.out.println("contextPath = " + contextPath);
		String command = RequestURI.substring(contextPath.length());
		String[] tmp = RequestURI.split("/");
		String comm = "";
		for (int i = 0; i < tmp.length; i++) {
			comm = tmp[i];
		}
		String path = contextPath + "/" + comm;
		System.out.println(path);
		command = comm;
		// String comm = RequestURI.
		System.out.println("command = " + command);

		ActionForward forward = null;
		Action action = null;

		if (command.equals("Main.do")) {
			forward = new ActionForward();
			action = new MainAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("ReservationMainAction.do")) {
			System.out.println("ReservationMainAction.java 파일 실행 직전");
			action = new ReservationMainAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("ReservationResultAction.do")) {
			System.out.println("ReservationResultAction.java 파일 실행직전");
			action = new ResrvationResultAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("ReservationConfirmAction.do")) {
			action = new ReservationConfirmAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("MemberLoginAction.do")) // 로그인 처리
		{
			action = new MemberLoginAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			System.out.println("action 수행 후 ");
		} else if (command.equals("MemberJoinAction.do")) {
			action = new MemberJoinAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("Join Action 실행 후");
		} else if (command.equals("MemberDeleteAction.do")) {
			action = new MemberDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("Delete Action 실행 후");
		} else if (command.equals("MemberConfirmIdAction.do")) { // 아이디 중복체크
			action = new MemberConfirmIdAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (command.equals("MemberModifyFormAction.do")) 
		{
			action = new MemberModifyFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (command.equals("MemberModifyAction.do")) // ȸ������ ó��
		{
			action = new MemberModifyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (command.equals("writePro.do")) 
		{
			action = new WriteProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (command.equals("MainList.do")) 
		{
			action = new MainListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (command.equals("MainListView.do")) 
		{
			action = new MainListViewAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (command.equals("DetailView.do")) 
		{
			action = new DetailViewAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (command.equals("AdminLoginProAction.do")) 
		{
			action = new AdminLoginProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (command.equals("AdminUpdateForm.do")) 
		{
			action = new AdminUpdateFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (command.equals("AdminLogout.do")) 
		{
			action = new AdminLogoutAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (command.equals("AdminUpdatePro.do")) 
		{
			action = new AdminUpdateProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (command.equals("ReservationFormAction.do")) 
		{
			action = new ReservationFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (command.equals("MemberLogoutAction.do")) 
		{
			action = new MemberLogoutAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}  else if (command.equals("MemberInfoAction.do")) 
		{
			action = new MemberInfoAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (command.equals("BookingInfoForm.do")) 
		{
			action = new MemberBookingInfoForm();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (command.equals("MyPageForm.do")) 
		{
			action = new MyPageFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (command.equals("ResultMainForm.do")) 
		{
			action = new ResultMainFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (command.equals("ModifyForm.do")) // �α���ȭ�� �̵�
		{
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setNextPath("/myPage/jsp/ModifyForm.jsp");
		} else if (command.equals("Result.do")) // �α���ȭ�� �̵�
		{
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setNextPath("/member/jsp/ResultForm.jsp");
		} else if (command.equals("LoginForm.do")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setNextPath("/member/jsp/LoginForm.jsp");
		} else if (command.equals("JoinForm.do")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setNextPath("/member/jsp/JoinForm.jsp");
		} else if (command.equals("ReservationMainForm.do")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setNextPath("/reservation/reservationMain.jsp");
		} else if (command.equals("DeleteForm.do")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setNextPath("/myPage/jsp/DeleteForm.jsp");
		} else if (command.equals("MatchingInfo.do")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setNextPath("/myPage/jsp/MatchingInfo.jsp");
		} else if (command.equals("MainListForm.do")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setNextPath("/info/MainListForm.jsp");
		} else if (command.equals("InfoMainForm.do")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setNextPath("MainListView.do?Local=02");
		} else if (command.equals("AdminLoginForm.do")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setNextPath("/admin/loginform.jsp");
		} else if (command.equals("AdminLoginProAction.do")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setNextPath("/admin/LoginPro.jsp");
		} else if (command.equals("MatchingMainForm.do")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setNextPath("/matching/board/MainForm.jsp");
		}
		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getNextPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getNextPath());
				dispatcher.forward(request, response);
			}

		}

		// 넘어온 커맨드를 추출하는 과정
		/*
		 * String requestURI = request.getRequestURI(); int cmdIdx =
		 * requestURI.lastIndexOf("/") + 1; String command =
		 * requestURI.substring(cmdIdx);
		 * 
		 * // URI, command 확인 // System.out.println("requestURI : "+requestURI);
		 * System.out.println("Command cmd : "+command);
		 * 
		 * ActionForward forward = null; Action action = null;
		 * 
		 * try { // 맵에서 명령어에 해당하는 Action을 가져온다. action =
		 * commandMap.get(command); System.out.println("command = " + command);
		 * 
		 * if (action == null) { System.out.println("명령어 : "+command+
		 * "는 잘못된 명령입니다.."); return; }
		 * 
		 * forward = action.execute(request, response);
		 * 
		 * 
		 * 화면이동 - isRedirext() 값에 따라 sendRedirect 또는 forward를 사용 sendRedirect :
		 * 새로운 페이지에서는 request와 response객체가 새롭게 생성된다. forward : 현재 실행중인 페이지와
		 * forwad에 의해 호출될 페이지는 request와 response 객체를 공유
		 * 
		 * 
		 * if(forward != null){ if (forward.isRedirect()) {
		 * response.sendRedirect(forward.getNextPath()); } else {
		 * RequestDispatcher dispatcher = request
		 * .getRequestDispatcher(forward.getNextPath());
		 * dispatcher.forward(request, response); } }
		 * 
		 * } catch (Exception e) { e.printStackTrace(); }
		 */
	} // end doProcess

}
