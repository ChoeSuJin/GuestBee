package com.guestbee.info.action;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.guestbee.common.Action;
import com.guestbee.common.ActionForward;
import com.guestbee.info.model.InfoBoardDAO;
import com.guestbee.info.model.InfoBoardVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MainListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();

		int fileSize = 5 * 1024 * 1024;
		String uploadPath = "E:/JSP/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/GuestBee/info/";
		try {

			// ���� ���ε�
			MultipartRequest multi = new MultipartRequest(request, uploadPath, fileSize, "UTF-8",
					new DefaultFileRenamePolicy());
			System.out.println("���� ���ε�");
			// �����̸� ��������
			String fileName = "";

			InfoBoardDAO dao = InfoBoardDAO.getInstance();
			InfoBoardVO vo = new InfoBoardVO();
			request.setCharacterEncoding("utf-8");

			String tmp = request.getParameter("b_Boardnum");
			if (tmp != null) {
				vo.setb_Boardnum(Integer.parseInt(tmp));
			}

			vo.setB_Local(multi.getParameter("b_Local"));
			vo.setB_Address(multi.getParameter("b_Address"));
			vo.setB_Name(multi.getParameter("b_Name"));
			vo.setB_Content(multi.getParameter("b_Content"));
			vo.setB_Img1(multi.getFilesystemName("b_Img1"));
			vo.setB_Img2(multi.getFilesystemName("b_Img2"));
			vo.setB_Img3(multi.getFilesystemName("b_Img3"));
			vo.setB_Img4(multi.getFilesystemName("b_Img4"));
			vo.setB_Img5(multi.getFilesystemName("b_Img5"));
			vo.setB_Title(multi.getParameter("b_Title"));
			vo.setB_UserID(multi.getParameter("b_UserID"));
			vo.setB_Date(new Timestamp(System.currentTimeMillis()));
			vo.setB_Password(multi.getParameter("b_Password"));

			img_copy(uploadPath, multi.getFilesystemName("b_Img1"));
			img_copy(uploadPath, multi.getFilesystemName("b_Img2"));
			img_copy(uploadPath, multi.getFilesystemName("b_Img3"));
			img_copy(uploadPath, multi.getFilesystemName("b_Img4"));
			img_copy(uploadPath, multi.getFilesystemName("b_Img5"));

			dao.Mainlist(vo);
			System.out.println("vo:" + vo);

		} catch (Exception e) {
			e.printStackTrace();
		}

		forward.setNextPath("/info/InfoMainView.jsp");
		forward.setRedirect(false);

		return forward;
	}

	public void img_copy(String source_path, String source_fileName) {
		// 복사를 할 목적지 주소
		String des_path = "E:/JSP/GuestBee/WebContent/img/info/" + source_fileName;

		FileInputStream source_file = null;
		FileOutputStream des_file = null;

		source_path = source_path + "/" + source_fileName; // 이녀석을 복사할거다~
		try {
			//
			source_file = new FileInputStream(source_path);

			// 사진을 목적지 주소를 정해준다
			des_file = new FileOutputStream(des_path);
			byte[] byte_file = new byte[1024];

			int n = 0;

			// 사진 복사중..
			while ((n = source_file.read(byte_file)) != -1) {
				// 읽어올 데이터가 있다.
				des_file.write(byte_file, 0, n); // 쓰고..
				des_file.flush(); // 내보낸다!
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 사용 했으니깐 닫아야지~
			try {
				source_file.close();
				des_file.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
