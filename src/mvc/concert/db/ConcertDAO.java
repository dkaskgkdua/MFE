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

import mvc.member.db.Member;

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
	public int delete(String id) {
		result = 0;
		try {
			con=ds.getConnection();
			System.out.println("getConnection");
			
			pstmt = con.prepareStatement("delete from concert where concert_id = ?");
			pstmt.setString(1,  id);
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			System.out.println("delete오류");
			e.printStackTrace();
		} finally {
			close();
		}
		
		return result;
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
	/* 관리자 페이지 콘서트 숫자*/
	public int getListCount(int concert_search_field, String concert_search_word) {
		int x = 0;
		String field = "";
		
		switch(concert_search_field) {
		case 0:  //ID
			field = " where concert_id like ";
			field += "'%"+concert_search_word+"%' ";
			break;
		case 1:  //이름
			field = " where concert_name like ";
			field += "'%"+concert_search_word+"%' ";
			break;
		case 2:   // 가수
			field = " where concert_musician like ";
			field += "'%"+concert_search_word+"%' ";
			break;
		case 3:   // 장르
			field = " where genre_name like ";
			field += "'%"+concert_search_word+"%' ";
			break;
		}
		System.out.println(" getListCount field = " + field);
		try { 
			con = ds.getConnection();
			pstmt= con.prepareStatement("select count(*) from concert inner join genre using(genre_id) "+field);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				x = rs.getInt(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("concert에 getListCount 에러" + e);
		} finally {
			close();
		}
		return x;
	}
	
	public List<ConcertBean> getConcertList(int concert_search_field, String concert_search_word, int concert_page, int concert_limit) {
		List<ConcertBean> list = new ArrayList<ConcertBean>();
		String field = "";

		
		switch(concert_search_field) {
		case 0:
			field = " where concert_id like ";
			field += "'%"+concert_search_word+"%' ";
			break;
		case 1:
			field = " where concert_name like ";
			field += "'%"+concert_search_word+"%' ";
			break;
		case 2:
			field = " where concert_musician like ";
			field += "'%"+concert_search_word+"%' ";
			break;
		case 3:
			field = " where genre_name like ";
			field += "'%"+concert_search_word+"%' ";
			
			break;
		}
		System.out.println("field = " + field);
		/*
		String sq = "select concert_id, concert_name, concert_day, concert_musician, concert_open, concert_close, concert_image, genre_name, local_name, concert_price" 
		+ "from concert inner join GENRE using(genre_id)" 
		+ "inner join LOCAL using(local_id)";
		*/
		
		try {
			con = ds.getConnection();
			
			String sql = "select concert_id, concert_name, concert_day, concert_musician, concert_open, concert_close, concert_image, genre_name, local_name, concert_price from (select b.*, rownum rnum "
					+                 " from (select * from concert inner join genre using(genre_id) inner join local using(local_id)  "
					+                   field
					+ "                 order by concert_id) b "
					+ 				   ") "
					+ "         where rnum >= ? and rnum<=? ";
			pstmt = con.prepareStatement(sql);
			int startrow = (concert_page-1) * concert_limit +1;
			int endrow = startrow + concert_limit -1;
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			rs = pstmt.executeQuery();
			
			
			
			while(rs.next()) {
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
		} catch(SQLException e) {
			System.out.println("콘서트 getList에서 에러");
			e.printStackTrace();
		} finally {
			close();
		}
		
		return null;
		
		
	}

}
