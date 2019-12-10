package mvc.member.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import WebSocket.websocketVO2;
import mvc.board.db.BoardBean;
import mvc.board.db.BoardDAO;
import mvc.member.db.Member;
import mvc.member.db.MemberDAO;

public class ListAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
	 							throws Exception {
		ActionForward forward = new ActionForward();
		MemberDAO mdao = new MemberDAO();
		List<Member> list = new ArrayList<Member>();

		//////////////////////////////////////////////////  board 구간
		BoardDAO boarddao = new BoardDAO();
		List<BoardBean> boardlist = new ArrayList<BoardBean>();
		int page2=1;
		int limit2=10;
		
		if(request.getParameter("page2")!=null) {
			page2=Integer.parseInt(request.getParameter("page2"));
		}
		System.out.println("넘어온 페이지2 = " + page2);
		
		if(request.getParameter("limit2") != null) {
			limit2 = Integer.parseInt(request.getParameter("limit2"));
		}
		System.out.println("넘어온 limit2 = " + limit2);
		
		//총 리스트 수를 받아온다.
		int listcount2 = boarddao.getListCount();
		
		
		/////////////////////////////////////////////////////////
		int listcount3 = mdao.getServiceCount();  //상담 요청 고객수를 카운트하기 위해
		List<websocketVO2> volist = mdao.ServiceList(page2,limit2);  //상담 요청  고객을 띄우기 위해
		////////////////////////////////////////////////////////////////////////////////
		
		
		//리스트를 받아온다.
		boardlist = boarddao.getBoardList(page2, limit2);
	
		int maxpage2 = (listcount2+limit2-1)/limit2;
		System.out.println("총 페이지 수 = "+maxpage2); 
		
	
		int startpage2 = ((page2-1) / 10) * 10 +1;
		System.out.println("현제 페이지에 보여줄 시작 페이지 수 = " + startpage2);
		
		int endpage2 = startpage2 + 10 -1;
		System.out.println("현제 페이지에 보여줄 마지막 페이지 수 = " + endpage2);
		
		if(endpage2 > maxpage2) endpage2 = maxpage2;
		
		String state = request.getParameter("state");
		/////////////////////////////////////////////////// member 구간
		String state2 = request.getParameter("state2");
		int page = 1;
		int limit = 10;
		int search_field = -1; //널값 안나게 초기화해준것(case에 없어야함)
		String search_word ="";
		
		if(request.getParameter("page")!=null) {
			page =Integer.parseInt(request.getParameter("page"));
		}
		System.out.println("넘오온 페이지" + page);
		if(request.getParameter("limit") != null) {
			limit = Integer.parseInt(request.getParameter("limit"));
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
		
		////////////////////////////////////////////////////값 보내는 구간
		if(state == null && state2 == null) {
			request.setAttribute("page", page);
			request.setAttribute("maxpage", maxpage);
			request.setAttribute("startpage", startpage);
			request.setAttribute("endpage", endpage);
			request.setAttribute("listcount", listcount);
			request.setAttribute("memberlist", list);
			request.setAttribute("search_word", search_word);
			
			if(request.getParameter("search_field") == null) {
				request.setAttribute("search_field", 0);
			} else {
				request.setAttribute("search_field", request.getParameter("search_field"));
			}
			
			System.out.println("state=null");
			request.setAttribute("page2", page2); //현재 페이지 수
			request.setAttribute("maxpage2", maxpage2); //최대 페이지 수
		
			//현재 페이지에 표시할 첫 페이지 수
			request.setAttribute("startpage2", startpage2);
			//현재 페이지에 표시할 끝 페이지 수
			request.setAttribute("endpage2", endpage2);

			
			request.setAttribute("listcount2", listcount2); //총 글의 수
			
			
			
			//////////////////////////////////////////////////////////////////
			request.setAttribute("listcount3", listcount3); //상담 요청한 고객 수 카운트
			request.setAttribute("ServiceList", volist);    //상담 요청한 고객
			////////////////////////////////////////////////////////////////////
			
			
			
		
			//해당 페이지의 글 목록을 갖고 있는 리스트
			request.setAttribute("boardlist", boardlist);
			request.setAttribute("limit2", limit2);
			forward.setRedirect(false);
			forward.setPath("admin/adminPage.jsp");
			return forward;
		
		} else if(state == null && state2 != null){ // 회원 관리
			System.out.println("state2=ajax2");
			JsonObject object = new JsonObject();
			object.addProperty("page", page);
			object.addProperty("maxpage",maxpage);
			object.addProperty("startpage", startpage);
			object.addProperty("endpage", endpage);
			object.addProperty("search_field", search_field);
			object.addProperty("search_word", search_word);
			object.addProperty("listcount",listcount);
			object.addProperty("limit", limit);
			// List => JsonArray
			JsonArray je = new Gson().toJsonTree(list).getAsJsonArray();
			
			// List => JsonElement
			// JsonElement je = new Gson().toJsonTree(boardlist);
			System.out.println("je = " + je);
			object.add("memberlist", je);
			
			Gson gson = new Gson();
			String json = gson.toJson(object);
			response.setHeader("cache-control", "no-cache,no-store");
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().append(json);
			System.out.println(json);
			return null;
		} else {
			System.out.println("state=ajax");
			JsonObject object = new JsonObject();
			object.addProperty("page2", page2);
			object.addProperty("maxpage2",maxpage2);
			object.addProperty("startpage2", startpage2);
			object.addProperty("endpage2", endpage2);
			object.addProperty("listcount2",listcount2);
			object.addProperty("limit2", limit2);
			// List => JsonArray
			JsonArray je = new Gson().toJsonTree(boardlist).getAsJsonArray();
			
			// List => JsonElement
			// JsonElement je = new Gson().toJsonTree(boardlist);
			System.out.println("je = " + je);
			object.add("boardlist", je);
			
			Gson gson = new Gson();
			String json = gson.toJson(object);
			response.setHeader("cache-control", "no-cache,no-store");
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().append(json);
			System.out.println(json);
			return null;
		}
	}
}
