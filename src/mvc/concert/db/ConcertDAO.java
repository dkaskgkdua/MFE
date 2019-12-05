package mvc.concert.db;

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

import mvc.book.db.BookBean;

public class ConcertDAO {
	private DataSource ds;
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	int result = 0;

	public ConcertDAO() {
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			ds = (DataSource) envContext.lookup("jdbc/OracleDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private void close() {
		try {
			if (rs != null) {
				rs.close();
				rs = null;
			}
			if (pstmt != null) {
				pstmt.close();
				pstmt = null;
			}
			if (con != null) {
				con.close();
				con = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List<ConcertBean> getSearchList(String search_word) {
		List<ConcertBean> list = new ArrayList<ConcertBean>();

		try {
			con = ds.getConnection();
			String sql = "select * from CONCERT " 
					+ "where CONCERT_NAME like ? " 
					+ "or CONCERT_MUSICIAN like ? ";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + search_word + "%");
			pstmt.setString(2, "%" + search_word + "%");

			rs = pstmt.executeQuery();
			while (rs.next()) {
				ConcertBean c = new ConcertBean();
				c.setConcert_id(rs.getInt(1));
				c.setConcert_name(rs.getString(2));
				c.setConcert_day(rs.getDate(3));
				c.setConcert_musician(rs.getString(4));
				c.setConcert_open(rs.getString(5));
				c.setConcert_close(rs.getString(6));
				c.setConcert_image(rs.getString(7));
				c.setGenre_id(rs.getString(8));
				c.setLocal_id(rs.getString(9));
				c.setConcert_price(rs.getString(10));

				list.add(c);
			}
			return list;
		} catch (SQLException e) {
			System.out.println("getSearchList() 에러 : " + e);
			e.printStackTrace();
		} finally {
			close();
		}
		return null;
	}

	public List<ConcertBean> getList(String string) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<ConcertBean> getLikeList(String id) {

		String sql = "select * from concert inner join likey on concert.concert_id = likey.concert_id "
				+ "where likey.member_id=? order by likey.likey_id desc";
		List<ConcertBean> list = new ArrayList<ConcertBean>();
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			// DB에서 가져온 데이터를 VO객체에 담습니다.
			while(rs.next()) {
				ConcertBean c = new ConcertBean();
				c.setConcert_image(rs.getString(7));
				c.setConcert_name(rs.getString("CONCERT_NAME"));
				list.add(c);
				
			}
			return list; // 값을 담은 객체를 저장한 리스틀 호출한 곳으로 가져갑니다.
		}catch(Exception e) {
			System.out.println("getLikeList() 에러 : " + e);
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


}
