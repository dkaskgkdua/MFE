package mvc.concert.db;

import java.sql.Date;

public class ConcertBean {

	private int concert_id;
	private String concert_name;
	private Date concert_day;
	private String concert_musician;
	private String concert_open;
	private String concert_close;
	private String concert_image;
	private int genre_id;
	private String genre_name;
	private int local_id;
	private String local_name;
	private String concert_price;
	
	public int getConcert_id() {
		return concert_id;
	}
	public void setConcert_id(int concert_id) {
		this.concert_id = concert_id;
	}
	public String getConcert_name() {
		return concert_name;
	}
	public void setConcert_name(String concert_name) {
		this.concert_name = concert_name;
	}
	public Date getConcert_day() {
		return concert_day;
	}
	public void setConcert_day(Date concert_day) {
		this.concert_day = concert_day;
	}
	public String getConcert_musician() {
		return concert_musician;
	}
	public void setConcert_musician(String concert_musician) {
		this.concert_musician = concert_musician;
	}
	public String getConcert_open() {
		return concert_open;
	}
	public void setConcert_open(String concert_open) {
		this.concert_open = concert_open;
	}
	public String getConcert_close() {
		return concert_close;
	}
	public void setConcert_close(String concert_close) {
		this.concert_close = concert_close;
	}
	public String getConcert_image() {
		return concert_image;
	}
	public void setConcert_image(String concert_image) {
		this.concert_image = concert_image;
	}
	public int getGenre_id() {
		return genre_id;
	}
	public void setGenre_id(int genre_id) {
		this.genre_id = genre_id;
	}
	public String getGenre_name() {
		return genre_name;
	}
	public void setGenre_name(String genre_name) {
		this.genre_name = genre_name;
	}
	public int getLocal_id() {
		return local_id;
	}
	public void setLocal_id(int local_id) {
		this.local_id = local_id;
	}
	public String getLocal_name() {
		return local_name;
	}
	public void setLocal_name(String local_name) {
		this.local_name = local_name;
	}
	public String getConcert_price() {
		return concert_price;
	}
	public void setConcert_price(String concert_price) {
		this.concert_price = concert_price;
	}

}