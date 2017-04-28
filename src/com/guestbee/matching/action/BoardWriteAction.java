package com.guestbee.matching.action;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.guestbee.matching.common.Action;
import com.guestbee.matching.common.ActionForward;
import com.guestbee.matching.model.BoardBean;
import com.guestbee.matching.model.BoardDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardWriteAction implements Action
{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		System.out.println("boardWriteAction.java");
		// 업로드 파일 사이즈
		int fileSize= 5*1024*1024;
		
		// 파일명으로 저장
		//String uploadPath = "D:/Java/th147_Jsp_Servlet/workspace/project_matching/WebContent/m_UploadFolder/";
		//String savePath = "D:/Java/th147_Jsp_Servlet/workspace/project_matching/WebContent/m_UploadFolder";
		
		// 업로드될 폴더 경로 절대경로
		String uploadPath = request.getServletContext().getRealPath("matching");
		// 서버쪽 업로드가 되지만 따로 업로드 폴더를 
		
		//uploadPath = uploadPath.replaceAll("\\\\", "/");
		System.out.println("re");
		try {
			
			// 파일 업로드
			MultipartRequest multi = new MultipartRequest
					(request, uploadPath, fileSize, "UTF-8", new DefaultFileRenamePolicy());
			System.out.println("파일 업로드");
			// 파일이름 가져오기
			String fileName = "";
			Enumeration<String> names = multi.getFileNames();
			System.out.println("파일 이름가져오기");
			
			if(names.hasMoreElements())
			{
				System.out.println("파일 이름가져오기 if ");
				String name = names.nextElement();
				fileName = multi.getFilesystemName(name);
				System.out.println(fileName);
			}
			System.out.println("BoardDAO 연결 전");
			BoardDAO dao = BoardDAO.getInstance();
			BoardBean borderData = new BoardBean();
			System.out.println("BoardDAO 연결 후");
			borderData.setBoard_num(dao.getSeq()); // 시퀀스값 가져와 세팅
			borderData.setBoard_id(multi.getParameter("board_id")); //로그인한 값
			borderData.setBoard_subject(multi.getParameter("board_subject"));
			borderData.setBoard_subtitle(multi.getParameter("board_subtitle"));
			borderData.setBoard_local(multi.getParameter("board_local"));
			borderData.setBoard_purpose(multi.getParameter("board_purpose"));
			borderData.setBoard_content(multi.getParameter("board_content"));
			borderData.setBoard_course(multi.getParameter("board_course"));
			borderData.setBoard_place(multi.getParameter("board_place"));
			borderData.setBoard_noted(multi.getParameter("board_noted"));
			String fName = multi.getFilesystemName("board_file");
			borderData.setBoard_file(multi.getFilesystemName("board_file")); //파일명으로 담기
			System.out.println(fName);
			System.out.println("BoardWriteAction.java");
			System.out.println(uploadPath);
			
			boolean result = dao.boardInsert(borderData);
			
			if(result){
				forward.setRedirect(true);
				forward.setNextPath("BoardListAction.bo");
				System.out.println("boardWriteAction.java");
			}
			// 이미지 복사해야지
			img_copy(uploadPath, fName);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("글 작성 오류 : " + e.getMessage());
		}
		
		return forward;
	}
	
	public void img_copy(String source_path, String source_fileName){
		// 복사를 할 목적지 주소
		String des_path= "E:/JSP/GuestBee/WebContent/img/matching/"+source_fileName;
		System.out.println("img_copy 진입");
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
			while((n = source_file.read(byte_file)) != -1){
				// 읽어올 데이터가 있다.
				des_file.write(byte_file, 0, n); // 쓰고..
				des_file.flush(); // 내보낸다!
			}
			
		} catch (Exception e) {
			 e.printStackTrace();
		}finally{
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
