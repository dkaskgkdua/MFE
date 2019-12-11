package mvc.review.action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import mvc.member.action.Action;
import mvc.member.action.ActionForward;
import mvc.review.db.ReviewBean;
import mvc.review.db.ReviewDAO;

public class ReviewModifyAction implements Action {

	   @Override
	   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		   request.setCharacterEncoding("UTF-8");
		   ActionForward forward = new ActionForward();
		   ReviewDAO reviewdao = new ReviewDAO();
		   ReviewBean reviewbean = new ReviewBean();
		 
		   ServletContext sc = request.getServletContext();
		   
		   boolean result = false;
		   
			   
				int num=Integer.parseInt(request.getParameter("REVIEW_ID"));	
				String pass = request.getParameter("REVIEW_PASS");
				
				boolean usercheck = reviewdao.isReviewWriter(num, pass);
		
				if(usercheck ==false) {
					response.setContentType("text/html;charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("alert('비밀번호가 다릅니다.');");
					out.println("history.back();");
					out.println("</script>");
					out.close();
					return null;
				}
				reviewbean.setReview_id(num);
				reviewbean.setMember_id(request.getParameter("MEMBER_ID"));
				reviewbean.setReview_pass(pass);
				reviewbean.setReview_title(request.getParameter("REVIEW_TITLE"));
				reviewbean.setReview_content(request.getParameter("REVIEW_CONTENT"));
				String check = request.getParameter("check");
				System.out.println("check=" + check);
				
				result = reviewdao.reviewModify(reviewbean);
	
				if(result == false) {
					System.out.println("리뷰 수정 실패");
					forward.setRedirect(false);
					request.setAttribute("message", "리뷰 수정 실패입니다.");
					forward.setPath("error/error.jsp");
					return forward;
				}
		   
				System.out.println("리뷰 수정 완료");
				forward.setRedirect(true);
				forward.setPath("ReviewDetailAction.rv?num="+reviewbean.getReview_id());
				return forward;
		   
	   }
}
