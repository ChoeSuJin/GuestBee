package com.guestbee.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception;
}
/*
String uploadPath = "D:/Java/th147_Jsp_Servlet/workspace/project_matching/WebContent/m_UploadFolder/";
try {
    
    // 파일 업로드
    MultipartRequest multi = new MultipartRequest
          (request, uploadPath, fileSize, "UTF-8", new DefaultFileRenamePolicy());

borderData.setBoard_file(multi.getFilesystemName("board_file")); //파일명으로 담기

} catch (Exception e) {
    e.printStackTrace();
    System.out.println("글 작성 오류 : " + e.getMessage());
 }*/