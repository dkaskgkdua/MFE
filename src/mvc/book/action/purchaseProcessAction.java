package mvc.book.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class purchaseProcessAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("UTF-8");
		String con_id = request.getParameter("con_id");
		String con_name = request.getParameter("con_name");
		String con_day = request.getParameter("con_day");
		String con_open = request.getParameter("con_open");
		String con_close = request.getParameter("con_close");
		String amount = request.getParameter("amount");
		String con_price = request.getParameter("con_price");
		String con_image = request.getParameter("con_image");
		
		HttpSession session = request.getSession();
		
		session.setAttribute("con_id", con_id);
		session.setAttribute("con_name", con_name);
		session.setAttribute("con_day", con_day);
		session.setAttribute("con_open", con_open);
		session.setAttribute("con_close", con_close);
		session.setAttribute("amount", amount);
		session.setAttribute("con_price", con_price);
		session.setAttribute("con_image", con_image);
		forward.setRedirect(false);
		forward.setPath("reserve/purchase.jsp");
		return forward;

	}

}
