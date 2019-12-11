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
		ReviewDAO reviewdao = new ReviewDAO();
		ReviewBean reviewbean = new ReviewBean();
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");
		
		boolean result = false;
		
		try {
			reviewbean.setReview_id(Integer.parseInt(request.getParameter("review_id")));
			reviewbean.setReview_pass(request.getParameter("review_pass"));
			reviewbean.setReview_title(replaceParameter(request.getParameter("review_title")));
			reviewbean.setReview_content(replaceParameter(request.getParameter("review_content")));
			
			result = reviewdao.reviewInsert(reviewbean);
			
			if(result==false) {
				System.out.println("리뷰 등록 실패");
				forward.setRedirect(false);
				request.setAttribute("message","리뷰 등록 실패입니다.");
				forward.setPath("error/error.jsp");
				return forward;
			}
			System.out.println("리뷰 등록 완료");
			forward.setRedirect(true);
			forward.setPath("ReviewList.rv");
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
