package mvc.concert.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.concert.db.ConcertBean;
import mvc.concert.db.ConcertDAO;
import mvc.member.action.Action;
import mvc.member.action.ActionForward;

public class SearchwordAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");

		ConcertDAO cdao = new ConcertDAO();
		List<ConcertBean> list = new ArrayList<ConcertBean>();

		String search_word = request.getParameter("search_Text");
		System.out.println("search_word = " + search_word);

		list = cdao.getSearchList(search_word);
		System.out.println("list size = " + list.size());
		int count = cdao.getListCount(search_word);

		request.setAttribute("list", list);
		request.setAttribute("count", count);
		request.setAttribute("search_word", search_word);
		forward.setRedirect(false);
		forward.setPath("search/search_result_form.jsp");
		return forward;

	}
}
