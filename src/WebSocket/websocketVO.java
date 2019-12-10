package WebSocket;

import java.sql.Date;

public class websocketVO {
	private String id;
	private String chatContent;
  private Date chatTime;

  

  
  public String getChatContent() {
	return chatContent;
}
public void setChatContent(String chatContent) {
	this.chatContent = chatContent;
}
public Date getChatTime() {
	return chatTime;
}
public void setChatTime(Date chatTime) {
	this.chatTime = chatTime;
}

public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}

  

}
