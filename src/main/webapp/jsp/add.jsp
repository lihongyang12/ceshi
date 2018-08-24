<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/resources/inc/inc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="add" method="post" enctype="multipart/form-data">
		<table>
			<tr>
			<td>
				书名:<input type = "text" name="bname">
			</td>
		</tr>
		
		<tr>
			<td>
				价格:<input type = "text" name="price">
			</td>
		</tr>
		
		<tr>
			<td>
				作者:<input type = "text" name="author">
			</td>
		</tr>
		
	   <tr>
			<td>
				照片:<input type= "file" name="pic">
			</td>
		</tr>
		
		<tr>
			<td>
				出版时间:<input type= "text" name="createtime" class="Wdate" onclick="WdatePicker()">
			</td>
		</tr>
		
		<tr>
			<td>
				出版社:<select name="press.pid">
						<option>请选择</option>
						<c:forEach items="${plist }" var="p">
							<option value="${p.pid }">${p.pname }</option>
						</c:forEach>
					</select>
			</td>
		</tr>
		
		<tr>
			<td>
				<input type= "submit" value="提交">
			</td>
		</tr>
		</table>
		</table>
	</form>
</body>
</html>