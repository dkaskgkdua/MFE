package mvc.book.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.book.db.BookDAO;
import mvc.book.db.CardBean;

public class CardAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		BookDAO bdao = new BookDAO();
		CardBean cdata = new CardBean();
		ActionForward forward = new ActionForward();
		
		request.setCharacterEncoding("UTF-8");
		cdata.setCard_id(request.getParameter("card_id"));
		cdata.setMember_id(request.getParameter("member_id"));
		cdata.setCard_mmyy(Integer.parseInt(request.getParameter("card_mmyy")));
		cdata.setCard_cvv(Integer.parseInt(request.getParameter("card_cvv")));
	
		System.out.println("Card_id = " + cdata.getCard_id());
		System.out.println("Card_mmyy = " + cdata.getCard_mmyy());
		System.out.println("Card_cvv = " + cdata.getCard_cvv());
		System.out.println("Member_id = " + cdata.getMember_id());
		
		boolean result = false;
		
		try {
			result = bdao.cardInsert(cdata);
			if(result == false) {
				System.out.println("카드번호 등록 실패");
				forward.setRedirect(false);
				request.setAttribute("message", "카드번호 등록 실패!");
				forward.setPath("error/error.jsp");
				return forward;
			}
			
			System.out.println("카드 등록 완료");
			forward.setRedirect(false);
			forward.setPath("cardsave.jsp");
			return forward;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
