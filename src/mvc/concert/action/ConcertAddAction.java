package mvc.concert.action;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import mvc.concert.db.ConcertBean;
import mvc.concert.db.ConcertDAO;
import mvc.member.action.Action;
import mvc.member.action.ActionForward;

public class ConcertAddAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ConcertDAO concertdao = new ConcertDAO();
		ConcertBean cdata = new ConcertBean();
		ActionForward forward = new ActionForward();
		
		String realFolder="";
		//WebContent 아래 저장될 폴더 이름
		String saveFolder="concertupload";
	
		int fileSize = 10*1024*1024; //업로드할 파일의 최대 사이즈 10MB
		
		ServletContext sc = request.getServletContext();
		realFolder = sc.getRealPath(saveFolder);
		
		System.out.println("realFolder = " + realFolder);
		boolean result = false;
		
		try {
			MultipartRequest multi = null;
			multi = new MultipartRequest(request, realFolder,
								fileSize,
								"UTF-8",
								new DefaultFileRenamePolicy());
			
			cdata.setConcert_name(multi.getParameter("concert_add_name"));
			/* 날짜 */
			String textDate = multi.getParameter("concert_add_day");
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date date = format.parse(textDate);
			System.out.println("날짜 : " + date);
			cdata.setConcert_day((java.sql.Date) date);
			
			cdata.setConcert_musician(multi.getParameter("concert_add_musician"));
			cdata.setConcert_open(multi.getParameter("concert_add_open"));
			cdata.setConcert_close(multi.getParameter("concert_add_close"));
			
			cdata.setConcert_price(multi.getParameter("concert_price"));
			
			// 업로드의 파일명은 업로드한 파일의 전체 경로에서 파일 이름만 저장한다.
			cdata.setConcert_image(multi.getFilesystemName("CONCERT_FILE"));
			
			// 글 등록 처리를 위해 DAO의 boardInsert()메서드를 호출한다.
			// 글 등록 폼에서 입력한 정보가 저장되어 있는 boarddata 객체를 전달한다.
			result = concertdao.concertInsert(cdata);
			
			//글 등록에 실패할 경우 null을 반환한다.
			if(result==false) {
				System.out.println("게시판 등록 실패");
				forward.setRedirect(false);
				request.setAttribute("message","게시판 등록 실패입니다.");
				forward.setPath("error/error.jsp");
				return forward;
			}
			System.out.println("게시판 등록 완료");
			// 글 등록이 완료되면 글 목록을 단순히 보여주기만 할 것이므로
			// Redirect여부를 true로 설정합니다.
			forward.setRedirect(true);
			// 이동할 경로를 지정한다.
			forward.setPath("BoardList.bo");
			return forward;
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}
	
	
	private String replaceParameter(String param) {
		String result = param;
		if(param != null) {
			result = result.replaceAll("<","&lt;");
			result = result.replaceAll("<","&lt;");
			result = result.replaceAll("<","&lt;");
		}
		return result;
	}
}
