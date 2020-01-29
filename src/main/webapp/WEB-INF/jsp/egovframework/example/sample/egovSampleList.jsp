<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
  /**
  * @Class Name : egovSampleList.jsp
  * @Description : Sample List 화면
  * @Modification Information
  *
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2009.02.01            최초 생성
  *
  * author 실행환경 개발팀
  * since 2009.02.01
  *
  * Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title><spring:message code="title.sample" /></title>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    
    <link rel="stylesheet" href="<c:url value='/js/jquery-ui-1.12.0/jquery-ui.min.css'/>"/>
	<script src="<c:url value="/js/jquery-3.1.0.min.js"/>"></script>
	<script src="<c:url value="/js/jquery-ui-1.12.0/jquery-ui.min.js"/>"></script>
	<script src="<c:url value="/js/jquery.fileDownload.js"/>"></script>
    
    <script type="text/javaScript" language="javascript" defer="defer">
    
        <!--
        /* function fn_egov_addExcel() {
           	document.listForm.action = "<c:url value='/excelDown.do'/>";
           	document.listForm.submit(); */
        
        /* 글 수정 화면 function */
        function fn_egov_select(id) {
        	document.listForm.selectedId.value = id;
           	document.listForm.action = "<c:url value='/updateSampleView.do'/>";
           	document.listForm.submit();
        }
        
        /* 글 등록 화면 function */
        function fn_egov_addView() {
           	document.listForm.action = "<c:url value='/addSample1.do'/>";
           	document.listForm.submit();
        }
        
        /* 글 목록 화면 function */
        function fn_egov_selectList() {
        	document.listForm.action = "<c:url value='/egovSampleList.do'/>";
           	document.listForm.submit();
        }
        
        /* pagination 페이지 링크 function */
        function fn_egov_link_page(pageNo){
        	document.listForm.pageIndex.value = pageNo;
        	document.listForm.action = "<c:url value='/egovSampleList.do'/>";
           	document.listForm.submit();
        }
        
        /* 엑셀다운로드 function */
        function fn_egov_excelDown() {
        	document.listForm.action = "<c:url value='/excelDown.do'/>";
           	document.listForm.submit();
        }
        //-->
    </script>
</head>

<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">
    <form:form commandName="searchVO" id="listForm" name="listForm" method="post">
        <input type="hidden" name="selectedId" />
        <div id="content_pop">
        	<!-- 타이틀 -->
        	<div id="title">
        		<ul>
        			<li><img src="<c:url value='/images/egovframework/example/title_dot.gif'/>" alt=""/><spring:message code="list.sample" /></li>
        		</ul>
        	</div>
        	<!-- // 타이틀 -->
        	<div id="search">
        		<div id="firstsearch" style="padding:0 0 0 0;">
        		<ul>
        		<li>
        				<form:select path="searchCondition1" cssClass="use">
        					<form:option value="1" label="전체" />
        					<form:option value="2" label="번역봉사자" />
        					<form:option value="3" label="기관방문" />
        					<form:option value="4" label="일반" />
        					<form:option value="5" label="신청 일시중지" />
        					<form:option value="6" label="직원 일시중지" />
        					<form:option value="7" label="활동 재개테스트" />
        				</form:select>
        			</li>
        			<li>
        				<form:select path="searchCondition2" cssClass="use">
        					<form:option value="0" label="전체" />
        					<form:option value="1" label="새싹" />
        					<form:option value="2" label="열매" />
        				</form:select>
        			</li>
        			<li>
        				<form:select path="searchCondition3" cssClass="use">
        					<form:option value="1" label="모두" />
        					<form:option value="2" label="아동서신" />
        					<form:option value="3" label="후원자서신" />
        				</form:select>
        			</li>
        		</ul>
        		</div>
        		<ul>
        			<li>
        			    <label for="searchCondition" style="visibility:hidden;"><spring:message code="search.choose" /></label>
        				<form:select path="searchCondition" cssClass="use">
        					<form:option value="1" label="이름" />
        					<form:option value="2" label="아이디/이메일" />
        					<form:option value="3" label="휴대전화" />
        					<form:option value="4" label="담당직원" />
        				</form:select>
        			</li>
        			<li><label for="searchKeyword" style="visibility:hidden;display:none;"><spring:message code="search.keyword" /></label>
                        <form:input path="searchKeyword" cssClass="txt"/>
                    </li>
        			<li>
        	            <span class="btn_blue_l">
        	                <a href="javascript:fn_egov_selectList();"><spring:message code="button.search" /></a>
        	                <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
        	            </span>
        	        </li>
                </ul>
        	</div>
        	<!-- List -->
        	<div id="table">
        		<table width="110%" border="0" cellpadding="0" cellspacing="0" >
        			<colgroup>
        				<col width="10"/>
        				<col width="100"/>
        				<col width="50"/>
        				<col width="70"/>
        				<col width="70"/>
        				<col width="70"/>
        				<col width="50"/>
        				<col width="70"/>
        				<col width="60"/>
        				<col width="100"/>
        			</colgroup>
        			<tr>
        				<th align="center">No</th>
        				<th align="center"><spring:message code="title.sample.type" /></th>
        				<th align="center"><spring:message code="title.sample.volunteerStep" /></th>
        				<th align="center"><spring:message code="title.sample.name" /></th>
        				<th align="center"><spring:message code="title.sample.birth" /></th>
        				<th align="center"><spring:message code="title.sample.engName" /></th>
        				<th align="center"><spring:message code="title.sample.email" /></th>
        				<th align="center"><spring:message code="title.sample.translation" /></th>
        				<th align="center"><spring:message code="title.sample.emp" /></th>
        				<th align="center"><spring:message code="title.sample.regdate" /></th>
        			</tr>
        			<c:forEach var="result" items="${resultList}" varStatus="status">
            			<tr>
            				<td align="center" class="listtd"><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></td>
            				
            				<c:choose>
            					<c:when test="${result.type eq '2'}">
	                              <td align="center" class="listtd"><c:out value="번역봉사"/>&nbsp;</td>
	                           </c:when>
	                        	<c:when test="${result.type eq '3'}">
	                              <td align="center" class="listtd"><c:out value="기관방문"/>&nbsp;</td>
	                           </c:when>
	                           <c:when test="${result.type eq '4'}">
	                              <td align="center" class="listtd"><c:out value="일반"/>&nbsp;</td>
	                           </c:when>
	                           <c:when test="${result.type eq '5'}">
	                              <td align="center" class="listtd"><c:out value="신청일시중지"/>&nbsp;</td>
	                           </c:when>
	                           <c:when test="${result.type eq '6'}">
	                              <td align="center" class="listtd"><c:out value="패널티일시중지"/>&nbsp;</td>
	                           </c:when>
	                           <c:when test="${result.type eq '7'}">
	                              <td align="center" class="listtd"><c:out value="직원일시중지"/>&nbsp;</td>
	                           </c:when>
	                           <c:when test="${result.type eq '8'}">
	                              <td align="center" class="listtd"><c:out value="활동재개테스트"/>&nbsp;</td>
	                           </c:when>
	                        </c:choose>
            				<c:choose>
	                        	<c:when test="${result.volunteerStep eq '1'}">
	                              <td align="center" class="listtd"><c:out value="새싹"/>&nbsp;</td>
	                           </c:when>
	                           <c:when test="${result.volunteerStep eq '2'}">
	                              <td align="center" class="listtd"><c:out value="열매"/>&nbsp;</td>
	                           </c:when>
	                        </c:choose>
            				<td align="center" class="listtd"><a href="javascript:fn_egov_select('<c:out value="${result.id}"/>')"><c:out value="${result.name}"/></a></td>
            				<td align="center" class="listtd"><c:out value="${result.birth}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${result.engName}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${result.email}"/>&nbsp;</td>
            				<c:choose>
            					<c:when test="${result.translation eq '1'}">
	                              <td align="center" class="listtd"><c:out value="모두"/>&nbsp;</td>
	                           </c:when>
	                        	<c:when test="${result.translation eq '2'}">
	                              <td align="center" class="listtd"><c:out value="아동서신"/>&nbsp;</td>
	                           </c:when>
	                           <c:when test="${result.translation eq '3'}">
	                              <td align="center" class="listtd"><c:out value="후원자서신"/>&nbsp;</td>
	                           </c:when>
	                        </c:choose>
	                        <c:choose>
	                        	<c:when test="${result.emp eq '1'}">
	                              <td align="center" class="listtd"><c:out value="김직원"/>&nbsp;</td>
	                           </c:when>
	                           <c:when test="${result.emp eq '2'}">
	                              <td align="center" class="listtd"><c:out value="박직원"/>&nbsp;</td>
	                           </c:when>
	                           <c:when test="${result.emp eq '3'}">
	                              <td align="center" class="listtd"><c:out value="최직원"/>&nbsp;</td>
	                           </c:when>
	                        </c:choose>
            				<td align="center" class="listtd"><c:out value="${result.regdate}"/>&nbsp;</td>
            			</tr>
        			</c:forEach>
        		</table>
        	</div>
        	<!-- /List -->
        	<div id="paging">
        		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
        		<form:hidden path="pageIndex" />
        	</div>
        	<div id="sysbtn">
        	  <ul>
        	      <li>
        	          <span class="btn_blue_l">
        	              <a href="javascript:fn_egov_addView();"><spring:message code="button.create" /></a>
                          <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                      </span>
                      <span class="btn_blue_l">
        	              <a href="javascript:fn_egov_excelDown();"><spring:message code="button.excel" /></a>
                          <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                      </span>
                  </li>
              </ul>
				
        	</div>
        </div>
    </form:form>
</body>
</html>
