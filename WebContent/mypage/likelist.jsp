<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<div class="video col">
		<div class="image fit">
			<div class="item">
			<c:forEach var="l"  items="${likelist}">
				<img src='images/${l.concert_image }'/>
				<button type="button" class="btn btn-secondary heart" id="rec_update">
					<span class="glyphicon glyphicon-heart-empty rec_count" aria-hidden="true"></span>
				</button>
			</c:forEach>
			</div>
		</div>
	</div>
	
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
	

