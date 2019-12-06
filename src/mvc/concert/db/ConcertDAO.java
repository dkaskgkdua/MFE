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
					+ "inner join GENRE G " + "on C.GENRE_ID = G.GENRE_ID " 
					+ "inner join LOCAL L "
					+ "on C.LOCAL_ID = L.LOCAL_ID " + "where C.CONCERT_NAME like ? " 
					+ "or C.CONCERT_MUSICIAN like ? "
					+ "order by C.CONCERT_DAY";

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

	// 필터에서 date 선택시
	public List<ConcertBean> getDateList(Date search_date) {
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
					+ "where CONCERT_DAY = ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setDate(1, (java.sql.Date) search_date);
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
			System.out.println("getDateList() 에러 : " + e);
			e.printStackTrace();
		} finally {
			close();
		}
		return null;
	}

	// 필터에서 local
	public List<ConcertBean> getLocalList(String[] search_local) {
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
					+ "where L.LOCAL_NAME = ";

			for (int i = 0; i < search_local.length; i++) {
				if (i == search_local.length - 1)
					sql += " ? ";
				else
					sql += " ? or L.LOCAL_NAME = ";
			}

			pstmt = con.prepareStatement(sql);
			for (int i = 0; i < search_local.length; i++) {
				pstmt.setString(i + 1, search_local[i]);
			}

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
			System.out.println("getLocalList() 에러 : " + e);
			e.printStackTrace();
		} finally {
			close();
		}
		return null;
	}

	// 필터에서 genre
	public List<ConcertBean> getGenreList(String[] search_genre) {
		List<ConcertBean> list = new ArrayList<ConcertBean>();

		try {
			con = ds.getConnection();
			String sql = "select C.CONCERT_ID, C.CONCERT_NAME, C.CONCERT_DAY, "
					+ "C.CONCERT_MUSICIAN, C.CONCERT_OPEN, C.CONCERT_CLOSE, "
					+ "C.CONCERT_IMAGE, G.GENRE_NAME, L.LOCAL_NAME, C.CONCERT_PRICE  " 
					+ "from CONCERT C "
					+ "inner join GENRE G " 
					+ "on C.GENRE_ID = G.GENRE_ID " 
					+ "inner join LOCAL L "
					+ "on C.LOCAL_ID = L.LOCAL_ID " 
					+ "where G.GENRE_NAME = ";

			for (int i = 0; i < search_genre.length; i++) {
				if (i == search_genre.length - 1)
					sql += " ? ";
				else
					sql += " ? or G.GENRE_NAME = ";
			}

			pstmt = con.prepareStatement(sql);
			for (int i = 0; i < search_genre.length; i++) {
				pstmt.setString(i + 1, search_genre[i]);
			}

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
			System.out.println("getGenreList() 에러 : " + e);
			e.printStackTrace();
		} finally {
			close();
		}
		return null;
	}

	// 필터 date + local + genre
	public List<ConcertBean> getFilterList(List<Integer> list) {
		List<ConcertBean> flist = new ArrayList<ConcertBean>();

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
					+ "where C.CONCERT_ID = ";

			for (int i = 0; i < list.size(); i++) {
				if (i == list.size() - 1)
					sql += " ? ";
				else
					sql += " ? or CONCERT_ID = ";
			}
			sql += "order by C.CONCERT_DAY";

			pstmt = con.prepareStatement(sql);
			for (int i = 0; i < list.size(); i++) {
				pstmt.setInt(i + 1, list.get(i));
			}

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

				flist.add(c);
			}
			return flist;
		} catch (SQLException e) {
			System.out.println("getFilterList() 에러 : " + e);
			e.printStackTrace();
		} finally {
			close();
		}
		return null;
	}

	public List<ConcertBean> getLGList(String[] search_local, String[] search_genre) {
		List<ConcertBean> flist = new ArrayList<ConcertBean>();
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
					+ "where L.LOCAL_NAME = ";

			for (int i = 0; i < search_local.length; i++) {
				if (i == search_local.length - 1)
					sql += " ? ";
				else
					sql += " ? or L.LOCAL_NAME = ";
			}
			sql += " and G.GENRE_NAME = ";

			for (int i = 0; i < search_genre.length; i++) {
				if (i == search_genre.length - 1)
					sql += " ? ";
				else
					sql += " ? or G.GENRE_NAME = ";
			}
			sql += "order by L.LOCAL_ID, G.GENRE_ID";

			pstmt = con.prepareStatement(sql);
			for (int i = 0; i < search_local.length; i++) {
				pstmt.setString(i + 1, search_local[i]);
			}

			for (int j = 0; j < search_genre.length; j++) {
				pstmt.setString(j + search_local.length + 1, search_genre[j]);
			}

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

				flist.add(c);
			}
			return flist;
		} catch (SQLException e) {
			System.out.println("getLGList() 에러 : " + e);
			e.printStackTrace();
		} finally {
			close();
		}
		return null;
	}

	public List<ConcertBean> getDGList(java.sql.Date search_date, String[] search_genre) {
		List<ConcertBean> flist = new ArrayList<ConcertBean>();
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
					+ "where CONCERT_DAY = ? and G.GENRE_NAME = ";

			for (int i = 0; i < search_genre.length; i++) {
				if (i == search_genre.length - 1)
					sql += " ? ";
				else
					sql += " ? or G.GENRE_NAME = ";
			}
			sql += "order by C.CONCERT_DAY, G.GENRE_ID";
			pstmt = con.prepareStatement(sql);
			pstmt.setDate(1, search_date);
			for (int i = 0; i < search_genre.length; i++) {
				pstmt.setString(i + 2, search_genre[i]);
			}

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

				flist.add(c);
			}
			return flist;
		} catch (SQLException e) {
			System.out.println("getDGList() 에러 : " + e);
			e.printStackTrace();
		} finally {
			close();
		}
		return null;
	}

	public List<ConcertBean> getDLList(java.sql.Date search_date, String[] search_local) {
		List<ConcertBean> flist = new ArrayList<ConcertBean>();
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
					+ "where CONCERT_DAY = ? and G.GENRE_NAME = ";

			for (int i = 0; i < search_local.length; i++) {
				if (i == search_local.length - 1)
					sql += " ? ";
				else
					sql += " ? or G.GENRE_NAME = ";
			}
			sql += "order by C.CONCERT_DAY, G.GENRE_ID";

			pstmt = con.prepareStatement(sql);
			pstmt.setDate(1, search_date);
			for (int i = 0; i < search_local.length; i++) {
				pstmt.setString(i + 2, search_local[i]);
			}

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

				flist.add(c);
			}
			return flist;
		} catch (SQLException e) {
			System.out.println("getDLList() 에러 : " + e);
			e.printStackTrace();
		} finally {
			close();
		}
		return null;
	}
	
	// 모든 날짜, 전국, 전체 장르 선택시
	public List<ConcertBean> getAllList(){
		List<ConcertBean> flist = new ArrayList<ConcertBean>();
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
					+ "order by C.CONCERT_DAY";

			pstmt = con.prepareStatement(sql);

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

				flist.add(c);
			}
			return flist;
		} catch (SQLException e) {
			System.out.println("getAllList() 에러 : " + e);
			e.printStackTrace();
		} finally {
			close();
		}
		return null;
	}
}
