package mvc.book.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.book.db.BookBean;
import mvc.book.db.BookDAO;

public class BookAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		BookDAO bdao = new BookDAO();
		BookBean bdata = new BookBean();
		ActionForward forward = new ActionForward();
		String eticket = "e"+bdata.hashCode();
		
		request.setCharacterEncoding("UTF-8");
		bdata.setConcert_id(Integer.parseInt(request.getParameter("con_id")));
		bdata.setMember_id(request.getParameter("member_id"));
		bdata.setBook_eticket(eticket);
		bdata.setBook_amount(Integer.parseInt(request.getParameter("amount")));
		bdata.setCard_id(request.getParameter("card_id"));
		
		System.out.println("Concert_id = " + bdata.getConcert_id());
		System.out.println("Member_id = " + bdata.getMember_id());
		System.out.println("Book_eticket = " + eticket);
		
		boolean result = false;
		
		try {
			
			result = bdao.bookInsert(bdata);
			if(result == false) {
				System.out.println("예매 등록 실패");
				forward.setRedirect(false);
				request.setAttribute("message", "예매 등록 실패!!");
				forward.setPath("error/error.jsp");
				return forward;
			}
			
			
			
			
			System.out.println("예매 등록 완료");
			forward.setRedirect(false);
			forward.setPath("reserve/reserve_complete.jsp");
			return forward;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
