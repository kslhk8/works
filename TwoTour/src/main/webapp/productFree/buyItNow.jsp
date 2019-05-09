<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
결제창으로 데이터 연결하기
<br>
${airplaneDTO}
<br><br>
<c:if test='${airplaneDTO_RT != null}'>
${airplaneDTO_RT}
</c:if>