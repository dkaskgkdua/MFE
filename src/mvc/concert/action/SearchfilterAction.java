package mvc.concert.action;

import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.concert.db.ConcertBean;
import mvc.concert.db.ConcertDAO;
import mvc.member.action.Action;
import mvc.member.action.ActionForward;

public class SearchfilterAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");

		ConcertDAO cdao = new ConcertDAO();
		List<ConcertBean> list = new ArrayList<ConcertBean>();

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");

		Date search_date = (Date) transFormat.parse(request.getParameter("search_date"));
		String search_local = request.getParameter("search_local");
		String search_genre = request.getParameter("search_jenre");
		System.out.println(search_date + ", " + search_local + ", " + search_genre);

		list = cdao.getSearchList(search_date, search_local, search_genre);
		System.out.println("size = " + list.size());

		// 검색 결과가 없는 경우
		if (list.size() == 0) {
			response.setContentType("text/html;charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('검색 결과가 존재하지 않습니다.');");
			out.println("history.back()");
			out.close();

			return null;
		} else {

			request.setAttribute("list", list);
			forward.setRedirect(false);
			forward.setPath("search/search_result_form.jsp");
			return forward;
		}
	}
}
