<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<c:forEach var="l"  items="${likelist}">
	<div class="video col">
		<div class="image fit">
			<div class="item">			
				<img src='concertupload/${l.concert_image }' class="likeimg"/>
				<button type="button" class="btn btn-secondary heart" id="rec_update">
					<span class="glyphicon glyphicon-heart rec_count " aria-hidden="true"></span>
				</button>
			</div>
			<div>${l.concert_name }</div>
		</div>
	</div>
	</c:forEach>
	
	<!-- 
		<c:if test="${ id == null }">
				<button type="button" class="btn btn-secondary heart" id="rec_update">
					<span class="glyphicon glyphicon-heart-empty rec_count" aria-hidden="true"></span>
				</button>				
			</c:if>
			<c:if test="${ id != null }">
				<button type="button" class="btn btn-secondary heart" id="rec_update">
					<span class="glyphicon glyphicon-heart-empty rec_count" aria-hidden="true"></span>
				</button>
			</c:if>
	 -->
	

