package mvc.board.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import mvc.board.db.BoardBean;
import mvc.board.db.BoardDAO;
import mvc.member.action.Action;
import mvc.member.action.ActionForward;

public class BoardListAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
	 							throws Exception {
	 			
		BoardDAO boarddao = new BoardDAO();
		List<BoardBean> boardlist = new ArrayList<BoardBean>();
		
		String search_select = request.getParameter("search_select");
		String search_text = request.getParameter("search_text");
		
		System.out.println("search_select = " + search_select);
		System.out.println("search_text = " + search_text);
		
		int page=1;
		int limit=10;
		
		if(request.getParameter("page")!=null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		if(request.getParameter("limit") != null) {
			limit = Integer.parseInt(request.getParameter("limit"));
		}
		
		int listcount = boarddao.getListCount(search_select, search_text);
		System.out.println("listcount = " + listcount);
		
		//리스트를 받아온다.
		boardlist = boarddao.getBoardList(page, limit, search_select, search_text);
		
		int maxpage = (listcount+limit-1)/limit;
		int startpage = ((page-1) / 10) * 10 +1;
		int endpage = startpage + 10 -1;
		
		if(endpage > maxpage) endpage = maxpage;
		
		String state = request.getParameter("state");
		
		if(state == null) {
			System.out.println("state=null");
			request.setAttribute("page", page); //현재 페이지 수
			request.setAttribute("maxpage", maxpage); //최대 페이지 수
			request.setAttribute("startpage", startpage);
			request.setAttribute("endpage", endpage);
			request.setAttribute("listcount", listcount); //총 글의 수
			request.setAttribute("boardlist", boardlist);
			request.setAttribute("limit", limit);
			
			ActionForward forward = new ActionForward();
			
			forward.setRedirect(false);
			forward.setPath("board/qna_board_list.jsp");
		 	return forward; //BoardFrontController.java로 리턴된다.
		} else {
			System.out.println("state=ajax");
			JsonObject object = new JsonObject();
			object.addProperty("page", page);
			object.addProperty("maxpage",maxpage);
			object.addProperty("startpage", startpage);
			object.addProperty("endpage", endpage);
			object.addProperty("listcount",listcount);
			object.addProperty("limit", limit);	// 한 페이지에 나타낼 글 수
			// List => JsonArray
			JsonArray je = new Gson().toJsonTree(boardlist).getAsJsonArray();
			
			// List => JsonElement
			// JsonElement je = new Gson().toJsonTree(boardlist);
			System.out.println("je = " + je);
			object.add("boardlist", je);
			
			Gson gson = new Gson();
			String json = gson.toJson(object);
			
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().append(json);
			System.out.println(json);
			return null;
		}
}
}
