<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>

			<div class="table-responsive text-nowrap">
                  <table class="table table-hover">
                    <thead class="table-light">
                      <tr>
                        <th>사원 번호</th>
                        <th>사원 이름</th>
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                     <c:forEach items="${mlist}"  var="voo">
                      <tr>
                        <td>${voo.member_id}</td>
                        <td>${voo.username}</td>
                      </tr>
                     </c:forEach>
                    </tbody>
                  </table>
                </div>
