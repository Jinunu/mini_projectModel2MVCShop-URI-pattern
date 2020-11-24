<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
<%@ page import="java.util.*"  %>

<%@ page import="com.model2.mvc.common.Search" %>
<%@ page import="com.model2.mvc.service.product.vo.*" %>
<%@page import="com.model2.mvc.common.Page"%>
<%@page import="com.model2.mvc.common.util.CommonUtil"%>

<%
	System.out.println("����Ʈ jsp ����");
	List<ProductVO> list= (List<ProductVO>)request.getAttribute("list");
	Page resultPage=(Page)request.getAttribute("resultPage");


	Search search=(Search)request.getAttribute("search");
	
	String searchCondition = CommonUtil.null2str(search.getSearchCondition());
	String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());
	
	//String menu = (String)request.getAttribute("menu");
	String menu = (String)session.getAttribute("menu");
	System.out.println("list ����  JSP�� : "+menu);
%>
--%>  
 




<html>
<head>

<title>��ǰ �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
//�˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�  
function fncGetProductList(currentPage) {
	document.getElementById("currentPage").value = currentPage;
   	document.detailForm.submit();		
}

//���������� .submit90�� ȣ�� 

</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">
														
<form name="detailForm" action="/listProduct.do?menu=${menu}" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37">
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
				
				<c:if test="${menu eq 'manage' }">
			<%-- 	<%if(menu.equals("manage")){ %>--%>
					<td width="93%" class="ct_ttl01">��ǰ ����</td>
				</c:if>
			
			
		<%--<%}else{ %>--%>
		<c:if test="${ !(menu eq 'manage') }">
			<td width="93%" class="ct_ttl01">��ǰ �����ȸ</td>
	</c:if>
				</tr>
			</table>
		</td>
		
		<%--<%} %>--%>
		
		
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37">
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
	
		<td align="right">
		<select name="searchCondition" class="ct_input_g" style="width:80px">
			<%-- 	<option value="0" <%= (searchCondition.equals("0") ? "selected" : "")%>>��ǰ��ȣ</option>
					<option value="1" <%= (searchCondition.equals("1") ? "selected" : "")%>>��ǰ��</option>--%>
					<option value="0" ${! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
					<option value="1" ${search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
					<option value="2" ${search.searchCondition==2 ? "selected" : "" }>�������ݼ�</option>
					<option value="3" ${search.searchCondition==3 ? "selected" : "" }>�������ݼ�</option>
			</select>
			
			<input 	type="text" name="searchKeyword"  value="${! empty search.searchKeyword ? search.searchKeyword : ""}" 
							class="ct_input_g" style="width:200px; height:19px" >
							<button id="search" onclick="javascript:fncGetProductList('1');">�˻�</button>
		</td>
	
					
						
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >��ü ${resultPage.totalCount } �Ǽ�, ����  ${resultPage.currentPage } ������</td>
	</tr>
	<tr>
		<td class="ct_list_b" >No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" >��ǰ��</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" >����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" >�����</td>	
		<td class="ct_list_b" >�������</td>
		<td class="ct_line02"></td>
		
			
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	
	 
	<%--<% 	
		int no=list.size();
		System.out.println(no);
		for(int i=0; i<list.size(); i++) {
			ProductVO vo = (ProductVO)list.get(i);
	--%>
	
	<c:set var="i" value="0" />
	<c:forEach var="product" items="${list}">
	<c:set var="i" value="${i+1 }"/>
	<tr class="ct_list_pop">
			<td align="center">${ i }</td>
		<td></td>
		<td align="left">
			<a href="/getProduct.do?prodNo=${product.prodNo }&menu=${menu}">${product.prodName}</a>
		</td>
		<td></td>
		<td align="left">${product.price}</td>
		<td></td>
		<td align="left">${product.regDate}
		</td>
		
		<c:if test="${! (menu eq 'manage') }">
		<c:if test="${product.proTranCode==null}">
		<%--<%if(vo.getProTranCode()==null){ --%>		
		<td align="left">�Ǹ���
		</c:if>
		<c:if test="${!(product.proTranCode==null)}">
		<td align="left">�������.
		</c:if>
		</c:if>
		
		<c:if test="${ menu eq 'manage' }">
		<c:if test="${product.proTranCode==null}">
		<td align="left">�Ǹ���
		</c:if>
		<c:if test="${product.proTranCode=='0  '}">
		<td align="left">���ſϷ� <a href="/updateTranCode.do?tranCode=${product.proTranCode}&prodNo=${product.prodNo}">����ϱ�</a>
		</c:if>
		<c:if test="${product.proTranCode=='1  '}">
			<td align="left">�����
		</td>	
		</c:if>
		<c:if test="${product.proTranCode=='2  '}">
			<td align="left">��ۿϷ�
		</td>	
		</c:if>
		</c:if>
		
		<%--<%}else{ --%>
		</td>	
		<%--<%} --%>
	</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
	
	<%--<% } --%>
	</c:forEach>
</table>

	
	

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
	<td align="center">
	<input type="hidden" id="currentPage" name="currentPage" value=""/>
	
	<!-- jsp include ���� EL�� import�� ��� �ؼ� pageNavigator�� �������̽�ȭ ��Ŵ .. ���� � page�� ������ value(fnc)�� �ٲ��ָ� �� ��밡�� -->
	<c:set var="fnc" value="fncGetProductList" scope="request" />
	
	<c:import var="pageNavi" url="/common/pageNavigator.jsp" scope="request"/>
	${pageNavi}
	
	
		
    	</td>
	</tr>
</table>
<!--  ������ Navigator �� -->
</form>
</div>

</body>
</html>