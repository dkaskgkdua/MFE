package mvc.book.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import mvc.concert.db.ConcertBean;

public class BookDAO {
	private DataSource ds; 
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	int result=0;
	
	public BookDAO(){
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			ds = (DataSource) envContext.lookup("jdbc/OracleDB");
		} catch (NamingException e) {
			System.out.println("DB연결실패");
			e.printStackTrace();
		}
	}

	public int getListCount() {
		int x = 0;
		try {
			con = ds.getConnection();
			
			String sql = "select count(*) from BOOK";
			pstmt = con.prepareStatement(sql);
		
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				//총 count 갯수를 뽑아와서 넣어줌
				x = rs.getInt(1);
			}
			
		}catch(Exception e) {
			System.out.println("getListCount() 에러 : " + e);
			e.printStackTrace();
		}finally {
	         if(pstmt != null) {
		            try {
		               pstmt.close();
		            } catch(SQLException ex) {
		               ex.printStackTrace();
		            }
		      }
		     if(con!=null) {
		            try {
		               con.close();
		            }catch(SQLException ex) {
		               ex.printStackTrace();
		            }
		     }
		}
		return x;
	}

	public List<BookBean> getBookList() {

		String sql = "select * from book inner join concert on book.concert_id = concert.concert_id";
		List<BookBean> list = new ArrayList<BookBean>();
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			// DB에서 가져온 데이터를 VO객체에 담습니다.
			while(rs.next()) {
				BookBean book = new BookBean();
				book.setBook_id(rs.getInt("BOOK_ID"));
				book.setBook_amount(rs.getInt("BOOK_AMOUNT"));
				book.setBook_date(rs.getDate("BOOK_DATE"));
				book.setBook_eticket(rs.getString("BOOK_ETICKET"));
				book.setMember_id(rs.getString("MEMBER_ID"));
				book.setConcert_day(rs.getDate("CONCERT_DAY"));
				book.setConcert_name(rs.getString("CONCERT_NAME"));
				list.add(book);
				
			}
			return list; // 값을 담은 객체를 저장한 리스틀 호출한 곳으로 가져갑니다.
		}catch(Exception e) {
			System.out.println("getBookList() 에러 : " + e);
			e.printStackTrace();
		}finally {
	         if(pstmt != null) {
		            try {
		               pstmt.close();
		            } catch(SQLException ex) {
		               ex.printStackTrace();
		            }
		      }
		     if(con!=null) {
		            try {
		               con.close();
		            }catch(SQLException ex) {
		               ex.printStackTrace();
		            }
		     }
		}
		return null;
	}

	public boolean isBook(int num, String pass) {		
		try {
			con = ds.getConnection();
			System.out.println("getConnection");
			
			String sql = "select * from book where BOOK_ID=?";
			String sql1 = "select member.member_password from member inner join book on member.member_id=book.member_id";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pstmt = con.prepareStatement(sql1);
				rs = pstmt.executeQuery();
				if(pass.equals(rs.getString(1))) {
					System.out.println(pass + "와 " + rs.getString(1) + "는 일치");
					return true;
				}
			}
		} catch(SQLException e) {
			System.out.println("isBook() 에러");
			e.printStackTrace();
		}finally {
	         if(pstmt != null) {
		            try {
		               pstmt.close();
		            } catch(SQLException ex) {
		               ex.printStackTrace();
		            }
		      }
		     if(con!=null) {
		            try {
		               con.close();
		            }catch(SQLException ex) {
		               ex.printStackTrace();
		            }
		     }
		}
		return false;
	}

	public boolean bookDelete(int num) {
		String sql = "delete * from book where BOOK_ID = ?";
	   	        
	      try {
	         con = ds.getConnection();
	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1,  num);
            int result = pstmt.executeUpdate();
            System.out.println(result + "개 삭제되었습니다.");
            if(result>=1)
               return true;  
         } catch (Exception e) {
            System.out.println("boardDelete() 에러 : "+ e);
            e.printStackTrace();
         } finally {
	         if(pstmt != null) {
		            try {
		               pstmt.close();
		            } catch(SQLException ex) {
		               ex.printStackTrace();
		            }
		      }
		     if(con!=null) {
		            try {
		               con.close();
		            }catch(SQLException ex) {
		               ex.printStackTrace();
		            }
		     }
		}       
	      return false; 
	}
}
