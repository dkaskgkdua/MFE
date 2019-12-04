package mvc.concert.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

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

	// 검색어 입력시 리스트
	public List<ConcertBean> getSearchList(String search_word) {
		List<ConcertBean> list = new ArrayList<ConcertBean>();

		try {
			con = ds.getConnection();
			String sql = "select C.CONCERT_ID, C.CONCERT_NAME, C.CONCERT_DAY, "
					+ "C.CONCERT_MUSICIAN, C.CONCERT_OPEN, C.CONCERT_CLOSE, "
					+ "C.CONCERT_IMAGE, G.GENRE_NAME, L.LOCAL_NAME, C.CONCERT_PRICE " 
					+ "from CONCERT C "
					+ "inner join GENRE G " 
					+ "on C.GENRE_ID = G.GENRE_ID " 
					+ "inner join LOCAL L "
					+ "on C.LOCAL_ID = L.LOCAL_ID " 
					+ "where C.CONCERT_NAME like ? " 
					+ "or C.CONCERT_MUSICIAN like ? ";

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
				c.setGenre_name(rs.getString(8));
				c.setLocal_name(rs.getString(9));
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

	// 필터시 리스트
	public List<ConcertBean> getSearchList(java.sql.Date search_date, String search_local, String search_genre) {
		List<ConcertBean> list = new ArrayList<ConcertBean>();

		try {
			con = ds.getConnection();
			String sql = "select C.CONCERT_ID, C.CONCERT_NAME, C.CONCERT_DAY, "
					+ "C.CONCERT_MUSICIAN, C.CONCERT_OPEN, C.CONCERT_CLOSE, "
					+ "C.CONCERT_IMAGE, G.GENRE_NAME, L.LOCAL_NAME, C.CONCERT_PRICE " 
					+ "from CONCERT C "
					+ "inner join GENRE G " 
					+ "on C.GENRE_ID = G.GENRE_ID " 
					+ "inner join LOCAL L "
					+ "on C.LOCAL_ID = L.LOCAL_ID " 
					+ "where C.CONCERT_DAY = ? " 
					+ "and L.LOCAL_NAME = ? "
					+ "and G.GENRE_NAME = ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setDate(1, search_date);
			pstmt.setString(2, search_local);
			pstmt.setString(3, search_genre);

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
				c.setGenre_name(rs.getString(8));
				c.setLocal_name(rs.getString(9));
				c.setConcert_price(rs.getString(10));

				list.add(c);
			}
		} catch (SQLException e) {
			System.out.println("getSearchList() 에러 : " + e);
			e.printStackTrace();
		} finally {
			close();
		}
		return null;
	}

}
