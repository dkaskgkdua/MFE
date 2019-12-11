package mvc.chat.db;

import java.util.Date;

public class ChatBean {
	private String chat_log_id, member_id, chat_log_answer, chat_log_content;
	private Date chat_log_date;
	
	public String getChat_log_id() {
		return chat_log_id;
	}
	public void setChat_log_id(String chat_log_id) {
		this.chat_log_id = chat_log_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getChat_log_answer() {
		return chat_log_answer;
	}
	public void setChat_log_answer(String chat_log_answer) {
		this.chat_log_answer = chat_log_answer;
	}
	public String getChat_log_content() {
		return chat_log_content;
	}
	public void setChat_log_content(String chat_log_content) {
		this.chat_log_content = chat_log_content;
	}
	public Date getChat_log_date() {
		return chat_log_date;
	}
	public void setChat_log_date(Date chat_log_date) {
		this.chat_log_date = chat_log_date;
	}

}
