package mvc.review.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import mvc.member.action.Action;
import mvc.member.action.ActionForward;
import mvc.review.db.ReviewBean;
import mvc.review.db.ReviewDAO;

public class ReviewAddAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ReviewDAO dao = new ReviewDAO();
		ReviewBean review = new ReviewBean();
		ActionForward forward = new ActionForward();
		
		String realFolder = "";
		
		String saveFolder = "reviewupload";
		
		int fileSize=10*1024*1024; 
		
		ServletContext sc = request.getServletContext();
		realFolder = sc.getRealPath(saveFolder);
		
		System.out.println("realFolder= " + realFolder);
		boolean result=false;
		 
		try {
			MultipartRequest multi = null;
			multi = new MultipartRequest(request,
							realFolder,
							fileSize,
							"utf-8",
							new DefaultFileRenamePolicy());
			
			review.setMember_id(multi.getParameter("member_id"));
			review.setReview_pass(multi.getParameter("review_pass"));
			review.setReview_title(replaceParameter(multi.getParameter("review_title")));
			review.setReview_content(replaceParameter(multi.getParameter("review_content")));
			
			review.setReview_file(multi.getFilesystemName("review_file"));
			
			result=dao.reviewInsert(review);
			
			if(result == false) {
				System.out.println("게시판 등록 실패");
				forward.setRedirect(false);
				request.setAttribute("message","게시판 등록 실패입니다.");
				forward.setPath("error/error.jsp");
				return forward;
			}
			System.out.println("게시판 등록 완료");
			forward.setRedirect(true);
			forward.setPath("ReviewList.rv");
			return forward;
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return null;
	}

	private String replaceParameter(String param) {
		String result = param;
		if(param != null) {
			result = result.replaceAll("<","&lt;");
			result = result.replaceAll(">","&gt;");
			result = result.replaceAll("\"","&quot;");
		}
		return result;
		
	}
}
