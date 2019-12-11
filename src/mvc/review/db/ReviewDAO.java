package mvc.review.db;

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

public class ReviewDAO {
	private DataSource ds; 
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	int result = 0;
	public ReviewDAO() {
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/OracleDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public int getListCount() {
		int x = 0;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select count(*) from review");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				x = rs.getInt(1);
			}
		} catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("getListCount() 에러 : " + ex);
		} finally {
			close();
		}
		return x;
	}
	
	
	public List<ReviewBean> getReviewList(int page, int limit) {
		
		String sql = "select * from (select rownum rnum, b.* "
				+ "from (select * from review inner join concert "
				+ "on concert.concert_id=review.concert_id "
				+ "order by review.review_date desc) b ) "
				+ "where rnum >= ? and rnum <= ?";
		List<ReviewBean> list = new ArrayList<ReviewBean>();
		
		int startrow = (page-1) * limit +1;
		int endrow = startrow + limit -1;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ReviewBean review = new ReviewBean();
				review.setReview_id(rs.getInt("REVIEW_ID"));
				review.setMember_id(rs.getString("MEMBER_ID"));
				review.setReview_title(rs.getString("REVIEW_TITLE"));
				review.setReview_content(rs.getString("REVIEW_CONTENT"));
				review.setReview_date(rs.getDate("REVIEW_DATE"));
				review.setReview_readcount(rs.getInt("REVIEW_READCOUNT"));
				review.setConcert_name(rs.getString("CONCERT_NAME"));
				review.setConcert_image(rs.getString("CONCERT_IMAGE"));
				list.add(review);
			}
			return list;
		} catch(Exception ex) {
			System.out.println("getReviewList() 에러 : " + ex);
			ex.printStackTrace();
		} finally {
			close();
		}
		return null;
	}
	public boolean isReviewWriter(int num, String pass) {		
		try {
			con = ds.getConnection();
			System.out.println("getConnection");
			
			String sql = "select * from review where review_id=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(pass.equals(rs.getString("REVIEW_PASS"))) {
					System.out.println(pass + "와 " + rs.getString("REVIEW_PASS") + "는 일치");
					return true;
				}
			}
		} catch(SQLException e) {
			System.out.println("isReviewWriter() 에러");
			e.printStackTrace();
		}finally {
			close();
		}
		return false;
	}
	
	public void setReadCountUpdate(int num) {
		try {
			con = ds.getConnection();
			System.out.println("getConnection");
			
			String sql = "update review set REVIEW_READCOUNT= REVIEW_READCOUNT + 1 where REVIEW_ID = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = 1;	  // 업데이트 성공		
			} else {
				result = -1;  // 업데이트 실패(없음)
			}
		} catch(SQLException e) {
			System.out.println("setReadCountUpdate 에러" + e);
			e.printStackTrace();
		}finally {
			close();
		}
		System.out.println("읽음 수 업뎃 결과 = " + result);
	}
	
	public ReviewBean getDetail(int num) {
		ReviewBean review = new ReviewBean();
		
		try {
		con = ds.getConnection();
		System.out.println("getConnection");
		
		pstmt = con.prepareStatement("select * from review inner join concert on concert.concert_id=review.concert_id where review_id = ?");
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();
		System.out.println("num="+num);
		
		if (rs.next()) {
			review.setReview_id(rs.getInt("REVIEW_ID"));
			review.setMember_id(rs.getString("MEMBER_ID"));
			review.setReview_title(rs.getString("REVIEW_TITLE"));
			review.setReview_content(rs.getString("REVIEW_CONTENT"));
			review.setReview_readcount(rs.getInt("REVIEW_READCOUNT"));
			review.setReview_date(rs.getDate("REVIEW_DATE"));
			review.setConcert_image(rs.getString("CONCERT_IMAGE"));
			review.setConcert_name(rs.getString("CONCERT_NAME"));
		}
		
		} catch(SQLException e) {
			System.out.println("getDetail() 에러 : " + e);
			e.printStackTrace();
		}finally {
			close();
		}
		
		return review;
		
	}
	
	public boolean reviewModify(ReviewBean modifyreview) {
		String sql = "update review "
				   + "set    review_title = ?, review_content = ? "
				   + "where  review_id = ? ";
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,  modifyreview.getReview_title());
			pstmt.setString(2,  modifyreview.getReview_content());
			pstmt.setInt(3,  modifyreview.getReview_id());
			int result = pstmt.executeUpdate();
			if(result == 1)
				return true;
		} catch(Exception ex) {
			System.out.println("reviewModify() 에러 : " + ex);
			ex.printStackTrace();
		} finally {
			close();
		}
		return false;
	}
	
	public boolean reviewInsert(ReviewBean review) {
		try {
			con = ds.getConnection();
			System.out.println("getConnection");
			pstmt = con.prepareStatement("INSERT INTO review(review_id, member_id, review_pass, review_title, review_content, review_readcount, reivew_date) VALUES (review_seq.nextval, ?, ?, ?, ?, 0, sysdate)");
	
			pstmt.setString(1, review.getMember_id());
			pstmt.setString(2, review.getReview_pass());
			pstmt.setString(3, review.getReview_title());
			pstmt.setString(4, review.getReview_content());
			
			
			result = pstmt.executeUpdate();
			System.out.println("리뷰 삽입 결과 = " + result);
		} catch(SQLException e) {
			System.out.println("reviewInsert() 에러 : " + e);
			e.printStackTrace();
		}finally {
			close();
		}
		return (result==1) ? true:false;
		
	}
	public int  reviewDelete(int num) {
	      result=0;
	      String sql = "delete from review where review_id = ?";
	        
	      try {
		         con = ds.getConnection();
		         pstmt = con.prepareStatement(sql);
		         pstmt.setInt(1,  num);
		         result = pstmt.executeUpdate();
		         
	            System.out.println("삭제 성공");        
	         } catch (Exception e) {
	            System.out.println("reviewDelete() 에러 : "+ e);
	            e.printStackTrace();
	         } finally {
	          close();                        
	      }            
	      return result;      
	   } 
	private void close() {
		try {
			if(rs != null) {rs.close(); rs=null;}
			if(pstmt != null) {pstmt.close(); pstmt=null;}
			if(con != null) {con.close(); con=null;}
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
}
