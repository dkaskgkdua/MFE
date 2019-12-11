package mvc.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mvc.member.db.MemberDAO;

public class LoginProcessAction  implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String id = request.getParameter("login_id");
		String pass = request.getParameter("login_pass");
		MemberDAO dao = new MemberDAO();
		int result = dao.isId(id, pass);
		System.out.println(result + "를 반환");
		
	
		if(result==1) { //아이디 비밀번호 일치
			HttpSession session = request.getSession();
			//로그인 성공
			session.setAttribute("id", id);
			forward.setRedirect(true);
			forward.setPath("main.net");
			//forward.setPath("BoardList.bo");
			return forward;
		
		}  else {   // 아이디,비밀번호 가 존재하지 않음
			String message = "비밀번호가 일치하지 않습니다.";
			if(result == -1)
				message = "아이디가 존재하지 않습니다.";
			
			System.out.println(message);
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println("alert('"+message+"');");
			out.println("location.href ='main.net';");
			out.println("</script>");
			out.close();
			return null;
		}
	}
}
