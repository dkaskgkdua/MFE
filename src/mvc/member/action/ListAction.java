package mvc.member.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.member.db.Member;
import mvc.member.db.MemberDAO;

public class ListAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
	 							throws Exception {
		ActionForward forward = new ActionForward();
		MemberDAO mdao = new MemberDAO();
		List<Member> list = new ArrayList<Member>();
		
		int page = 1;
		int limit = 3;
		int search_field = -1; //널값 안나게 초기화해준것(case에 없어야함)
		String search_word ="";
		
		if(request.getParameter("page")!=null) {
			page =Integer.parseInt(request.getParameter("page"));
		}
		System.out.println("넘오온 페이지" + page);
		
		
		if(request.getParameter("search_field") != null) {
			search_field = Integer.parseInt(request.getParameter("search_field"));
			System.out.println("검색 : " + search_field);
		} 
		if(request.getParameter("search_word") != null) {
			search_word = request.getParameter("search_word");
			System.out.println("검색 내용 : " + search_word);
		}
		
		int listcount = mdao.getListCount(search_field, search_word);
		System.out.println("리카 = " + listcount);
		
		list = mdao.getList(search_field, search_word, page, limit);
		
		int maxpage = (listcount+limit-1)/limit;
		System.out.println("총 페이지 수 = " +maxpage);
		
		int startpage = ((page-1) /10) * 10 +1;
		
		int endpage = startpage + 10 -1;
		
		if(endpage > maxpage) endpage = maxpage;
		
		request.setAttribute("page", page);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("listcount", listcount);
		request.setAttribute("totallist", list);
		request.setAttribute("search_word", search_word);
		if(request.getParameter("search_field") == null) {
			request.setAttribute("search_field", 0);
		} else {
			request.setAttribute("search_field", request.getParameter("search_field"));
		}
		
		forward.setRedirect(false);
		forward.setPath("admin/adminPage.jsp");
		return forward;
	}
}
