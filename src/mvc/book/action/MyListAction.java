package mvc.book.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import mvc.book.db.BookBean;
import mvc.book.db.BookDAO;
import mvc.chat.db.ChatBean;
import mvc.chat.db.ChatDAO;
import mvc.concert.db.ConcertBean;
import mvc.concert.db.ConcertDAO;
import mvc.member.db.Member;
import mvc.member.db.MemberDAO;

public class MyListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("euc-kr");
		
		//booklist
		
			BookDAO bookdao = new BookDAO();
			List<BookBean> booklist = new ArrayList<BookBean>();
		
			int listcount = bookdao.getListCount();
			
			booklist = bookdao.getBookList();
		
			request.setAttribute("listcount",listcount); //총 글의 수
			
			request.setAttribute("booklist", booklist);
			
			ActionForward forward = new ActionForward();
			
		//likelist
			
			ConcertDAO cdao = new ConcertDAO();
			List<ConcertBean> likelist = new ArrayList<ConcertBean>();
		
			likelist = cdao.getLikeList();
			
			
			request.setAttribute("likelist", likelist);
			
			
		//info_update
			
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("id");
			MemberDAO mdao = new MemberDAO();
			Member m = mdao.member_info(id);
			if(m==null) {
				System.out.println("정보 가져오기 실패");
				forward.setRedirect(false);
				request.setAttribute("message", "정보 가져오기 실패입니다.");
				forward.setPath("error/error.jsp");
				return forward;
			}
			
		//chatlist
			
			ChatDAO chatdao = new ChatDAO();
			List<ChatBean> chatlist = new ArrayList<ChatBean>();
		
			int chatlistcount = chatdao.getListCount();
			
			chatlist = chatdao.getChatList();
		
			request.setAttribute("chatlistcount",chatlistcount); //총 글의 수
			
			request.setAttribute("chatlist", chatlist);
			
		
		//경로
			
			
			forward.setPath("mypage/mypage.jsp");
			forward.setRedirect(false);
			request.setAttribute("memberinfo", m);
			return forward;
		
		
		
	}

}
