package mvc.member.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("*.net")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public FrontController() {
        super();
    }
    
    protected void doProcess(HttpServletRequest request,
    							HttpServletResponse response)
    	throws ServletException, IOException {
    	/* 요청된 전체 URL 중에서 포트 번호 다음 부터 마지막 문자열까지 반환된다.
    	 * 예) http://localhost:8088/JspProject/login.net인 경우
    	 * "/JspProject/login.net" 반환됩니다.
    	 * */
    	String RequestURI = request.getRequestURI();
    	System.out.println("RequestURI = " + RequestURI);
    	
    	// getContextPath() : 컨텍스트 경로가 반환됩니다.
    	// contextPath는 "/JspProject"가 반환됩니다.
    	String contextPath = request.getContextPath();
    	System.out.println("contextPath = " + contextPath);
    	
    	// RequestURI에서 컨텍스트 경로 길이 값의 인덱스 위치의 문자로부터
    	// 마지막 위치 문자까지 추출합니다.
    	// command는 "/login.net" 반환됩니다.
    	String command = RequestURI.substring(RequestURI.lastIndexOf("/"));
    	System.out.println("command = " + command);
    	
    	//초기화
    	ActionForward forward = null;
    	Action action=null;
    	if(command.equals("/main.net")) {
    		forward=new ActionForward();
    		forward.setRedirect(false);//주소 변경없이 jsp페이지의 내용을 보여줌
    		forward.setPath("mainActivity/main.jsp");
    	} else if(command.equals("/idcheck.net")) {
    		action = new IdCheckAction();
    		try {
    			forward=action.execute(request, response);
    		} catch(Exception e) {
    			e.printStackTrace();
    		}
    	} else if(command.equals("/joinProcess.net")) {
    		action = new JoinProcessAction2();
    		try {
    			forward = action.execute(request, response);
    		} catch(Exception e) {
    			e.printStackTrace();
    		}
    	} else if(command.equals("/loginProcess.net")) {
    		action = new LoginProcessAction();
    		try {
    			forward = action.execute(request, response);
    		} catch(Exception e) {
    			e.printStackTrace();
    		}
    	} else if(command.equals("/logOut.net")) {
    		action = new LogoutAction();
    		try {
    			forward= action.execute(request, response);
    		} catch(Exception e) {
    			e.printStackTrace();
    		}
    		/*
    		HttpSession session = request.getSession();
    		session.invalidate();
    		forward =new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("mainActivity/main.jsp");
    		*/
    	} else if(command.equals("/member_update.net")) {
    		action = new Member_updateAction();
    		try {
    			forward = action.execute(request, response);
    		} catch(Exception e) {
    			e.printStackTrace();
    		}
    	} else if(command.equals("/updateProcess.net")) {
    		action = new UpdateProcessAction();
    		try {
    			forward = action.execute(request, response);
    		} catch(Exception e) {
    			e.printStackTrace();
    		}
    	} else if(command.equals("/adminPage.net")) {
    		action = new ListAction();
    		try {
    			forward = action.execute(request, response);
    		} catch(Exception e) {
    			e.printStackTrace();
    		}
    		
    	}     else if(command.equals("/member_delete.net")) {
    		action = new Member_deleteAction();
    		try {
    			forward= action.execute(request,  response);
    		} catch(Exception e) {
    			e.printStackTrace();
    		}
    	} else if(command.equals("/member_info.net")) {
    		action = new Member_infoAction();
    		try {
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}
    	
    	if(forward !=null) {
    		if(forward.isRedirect()) { //리다이렉트 된다.
    			response.sendRedirect(forward.getPath());
    		} else { //포워딩된다.
    			RequestDispatcher dispatcher =
    					request.getRequestDispatcher(forward.getPath());
    					  dispatcher.forward(request, response);
    		}
    	}
    }
    
    
//get이든 post든 dpProcess메서드를 구현하여 처리하도록 하였음.
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
