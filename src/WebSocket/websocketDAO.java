package WebSocket;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class websocketDAO {
	
private Connection conn;
	
	private DataSource ds; 

	private PreparedStatement pstmt;

	private ResultSet rs;
	
	int result;
	
	public websocketDAO() {
		try {

			Context initContext = new InitialContext();

			Context envContext = (Context) initContext.lookup("java:comp/env/");

			ds = (DataSource) envContext.lookup("jdbc/OracleDB");

		} catch (NamingException e) {

			e.printStackTrace();

		}

	}
	
	private void close() {

		try {

		if(rs != null) {rs.close(); rs=null;}

		if(pstmt != null) {pstmt.close(); pstmt=null;}

		if(conn != null) {conn.close(); conn=null;}

		} catch(SQLException e) {

		e.printStackTrace();

		}

		}
	

	public int submit(websocketVO vo) {
		System.out.print("채팅내용 삽입");
	
	int result = 0;
	try {
		conn = ds.getConnection();
		System.out.println("getConnection");
		pstmt = conn.prepareStatement("insert into chat (CHAT_LOG_ID, MEMBER_ID, CHAT_LOG_CONTENT, CHAT_LOG_DATE)  values(chat_seq.nextval,?,?,sysdate)");
		pstmt.setString(1, vo.getId());
		pstmt.setString(2, vo.getChatContent());
		result = pstmt.executeUpdate();	
										
	} catch (SQLException e) {
		e.printStackTrace();
	}
	finally {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException ex) {
				ex.printStackTrace();

			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}
	}
	return result;


}
	
	public int sessId(websocketVO2 vo) {
		System.out.print("세션 아이디 및 아이디 삽입");
	
	int result = 0;
	try {
		conn = ds.getConnection();
		System.out.println("getConnection");
		pstmt = conn.prepareStatement("insert into sessId (id)  values(?)");
		pstmt.setString(1, vo.getId());

		result = pstmt.executeUpdate();	
										
	} catch (SQLException e) {
		e.printStackTrace();
	}
	finally {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException ex) {
				ex.printStackTrace();

			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}
	}
	return result;


}
	
	
	public int sessIdDelete(String id) {
		   result = 0;
			try {
				conn = ds.getConnection();
				System.out.println("getConnection");
				
				String sql = "delete from sessId where id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				result = pstmt.executeUpdate();
				System.out.println("seddId 삭제 완료");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close();            				
			}
			 return result;
	}
	
	
	
	
	
	
	
	
	public int idInsert(String id) {
		System.out.print("아이디 인서트");
	
	int result = 0;
	try {
		conn = ds.getConnection();
		System.out.println("getConnection");
		pstmt = conn.prepareStatement("insert into chatmem (id)  values(?)");
		pstmt.setString(1, id);
		result = pstmt.executeUpdate();	
										
	} catch (SQLException e) {
		e.printStackTrace();
		System.out.println("아이디 입력 실패");
	}
	finally {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException ex) {
				ex.printStackTrace();

			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}
	}
	return result;


}
		/*
	public int idDelete(String id) {
		   result = 0;
			try {
				conn = ds.getConnection();
				System.out.println("getConnection");
				
				String sql = "delete from chatmem where id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);	
				result = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close();            				
			}
			 return result;
		}
	*/
	
	public websocketVO2  sessionId(String id) {
        websocketVO2 v = null;
       try {
     	  conn = ds.getConnection();
     	  String sql = "select * from sessId where id = ?";
     	  pstmt = conn.prepareStatement(sql);
     	  pstmt.setString(1, id);
     	  rs = pstmt.executeQuery();
     	  if(rs.next()) {
     		  v=new websocketVO2();
     		  v.setId(rs.getString(1));
     
     	  } 
         } catch (SQLException e) {
     		  System.out.println("info() 실패 :" + e);
     		  e.printStackTrace();
     	  } finally {
     		  close();
     	  }
     	  return v;
       }
	

	
   
	
	public List<websocketVO> VOList()  {
		 List<websocketVO> VOList = null;
			try {
				conn = ds.getConnection();
						
				String sql = "select * from chat";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();																	
				
				int cnt = 0;
				while(rs.next()) {
					cnt++;
					if(cnt==1)
						VOList  = new ArrayList<websocketVO>();
					
					String chatContent = rs.getString("1");
					Date chatTime = rs.getDate("2");
					
					websocketVO VO = new websocketVO();
					VO.setChatContent(chatContent);
					VO.setChatTime(chatTime);
					
					VOList.add(VO);
					
					
				}

				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException ex) {
						ex.printStackTrace();
					}
				}

			}
			return VOList;

	}

	public void select(String string) {
		
		
	}
	
}
