package WebSocket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/websocket")



public class websocket  {
	private static final List<websocketVO2> sessionList = new ArrayList<websocketVO2>();

	/***
	 * 웹 소켓이 연결되면 호출되는 이벤트
	 */
	@OnOpen
	public void handleOpen(Session session) {
		websocketVO2 vo = new websocketVO2();
       
		System.out.println("=================입장=============================");
		System.out.println("쿼리 스트링 : " + session.getQueryString());
		System.out.println(session.getId() + " : 세션 아이디 값");
		if(session.getQueryString().equals("admin@mfe.com")) {
    	   vo.setConnected(true);
       }
		
		if(session.getQueryString().equals("gg1213")) {
			vo.setConnected(true);
		}
	
		String id = session.getQueryString();

		

		vo.setId(id);
		vo.setSession(session);
		//vo.setConnected(false);
		System.out.println("isConn: " + vo.isConnected());
		sessionList.add(vo);
	
		
		websocketDAO dao = new websocketDAO();
        dao.sessId(vo);
	
	}

	/**
	 * 웹 소켓으로부터 메시지가 오면 호출되는 이벤트
	 * 
	 * @param message
	 * @return
	 */
	@OnMessage
	public void  handleMessage(Session session, String message) throws IOException {

		
		
		/*
		for(int i =0; i< sessionList.size(); i++) {
			System.out.println(sessionList.get(i) + " : 세션 값 조회");
		}
		*/
		
		 
		
		String id = session.getQueryString();
		String chatContent = message;
		
		websocketVO vo = new websocketVO();
		vo.setId(id);
		vo.setChatContent(chatContent);
		
		sendAllSessionToMessage(session, message);
		websocketDAO dao = new websocketDAO();
		dao.submit(vo);
		
		
	}
	
	private void sendAllSessionToMessage(Session self,String message)  {
	         
        try {
            for(websocketVO2 vo : sessionList) {
          
                
            	if(vo.isConnected()) {//나를 제외한 사람에게 보냅니다.
                    vo.getSession().getBasicRemote()
                    		.sendText(message);

                } 
              

                  
      
             
            }
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

	

	/**
	 * 웹 소켓이 닫히면 호출되는 이벤트
	 */
	@OnClose
	public void handleClose(Session session) {
		
		websocketDAO dao = new websocketDAO();
		dao.idDelete(session.getQueryString());
		dao.sessIdDelete(session.getQueryString());
		System.out.println("client is now disconnected...");
		 sessionList.remove(session);
		
		
	}

	/**
	 * 웹 소켓이 에러가 나면 호출되는 이벤트
	 * 
	 */
	@OnError
	public void handleError(Throwable t) {
		System.out.println("error");
		t.printStackTrace();
	}
	

}